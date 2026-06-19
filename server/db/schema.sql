-- Users table
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  xp INTEGER DEFAULT 0,
  streak INTEGER DEFAULT 0,
  last_submission_date DATE,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Skill nodes table (the tree structure)
CREATE TABLE skill_nodes (
  id SERIAL PRIMARY KEY,
  nameC VARCHAR(100) NOT NULL,
  descriptionC TEXT,
  parent_id INTEGER REFERENCES skill_nodes(id),
  position_x INTEGER,
  position_y INTEGER,
  xp_required INTEGER DEFAULT 0
);

-- Challenges table
CREATE TABLE challenges (
  id SERIAL PRIMARY KEY,
  skill_node_id INTEGER REFERENCES skill_nodes(id) NOT NULL,
  title VARCHAR(255) NOT NULL,
  descriptionCh TEXT,
  starter_code TEXT,
  test_cases JSONB,
  xp_reward INTEGER DEFAULT 10,
  order_index INTEGER DEFAULT 0
);

-- Submissions table (history of attempts)
CREATE TABLE submissions (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id) NOT NULL,
  challenge_id INTEGER REFERENCES challenges(id) NOT NULL,
  submitted_code TEXT,
  success BOOLEAN DEFAULT FALSE,
  xp_earned INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);