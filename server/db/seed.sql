-- Seed: initial skill tree nodes for JavaScript path
INSERT INTO skill_nodes (id, name, description, parent_id, position_x, position_y, xp_required) VALUES
(1, 'בסיס JS', 'תחילת המסע', NULL, 340, 380, 0),
(2, 'משתנים', 'הגדרת ושימוש במשתנים', 1, 200, 250, 0),
(3, 'פונקציות', 'כתיבת פונקציות בסיסיות', 1, 480, 250, 50),
(4, 'לופים', 'while, for ולוגיקת חזרה', 2, 150, 160, 100),
(5, 'מערכים', 'יצירה ועיבוד מערכים', 4, 260, 160, 175);

-- Reset the auto-increment counter so future inserts continue from 6
SELECT setval('skill_nodes_id_seq', (SELECT MAX(id) FROM skill_nodes));

-- Seed: first challenge, belongs to "לופים" (id 4)
INSERT INTO challenges (skill_node_id, title, description, starter_code, test_cases, xp_reward, order_index) VALUES
(4,
 'תקן את הלופ שתוקע את הדפדפן',
 'הקוד הבא נכנס ל-loop אינסופי. מצא את הבאג ותקן שורה אחת בלבד.',
 'let i = 0;
while (i < 5) {
  console.log(i);
}',
 '[{"call": "fixedFunction()", "expected": [0,1,2,3,4]}]',
 25,
 1
);