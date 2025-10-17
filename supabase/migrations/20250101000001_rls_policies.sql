-- Row Level Security Policies
-- Defines access control rules for all tables

-- ============================================================================
-- PROFILES TABLE POLICIES
-- ============================================================================

-- Allow everyone to view public profiles
CREATE POLICY "Public profiles are viewable by everyone"
  ON public.profiles FOR SELECT
  USING (true);

-- Users can insert their own profile (handled by trigger)
CREATE POLICY "Users can insert own profile"
  ON public.profiles FOR INSERT
  WITH CHECK (auth.uid() = id);

-- Users can update their own profile
CREATE POLICY "Users can update own profile"
  ON public.profiles FOR UPDATE
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- ============================================================================
-- COURSES TABLE POLICIES
-- ============================================================================

-- Published courses are viewable by everyone
CREATE POLICY "Published courses are viewable by everyone"
  ON public.courses FOR SELECT
  USING (
    is_published = true
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
    OR auth.uid() = instructor_id
  );

-- Instructors and admins can create courses
CREATE POLICY "Instructors and admins can create courses"
  ON public.courses FOR INSERT
  WITH CHECK (
    auth.uid() IN (
      SELECT id FROM public.profiles
      WHERE role IN ('instructor', 'admin')
    )
  );

-- Instructors can update their own courses, admins can update any
CREATE POLICY "Instructors can update own courses, admins update any"
  ON public.courses FOR UPDATE
  USING (
    auth.uid() = instructor_id
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Admins can delete courses
CREATE POLICY "Admins can delete courses"
  ON public.courses FOR DELETE
  USING (
    auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- LESSONS TABLE POLICIES
-- ============================================================================

-- Lessons visible to enrolled students and instructors/admins
CREATE POLICY "Lessons visible to enrolled students and course owners"
  ON public.lessons FOR SELECT
  USING (
    -- User is enrolled in the course
    EXISTS (
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

-- Course instructors and admins can create lessons
CREATE POLICY "Course instructors and admins can create lessons"
  ON public.lessons FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can update lessons
CREATE POLICY "Course instructors and admins can update lessons"
  ON public.lessons FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can delete lessons
CREATE POLICY "Course instructors and admins can delete lessons"
  ON public.lessons FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- QUIZZES TABLE POLICIES
-- ============================================================================

-- Quizzes visible to enrolled students and course owners
CREATE POLICY "Quizzes visible to enrolled students and course owners"
  ON public.quizzes FOR SELECT
  USING (
    -- User is enrolled in the course
    EXISTS (
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

-- Course instructors and admins can create quizzes
CREATE POLICY "Course instructors and admins can create quizzes"
  ON public.quizzes FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can update quizzes
CREATE POLICY "Course instructors and admins can update quizzes"
  ON public.quizzes FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can delete quizzes
CREATE POLICY "Course instructors and admins can delete quizzes"
  ON public.quizzes FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- QUIZ QUESTIONS TABLE POLICIES
-- ============================================================================

-- Questions visible to enrolled students and course owners
CREATE POLICY "Questions visible to enrolled students and course owners"
  ON public.quiz_questions FOR SELECT
  USING (
    EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.enrollments e ON e.course_id = q.course_id
      WHERE q.id = quiz_questions.quiz_id AND e.user_id = auth.uid()
    )
    OR EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_questions.quiz_id AND c.instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can create questions
CREATE POLICY "Course instructors and admins can create questions"
  ON public.quiz_questions FOR INSERT
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_id AND c.instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can update questions
CREATE POLICY "Course instructors and admins can update questions"
  ON public.quiz_questions FOR UPDATE
  USING (
    EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_id AND c.instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- Course instructors and admins can delete questions
CREATE POLICY "Course instructors and admins can delete questions"
  ON public.quiz_questions FOR DELETE
  USING (
    EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_id AND c.instructor_id = auth.uid()
    )
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
  );

-- ============================================================================
-- ENROLLMENTS TABLE POLICIES
-- ============================================================================

-- Users can view their own enrollments
CREATE POLICY "Users can view own enrollments"
  ON public.enrollments FOR SELECT
  USING (
    auth.uid() = user_id
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
    OR EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = enrollments.course_id AND instructor_id = auth.uid()
    )
  );

-- Users can enroll in published courses
CREATE POLICY "Users can enroll in published courses"
  ON public.enrollments FOR INSERT
  WITH CHECK (
    auth.uid() = user_id
    AND EXISTS (
      SELECT 1 FROM public.courses
      WHERE id = course_id AND is_published = true
    )
  );

-- Users can update their own enrollment progress (via trigger)
CREATE POLICY "System can update enrollment progress"
  ON public.enrollments FOR UPDATE
  USING (true);

-- ============================================================================
-- USER LESSON PROGRESS TABLE POLICIES
-- ============================================================================

-- Users can view their own lesson progress
CREATE POLICY "Users can view own lesson progress"
  ON public.user_lesson_progress FOR SELECT
  USING (
    auth.uid() = user_id
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
    OR EXISTS (
      SELECT 1 FROM public.lessons l
      JOIN public.courses c ON c.id = l.course_id
      WHERE l.id = user_lesson_progress.lesson_id AND c.instructor_id = auth.uid()
    )
  );

-- Users can create their own lesson progress
CREATE POLICY "Users can create own lesson progress"
  ON public.user_lesson_progress FOR INSERT
  WITH CHECK (
    auth.uid() = user_id
    AND EXISTS (
      SELECT 1 FROM public.lessons l
      JOIN public.enrollments e ON e.course_id = l.course_id
      WHERE l.id = lesson_id AND e.user_id = auth.uid()
    )
  );

-- Users can update their own lesson progress
CREATE POLICY "Users can update own lesson progress"
  ON public.user_lesson_progress FOR UPDATE
  USING (auth.uid() = user_id)
  WITH CHECK (auth.uid() = user_id);

-- ============================================================================
-- QUIZ ATTEMPTS TABLE POLICIES
-- ============================================================================

-- Users can view their own quiz attempts
CREATE POLICY "Users can view own quiz attempts"
  ON public.quiz_attempts FOR SELECT
  USING (
    auth.uid() = user_id
    OR auth.uid() IN (
      SELECT id FROM public.profiles WHERE role = 'admin'
    )
    OR EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.courses c ON c.id = q.course_id
      WHERE q.id = quiz_attempts.quiz_id AND c.instructor_id = auth.uid()
    )
  );

-- Users can create their own quiz attempts
CREATE POLICY "Users can create own quiz attempts"
  ON public.quiz_attempts FOR INSERT
  WITH CHECK (
    auth.uid() = user_id
    AND EXISTS (
      SELECT 1 FROM public.quizzes q
      JOIN public.enrollments e ON e.course_id = q.course_id
      WHERE q.id = quiz_id AND e.user_id = auth.uid()
    )
  );

-- Users can update their own incomplete quiz attempts
CREATE POLICY "Users can update own incomplete quiz attempts"
  ON public.quiz_attempts FOR UPDATE
  USING (
    auth.uid() = user_id
    AND completed_at IS NULL
  )
  WITH CHECK (
    auth.uid() = user_id
  );
