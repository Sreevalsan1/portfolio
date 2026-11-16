-- ==============================================================================
-- SREEVALSAN K BHASURAN - PORTFOLIO DATABASE SCHEMA (SUPABASE POSTGRESQL + RLS)
-- ==============================================================================
-- Run this script in your Supabase SQL Editor (Dashboard -> SQL Editor -> New Query)
-- This creates all required tables, Row-Level-Security (RLS) policies, and initial seeds.

-- 1. EXTENSIONS
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- 2. PROFILES TABLE
CREATE TABLE IF NOT EXISTS public.profiles (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL DEFAULT 'Sreevalsan K Bhasuran',
    headline TEXT NOT NULL DEFAULT 'First-Year B.Tech CSE Student | Aspiring Software Developer | Lifelong Learner',
    bio TEXT NOT NULL,
    about_text TEXT NOT NULL,
    email TEXT DEFAULT 'sreevalsankbhasuran@gmail.com',
    phone TEXT DEFAULT '',
    location TEXT DEFAULT 'India',
    avatar_url TEXT DEFAULT '',
    github_url TEXT DEFAULT 'https://github.com',
    linkedin_url TEXT DEFAULT 'https://linkedin.com',
    twitter_url TEXT DEFAULT 'https://twitter.com',
    resume_url TEXT DEFAULT '',
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 3. SKILLS TABLE
CREATE TABLE IF NOT EXISTS public.skills (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    category TEXT NOT NULL DEFAULT 'Programming Languages',
    proficiency_level TEXT NOT NULL DEFAULT 'Foundational',
    description TEXT,
    icon_name TEXT DEFAULT 'Code',
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 4. LEARNING JOURNAL TABLE ("Currently Learning")
CREATE TABLE IF NOT EXISTS public.learning_journal (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    category TEXT DEFAULT 'Computer Science',
    description TEXT,
    status TEXT NOT NULL DEFAULT 'In Progress', -- 'In Progress', 'Exploring', 'Completed', 'Planned'
    date_started DATE DEFAULT CURRENT_DATE,
    completion_date DATE,
    resources TEXT,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 5. PROJECTS TABLE
CREATE TABLE IF NOT EXISTS public.projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    tech_stack TEXT[] DEFAULT '{}',
    status TEXT NOT NULL DEFAULT 'Planning', -- 'Planning', 'In Progress', 'Completed'
    github_url TEXT DEFAULT '',
    live_url TEXT DEFAULT '',
    image_url TEXT DEFAULT '',
    is_published BOOLEAN DEFAULT true,
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 6. ACHIEVEMENTS TABLE
CREATE TABLE IF NOT EXISTS public.achievements (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    category TEXT NOT NULL DEFAULT 'Certifications', -- 'Certifications', 'Hackathons', 'Coding competitions', 'Workshops', 'Awards'
    issuer TEXT,
    issue_date DATE,
    description TEXT,
    credential_url TEXT DEFAULT '',
    image_url TEXT DEFAULT '',
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 7. EDUCATION TABLE
CREATE TABLE IF NOT EXISTS public.education (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    degree TEXT NOT NULL DEFAULT 'B.Tech in Computer Science and Engineering',
    institution TEXT NOT NULL DEFAULT 'University Engineering College',
    academic_year TEXT NOT NULL DEFAULT 'First Year',
    start_year INT DEFAULT 2024,
    end_year INT DEFAULT 2028,
    grade TEXT DEFAULT '',
    description TEXT DEFAULT 'Core foundational studies in Computer Science, Data Structures, Algorithms, and Software Engineering principles.',
    milestones TEXT[] DEFAULT '{}',
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 8. SITE SETTINGS TABLE
CREATE TABLE IF NOT EXISTS public.site_settings (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    taglines TEXT[] DEFAULT ARRAY[
        'Building Ideas Into Reality.',
        'Learning Today, Innovating Tomorrow.',
        'Adapting Fast. Thinking Different. Building Better.',
        'Always Ready for the Next Challenge.'
    ],
    visible_sections JSONB DEFAULT '{"skills": true, "learning": true, "projects": true, "education": true, "achievements": true, "contact": true}'::jsonb,
    contact_headline TEXT DEFAULT 'Have an Idea? Let''s Build Something Together.',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 9. CONTACT MESSAGES TABLE
CREATE TABLE IF NOT EXISTS public.contact_messages (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    message TEXT NOT NULL,
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ==============================================================================
-- ROW LEVEL SECURITY (RLS) POLICIES
-- ==============================================================================
-- Enable RLS on all tables
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.skills ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.learning_journal ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.achievements ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.education ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.site_settings ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.contact_messages ENABLE ROW LEVEL SECURITY;

-- 1. PUBLIC READ ACCESS: Anyone can view public portfolio data
CREATE POLICY "Public profiles are viewable by everyone" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "Public skills are viewable by everyone" ON public.skills FOR SELECT USING (true);
CREATE POLICY "Public learning journal is viewable by everyone" ON public.learning_journal FOR SELECT USING (true);
CREATE POLICY "Public projects are viewable by everyone" ON public.projects FOR SELECT USING (is_published = true);
CREATE POLICY "Public achievements are viewable by everyone" ON public.achievements FOR SELECT USING (true);
CREATE POLICY "Public education is viewable by everyone" ON public.education FOR SELECT USING (true);
CREATE POLICY "Public site_settings are viewable by everyone" ON public.site_settings FOR SELECT USING (true);

-- 2. PUBLIC WRITE ACCESS: Anyone can submit a message through the contact form
CREATE POLICY "Anyone can submit a contact message" ON public.contact_messages FOR INSERT WITH CHECK (true);

-- 3. ADMIN FULL ACCESS: Only authenticated administrators can insert, update, delete
CREATE POLICY "Admin full access to profiles" ON public.profiles FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to skills" ON public.skills FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to learning_journal" ON public.learning_journal FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to projects" ON public.projects FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to achievements" ON public.achievements FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to education" ON public.education FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to site_settings" ON public.site_settings FOR ALL TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Admin full access to contact_messages" ON public.contact_messages FOR ALL TO authenticated USING (true) WITH CHECK (true);

-- ==============================================================================
-- INITIAL SEED DATA FOR SREEVALSAN K BHASURAN
-- ==============================================================================

-- Clear existing defaults to prevent duplicate seeds
DELETE FROM public.profiles;
DELETE FROM public.skills;
DELETE FROM public.learning_journal;
DELETE FROM public.education;
DELETE FROM public.site_settings;

-- Seed Profile
INSERT INTO public.profiles (name, headline, bio, about_text, email, location)
VALUES (
    'Sreevalsan K Bhasuran',
    'First-Year B.Tech CSE Student | Aspiring Software Developer | Lifelong Learner',
    'A passionate first-year Computer Science Engineering student dedicated to mastering software development, algorithmic thinking, and modern programming technologies.',
    'I am a first-year Computer Science Engineering student with an insatiable curiosity for programming and technology. As a highly sociable and communicative individual, I thrive in collaborative environments where ideas flow freely and problems are solved as a team. I am a fast learner who actively seeks to understand unfamiliar concepts and adapts rapidly to new tools. Stepping outside my comfort zone is where I find real growth. Every challenge is an opportunity to learn something valuable, and I approach every endeavor with wholehearted dedication.',
    'sreevalsan.bhasuran@example.com',
    'India'
);

-- Seed Initial Skills (C++, C#, Python, HTML, JavaScript)
INSERT INTO public.skills (name, category, proficiency_level, description, icon_name, sort_order)
VALUES 
    ('C++', 'Programming Languages', 'Foundational & Data Structures', 'Core systems programming language, object-oriented concepts, and algorithmic problem solving.', 'Cpu', 1),
    ('C#', 'Programming Languages', 'Object-Oriented & Logic', 'Robust OOP application development, syntax structure, and desktop/game software fundamentals.', 'Code2', 2),
    ('Python', 'Programming Languages', 'Scripting & Automation', 'Rapid prototyping, clean algorithmic scripting, logic automation, and foundational problem solving.', 'Terminal', 3),
    ('HTML', 'Web Technologies', 'Semantic Markup & Web Standards', 'Structuring modern web pages with semantic HTML5 elements, accessibility, and clean markup hierarchy.', 'Layout', 4),
    ('JavaScript', 'Web Technologies', 'Dynamic Client-Side Scripting', 'Interactive frontend logic, DOM manipulation, asynchronous programming, and modern ES6+ features.', 'Zap', 5);

-- Seed Learning Journal
INSERT INTO public.learning_journal (title, category, description, status, date_started, resources, sort_order)
VALUES
    ('Data Structures in C++', 'Core Computer Science', 'Studying linked lists, stacks, queues, and tree traversal algorithms to build strong computational thinking.', 'In Progress', '2024-09-01', 'Standard Template Library (STL), LeetCode, GeekforGeeks', 1),
    ('Object-Oriented Programming (OOP) in C#', 'Software Engineering', 'Understanding inheritance, polymorphism, encapsulation, and interface-driven design patterns.', 'In Progress', '2024-10-15', 'Microsoft Learn, C# Documentation', 2),
    ('Modern Web Development (HTML5 & Modern JS)', 'Web Development', 'Building responsive layouts, mastering asynchronous JavaScript (Fetch API, Promises), and event-driven architecture.', 'In Progress', '2024-10-01', 'MDN Web Docs', 3),
    ('Algorithmic Problem Solving in Python', 'Algorithms', 'Translating creative logic into clean, concise Python code for competitive programming and mathematical analysis.', 'Exploring', '2024-11-01', 'Python Official Docs, HackerRank', 4);

-- Seed Education
INSERT INTO public.education (degree, institution, academic_year, start_year, end_year, description, milestones, sort_order)
VALUES
    ('B.Tech in Computer Science and Engineering (CSE)', 'Engineering College / University', 'First Year', 2024, 2028, 'Pursuing foundational engineering coursework including Object-Oriented Programming, Discrete Mathematics, Data Structures, and Computer Architecture.', ARRAY['Enrolled in B.Tech CSE (First Year)', 'Active participant in tech coding club', 'Focusing on core programming and problem-solving fundamentals'], 1);

-- Seed Site Settings
INSERT INTO public.site_settings (taglines, visible_sections, contact_headline)
VALUES (
    ARRAY[
        'Building Ideas Into Reality.',
        'Learning Today, Innovating Tomorrow.',
        'Adapting Fast. Thinking Different. Building Better.',
        'Always Ready for the Next Challenge.'
    ],
    '{"skills": true, "learning": true, "projects": true, "education": true, "achievements": true, "contact": true}'::jsonb,
    'Have an Idea? Let''s Build Something Together.'
);
