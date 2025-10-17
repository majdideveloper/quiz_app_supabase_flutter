-- Seed Data for Development
-- Creates sample data for testing the application

-- Note: In production, you'll need to create users through Supabase Auth
-- This seed data assumes users have been created with the following IDs
-- You can replace these UUIDs with actual user IDs from your auth.users table

-- ============================================================================
-- SAMPLE PROFILES
-- ============================================================================
-- These will be automatically created by the trigger when users sign up
-- But we can insert test profiles directly for development 
-- ============================================================================
-- CREATE FAKE USERS IN auth.users FOR DEV
-- ============================================================================
INSERT INTO auth.users (id, email)
VALUES
  ('00000000-0000-0000-0000-000000000001', 'admin@formationmetiers.ca'),
  ('00000000-0000-0000-0000-000000000002', 'instructor@formationmetiers.ca'),
  ('00000000-0000-0000-0000-000000000003', 'student1@example.com'),
  ('00000000-0000-0000-0000-000000000004', 'student2@example.com')
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.profiles (id, email, full_name, role) VALUES
  ('00000000-0000-0000-0000-000000000001', 'admin@formationmetiers.ca', 'Admin User', 'admin'),
  ('00000000-0000-0000-0000-000000000002', 'instructor@formationmetiers.ca', 'Jean Tremblay', 'instructor'),
  ('00000000-0000-0000-0000-000000000003', 'student1@example.com', 'Marie Dubois', 'student'),
  ('00000000-0000-0000-0000-000000000004', 'student2@example.com', 'Pierre Martin', 'student')
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- SAMPLE COURSES
-- ============================================================================
INSERT INTO public.courses (id, title, description, category, level, duration_hours, price, instructor_id, is_published) VALUES
  (
    '10000000-0000-0000-0000-000000000001',
    'Électricien de Construction - Préparation CCQ',
    'Cours complet de préparation à l''examen de qualification CCQ pour électricien de construction. Couvre tous les aspects du Code canadien de l''électricité et les pratiques sécuritaires sur les chantiers.',
    'ccq',
    'intermediate',
    120,
    499.99,
    '00000000-0000-0000-0000-000000000002',
    true
  ),
  (
    '10000000-0000-0000-0000-000000000002',
    'Sécurité Électrique de Base',
    'Formation essentielle sur la sécurité électrique pour tous les travailleurs. Apprenez les principes fondamentaux de la sécurité, la prévention des accidents et les procédures d''urgence.',
    'non_construction',
    'beginner',
    20,
    99.99,
    '00000000-0000-0000-0000-000000000002',
    true
  ),
  (
    '10000000-0000-0000-0000-000000000003',
    'Sceau Rouge - Électricien Industriel',
    'Préparation complète pour l''examen Sceau Rouge en électricité industrielle. Comprend la théorie avancée, les systèmes de contrôle et l''instrumentation.',
    'red_seal',
    'advanced',
    200,
    799.99,
    '00000000-0000-0000-0000-000000000002',
    true
  )
ON CONFLICT (id) DO NOTHING;

