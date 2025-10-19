-- Fix RLS policies for lessons and quizzes
-- Allow public viewing of lessons and quizzes for published courses
-- This enables users to preview content before enrolling

-- ============================================================================
-- DROP OLD POLICIES
-- ============================================================================

DROP POLICY IF EXISTS "Lessons visible to enrolled students and course owners" ON public.lessons;
DROP POLICY IF EXISTS "Quizzes visible to enrolled students and course owners" ON public.quizzes;
DROP POLICY IF EXISTS "Questions visible to enrolled students and course owners" ON public.quiz_questions;

-- ============================================================================
-- NEW LESSONS POLICY - Allow viewing lessons for published courses
-- ============================================================================

CREATE POLICY "Lessons visible for published courses"
  ON public.lessons FOR SELECT
  USING (
    -- Course is published (public preview)
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = lessons.course_id AND is_published = true
    )
    -- Or user is enrolled in the course
    OR EXISTS (
      SELECT 1 FROM public.enrollments
      WHERE user_id = auth.uid() AND course_id = lessons.course_id
    )
    -- Or user is the course instructor
    OR EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = lessons.course_id AND instructor_id = auth.uid()
    )
    -- Or user is an admin
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- NEW QUIZZES POLICY - Allow viewing quizzes for published courses
-- ============================================================================

CREATE POLICY "Quizzes visible for published courses"
  ON public.quizzes FOR SELECT
  USING (
    -- Course is published (public preview)
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = quizzes.course_id AND is_published = true
    )
    -- Or user is enrolled in the course
    OR EXISTS (
      SELECT 1 FROM public.enrollments
      WHERE user_id = auth.uid() AND course_id = quizzes.course_id
    )
    -- Or user is the course instructor
    OR EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = quizzes.course_id AND instructor_id = auth.uid()
    )
    -- Or user is an admin
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- NEW QUIZ QUESTIONS POLICY - Allow viewing questions for published courses
-- ============================================================================

CREATE POLICY "Questions visible for published courses"
  ON public.quiz_questions FOR SELECT
  USING (
    -- Course is published (public preview via quizzes)
    EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_questions.quiz_id AND c.is_published = true
    )
    -- Or user is enrolled
    OR EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.enrollments e ON e.course_id = q.course_id
      WHERE q.id = quiz_questions.quiz_id AND e.user_id = auth.uid()
    )
    -- Or user is the course instructor
    OR EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_questions.quiz_id AND c.instructor_id = auth.uid()
    )
    -- Or user is an admin
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );
