-- Seed sample data for testing
-- Creates: 2 courses, 6 lessons, 2 quizzes, 6 questions, 20 answers
-- All content uses simple English to avoid encoding issues

DO $$
DECLARE
  instructor_uuid UUID := '11111111-1111-1111-1111-111111111111';
  course1_id UUID := '11111111-2222-3333-4444-111111111111';
  course2_id UUID := '22222222-2222-3333-4444-222222222222';
  lesson1_1_id UUID := '11111111-3333-4444-5555-111111111111';
  lesson1_2_id UUID := '11111112-3333-4444-5555-111111111111';
  lesson1_3_id UUID := '11111113-3333-4444-5555-111111111111';
  lesson2_1_id UUID := '22222221-3333-4444-5555-111111111111';
  lesson2_2_id UUID := '22222222-3333-4444-5555-111111111111';
  lesson2_3_id UUID := '22222223-3333-4444-5555-111111111111';
  quiz1_id UUID := '11111111-4444-5555-6666-111111111111';
  quiz2_id UUID := '22222221-4444-5555-6666-111111111111';
BEGIN
  -- Create test instructor user in auth.users
  INSERT INTO auth.users (id, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_user_meta_data)
  VALUES (
    instructor_uuid,
    'instructor@formation-metiers.ca',
    crypt('Password123!', gen_salt('bf')),
    NOW(),
    NOW(),
    NOW(),
    '{"full_name": "Jean Tremblay"}'::jsonb
  )
  ON CONFLICT (id) DO NOTHING;

  -- Create profile for the instructor
  INSERT INTO profiles (id, email, full_name, role)
  VALUES (
    instructor_uuid,
    'instructor@formation-metiers.ca',
    'Jean Tremblay',
    'instructor'
  )
  ON CONFLICT (id) DO NOTHING;

  -- ============================================================================
  -- COURSES (matching actual schema)
  -- ============================================================================

  -- Course 1: Electrician CCQ
  INSERT INTO courses (
    id, title, description, category, level, duration_hours, price, image_url,
    instructor_id, is_published
  ) VALUES (
    course1_id,
    'Electrician CCQ - Level 1',
    'Complete training to become a certified CCQ electrician. Learn residential, commercial and industrial electricity basics. Covers safety standards, Quebec Electrical Code, and essential installation techniques.',
    'ccq',
    'beginner',
    30,
    0.00,
    'https://images.unsplash.com/photo-1621905251918-48416bd8575a?w=800',
    instructor_uuid,
    true
  );

  -- Course 2: Plumber CCQ
  INSERT INTO courses (
    id, title, description, category, level, duration_hours, price, image_url,
    instructor_id, is_published
  ) VALUES (
    course2_id,
    'Plumber CCQ - Introduction',
    'Discover the plumbing trade with this introductory training. Master installation and repair of residential and commercial plumbing systems, blueprint reading, and Quebec Plumbing Code standards.',
    'ccq',
    'beginner',
    25,
    0.00,
    'https://images.unsplash.com/photo-1607472586893-edb57bdc0e39?w=800',
    instructor_uuid,
    true
  );

  -- ============================================================================
  -- LESSONS (matching actual schema: duration_minutes, no is_preview)
  -- ============================================================================

  -- Course 1 Lessons
  INSERT INTO lessons (id, course_id, title, description, content, video_url, order_index, duration_minutes)
  VALUES
    (
      lesson1_1_id,
      course1_id,
      'Introduction to Electricity',
      'Basic concepts of electricity: voltage, current, resistance, and Ohms Law.',
      'This lesson covers fundamental electrical principles. Learn definitions of voltage, current, resistance, and how these concepts relate through Ohms Law (V=IR). Explore series and parallel circuits.',
      'https://www.youtube.com/watch?v=mc979OhitAg',
      1,
      45
    ),
    (
      lesson1_2_id,
      course1_id,
      'Electrical Safety and PPE',
      'Essential safety standards and proper use of personal protective equipment.',
      'Safety is paramount for electricians. This lesson details electrical hazards (shock, burns, arc flash), lockout procedures, PPE use (insulating gloves, goggles, hard hats), and safe work procedures per CNESST standards.',
      'https://www.youtube.com/watch?v=8qQcqCLw9YU',
      2,
      60
    ),
    (
      lesson1_3_id,
      course1_id,
      'Quebec Electrical Code',
      'Understanding Quebec Electrical Code requirements for installations.',
      'The Quebec Electrical Code is the reference for all electrical installations. Study code structure, main sections, residential requirements, and how to navigate this technical document effectively.',
      'https://www.youtube.com/watch?v=bHILA6o3I5E',
      3,
      75
    );

  -- Course 2 Lessons
  INSERT INTO lessons (id, course_id, title, description, content, video_url, order_index, duration_minutes)
  VALUES
    (
      lesson2_1_id,
      course2_id,
      'Introduction to Plumbing',
      'Plumbing basics: water supply and drainage systems.',
      'This introductory lesson covers two main plumbing systems: pressurized potable water supply and gravity-fed wastewater drainage. Learn basic components, materials (copper, PEX, PVC, ABS), and fundamental hydraulic principles.',
      'https://www.youtube.com/watch?v=pXeZT9N3WOc',
      1,
      50
    ),
    (
      lesson2_2_id,
      course2_id,
      'Reading Plumbing Plans',
      'Learn to read and interpret plumbing plans and diagrams.',
      'Blueprint reading is essential for plumbers. Learn to interpret plumbing symbols, understand isometric drawings, calculate dimensions and slopes, and coordinate with architectural and mechanical plans.',
      'https://www.youtube.com/watch?v=vYtH7JK9oQo',
      2,
      60
    ),
    (
      lesson2_3_id,
      course2_id,
      'Piping Installation',
      'Techniques for cutting, assembling and installing residential piping.',
      'Master piping installation: precise pipe cutting, surface preparation, assembly by soldering (copper), gluing (PVC/ABS), or mechanical fittings (PEX). Includes best practices for supports, insulation, and leak testing.',
      'https://www.youtube.com/watch?v=B5Dj_pXj5FA',
      3,
      80
    );

  -- ============================================================================
  -- QUIZZES (matching actual schema: course_id required, time_limit_minutes)
  -- ============================================================================

  INSERT INTO quizzes (
    id, course_id, lesson_id, title, description, quiz_type,
    passing_score, time_limit_minutes, max_attempts, order_index, is_required
  ) VALUES
    (
      quiz1_id,
      course1_id,
      lesson1_1_id,
      'Quiz: Electricity Fundamentals',
      'Test your knowledge of basic electricity concepts and Ohms Law.',
      'lesson',
      70,
      10,
      3,
      1,
      true
    ),
    (
      quiz2_id,
      course2_id,
      lesson2_1_id,
      'Quiz: Plumbing Basics',
      'Verify your understanding of supply and drainage systems.',
      'lesson',
      70,
      10,
      3,
      1,
      true
    );

  -- ============================================================================
  -- QUIZ QUESTIONS
  -- ============================================================================

  -- Questions for Quiz 1 (Electricity)
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, options, correct_answer, points, order_index)
  VALUES
    ('11111111-5555-6666-7777-111111111111', quiz1_id,
     'What is the unit of measurement for electrical voltage?', 'multiple_choice',
     '["Volt (V)", "Ampere (A)", "Ohm", "Watt (W)"]'::jsonb,
     '["Volt (V)"]'::jsonb, 10, 1),
    ('11111112-5555-6666-7777-111111111111', quiz1_id,
     'According to Ohms Law, if voltage increases and resistance stays constant, what happens to current?', 'multiple_choice',
     '["Current increases", "Current decreases", "Current stays constant", "Resistance changes"]'::jsonb,
     '["Current increases"]'::jsonb, 10, 2),
    ('11111113-5555-6666-7777-111111111111', quiz1_id,
     'In a series circuit, current is the same everywhere in the circuit.', 'true_false',
     '["True", "False"]'::jsonb,
     '["True"]'::jsonb, 10, 3);

  -- Questions for Quiz 2 (Plumbing)
  INSERT INTO quiz_questions (id, quiz_id, question_text, question_type, options, correct_answer, points, order_index)
  VALUES
    ('22222111-5555-6666-7777-111111111111', quiz2_id,
     'The drainage system works by gravity.', 'true_false',
     '["True", "False"]'::jsonb,
     '["True"]'::jsonb, 10, 1),
    ('22222112-5555-6666-7777-111111111111', quiz2_id,
     'What is the most common material for residential drainage piping?', 'multiple_choice',
     '["Copper", "PVC or ABS", "Galvanized steel", "Cast iron"]'::jsonb,
     '["PVC or ABS"]'::jsonb, 10, 2),
    ('22222113-5555-6666-7777-111111111111', quiz2_id,
     'Which pipe types can be used for potable water supply?', 'multiple_select',
     '["Copper", "PEX", "CPVC", "PVC"]'::jsonb,
     '["Copper", "PEX", "CPVC"]'::jsonb, 15, 3);

END $$;