-- ============================================================================
-- SAMPLE LESSONS
-- ============================================================================
INSERT INTO public.lessons (course_id, title, description, content, order_index, duration_minutes) VALUES
  -- Course 1 Lessons
  (
    '10000000-0000-0000-0000-000000000001',
    'Introduction au Code Canadien de l''Électricité',
    'Vue d''ensemble du CCE et son importance dans le travail quotidien',
    'Le Code canadien de l''électricité (CCE) est la norme de référence pour toutes les installations électriques au Canada. Ce module vous introduit aux principes de base et à la structure du code.',
    1,
    60
  ),
  (
    '10000000-0000-0000-0000-000000000001',
    'Câblage Résidentiel',
    'Techniques et normes pour le câblage des maisons',
    'Apprenez les techniques appropriées pour le câblage résidentiel, incluant les circuits d''éclairage, les prises de courant, et les circuits spécialisés.',
    2,
    90
  ),
  (
    '10000000-0000-0000-0000-000000000001',
    'Panneaux Électriques et Distribution',
    'Installation et maintenance des panneaux de distribution',
    'Comprenez le fonctionnement des panneaux électriques, leur installation correcte et les normes de sécurité associées.',
    3,
    75
  ),
  (
    '10000000-0000-0000-0000-000000000001',
    'Mise à la Terre et Liaison',
    'Systèmes de mise à la terre et leur importance',
    'La mise à la terre appropriée est essentielle pour la sécurité. Ce module couvre tous les aspects des systèmes de mise à la terre.',
    4,
    60
  ),
  -- Course 2 Lessons
  (
    '10000000-0000-0000-0000-000000000002',
    'Principes de Base de l''Électricité',
    'Comprendre le courant, la tension et la résistance',
    'Introduction aux concepts fondamentaux de l''électricité: voltage, ampérage, résistance et la loi d''Ohm.',
    1,
    45
  ),
  (
    '10000000-0000-0000-0000-000000000002',
    'Dangers Électriques et Prévention',
    'Identifier et éviter les dangers électriques',
    'Apprenez à reconnaître les situations dangereuses et les mesures préventives pour assurer votre sécurité.',
    2,
    45
  ),
  (
    '10000000-0000-0000-0000-000000000002',
    'Équipement de Protection Individuelle',
    'Utilisation appropriée de l''EPI électrique',
    'Guide complet sur l''équipement de protection nécessaire pour travailler en toute sécurité avec l''électricité.',
    3,
    30
  )
ON CONFLICT DO NOTHING;

-- ============================================================================
-- SAMPLE QUIZZES
-- ============================================================================
INSERT INTO public.quizzes (course_id, title, description, quiz_type, passing_score, time_limit_minutes, max_attempts, order_index, is_required) VALUES
  (
    '10000000-0000-0000-0000-000000000001',
    'Quiz: Code Canadien de l''Électricité',
    'Testez vos connaissances sur les bases du CCE',
    'lesson',
    70,
    30,
    NULL,
    1,
    true
  ),
  (
    '10000000-0000-0000-0000-000000000001',
    'Quiz: Câblage Résidentiel',
    'Évaluez votre compréhension du câblage résidentiel',
    'lesson',
    70,
    30,
    NULL,
    2,
    true
  ),
  (
    '10000000-0000-0000-0000-000000000001',
    'Examen Final - CCQ',
    'Examen complet de fin de cours',
    'final',
    80,
    120,
    3,
    5,
    true
  ),
  (
    '10000000-0000-0000-0000-000000000002',
    'Quiz: Sécurité de Base',
    'Questions sur les principes de sécurité',
    'lesson',
    75,
    20,
    NULL,
    1,
    true
  )
ON CONFLICT DO NOTHING;

-- ============================================================================
-- SAMPLE QUIZ QUESTIONS
-- ============================================================================
INSERT INTO public.quiz_questions (quiz_id, question_text, question_type, options, correct_answer, explanation, points, order_index) VALUES
  (
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Code Canadien de l''Électricité' LIMIT 1),
    'Quelle est la tension standard pour les prises résidentielles au Canada?',
    'multiple_choice',
    '["110V", "120V", "220V", "240V"]'::jsonb,
    '"120V"'::jsonb,
    'La tension standard pour les prises résidentielles au Canada est de 120V.',
    1,
    1
  ),
  (
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Code Canadien de l''Électricité' LIMIT 1),
    'Le Code canadien de l''électricité est mis à jour tous les combien d''années?',
    'multiple_choice',
    '["1 an", "2 ans", "3 ans", "5 ans"]'::jsonb,
    '"3 ans"'::jsonb,
    'Le CCE est révisé et mis à jour sur un cycle de 3 ans.',
    1,
    2
  ),
  (
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Code Canadien de l''Électricité' LIMIT 1),
    'La mise à la terre est obligatoire pour tous les circuits électriques.',
    'true_false',
    '["Vrai", "Faux"]'::jsonb,
    '"Vrai"'::jsonb,
    'Tous les circuits électriques doivent être correctement mis à la terre pour la sécurité.',
    1,
    3
  ),
  (
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Sécurité de Base' LIMIT 1),
    'Avant de travailler sur un circuit électrique, vous devez toujours:',
    'multiple_choice',
    '["Couper l''alimentation et vérifier", "Porter des gants", "Avertir votre superviseur", "Toutes ces réponses"]'::jsonb,
    '"Couper l''alimentation et vérifier"'::jsonb,
    'La première étape de sécurité est toujours de couper l''alimentation et de vérifier qu''il n''y a plus de courant.',
    1,
    1
  ),
  (
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Sécurité de Base' LIMIT 1),
    'Quel équipement de protection est essentiel lors de travaux électriques?',
    'multiple_select',
    '["Gants isolants", "Lunettes de sécurité", "Chaussures de sécurité", "Casque"]'::jsonb,
    '["Gants isolants", "Lunettes de sécurité", "Chaussures de sécurité"]'::jsonb,
    'Les gants isolants, lunettes et chaussures de sécurité sont tous essentiels. Le casque est recommandé selon le contexte.',
    2,
    2
  )
ON CONFLICT DO NOTHING;

-- ============================================================================
-- SAMPLE ENROLLMENTS
-- ============================================================================
INSERT INTO public.enrollments (user_id, course_id, progress_percentage) VALUES
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000001', 25),
  ('00000000-0000-0000-0000-000000000003', '10000000-0000-0000-0000-000000000002', 0),
  ('00000000-0000-0000-0000-000000000004', '10000000-0000-0000-0000-000000000002', 100)
ON CONFLICT (user_id, course_id) DO NOTHING;

-- ============================================================================
-- SAMPLE USER LESSON PROGRESS
-- ============================================================================
INSERT INTO public.user_lesson_progress (user_id, lesson_id, is_completed, time_spent_minutes, completed_at) VALUES
  (
    '00000000-0000-0000-0000-000000000003',
    (SELECT id FROM public.lessons WHERE title = 'Introduction au Code Canadien de l''Électricité' LIMIT 1),
    true,
    65,
    NOW() - INTERVAL '2 days'
  ),
  (
    '00000000-0000-0000-0000-000000000004',
    (SELECT id FROM public.lessons WHERE title = 'Principes de Base de l''Électricité' LIMIT 1),
    true,
    50,
    NOW() - INTERVAL '5 days'
  ),
  (
    '00000000-0000-0000-0000-000000000004',
    (SELECT id FROM public.lessons WHERE title = 'Dangers Électriques et Prévention' LIMIT 1),
    true,
    48,
    NOW() - INTERVAL '3 days'
  ),
  (
    '00000000-0000-0000-0000-000000000004',
    (SELECT id FROM public.lessons WHERE title = 'Équipement de Protection Individuelle' LIMIT 1),
    true,
    35,
    NOW() - INTERVAL '1 day'
  )
ON CONFLICT (user_id, lesson_id) DO NOTHING;

-- ============================================================================
-- SAMPLE QUIZ ATTEMPTS
-- ============================================================================
INSERT INTO public.quiz_attempts (user_id, quiz_id, attempt_number, score, percentage, passed, answers, time_spent_minutes, completed_at) VALUES
  (
    '00000000-0000-0000-0000-000000000004',
    (SELECT id FROM public.quizzes WHERE title = 'Quiz: Sécurité de Base' LIMIT 1),
    1,
    4,
    80.00,
    true,
    '{"q1": "Couper l''alimentation et vérifier", "q2": ["Gants isolants", "Lunettes de sécurité", "Chaussures de sécurité"]}'::jsonb,
    18,
    NOW() - INTERVAL '1 day'
  )
ON CONFLICT (user_id, quiz_id, attempt_number) DO NOTHING;

-- Display seed data summary
DO $$
BEGIN
  RAISE NOTICE 'Seed data inserted successfully!';
  RAISE NOTICE 'Profiles: %', (SELECT COUNT(*) FROM public.profiles);
  RAISE NOTICE 'Courses: %', (SELECT COUNT(*) FROM public.courses);
  RAISE NOTICE 'Lessons: %', (SELECT COUNT(*) FROM public.lessons);
  RAISE NOTICE 'Quizzes: %', (SELECT COUNT(*) FROM public.quizzes);
  RAISE NOTICE 'Quiz Questions: %', (SELECT COUNT(*) FROM public.quiz_questions);
  RAISE NOTICE 'Enrollments: %', (SELECT COUNT(*) FROM public.enrollments);
END $$;
