-- ================================
-- 🎮 GTA V Database Setup Script
-- Table: Players
-- ================================

-- Drop table if it already exists (optional, for clean resets)
DROP TABLE IF EXISTS Players;

-- Create the table
CREATE TABLE Players (
    player_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    gang VARCHAR(50),
    wanted_level INT CHECK (wanted_level BETWEEN 0 AND 6),
    cash DECIMAL(12, 2) DEFAULT 0.00,
    city VARCHAR(50),
    missions_completed INT DEFAULT 0
);

-- Insert sample data
INSERT INTO Players (player_id, name, gang, wanted_level, cash, city, missions_completed) VALUES
(1, 'Michael De Santa', 'The Rich Guys', 2, 150000.00, 'Los Santos', 25),
(2, 'Franklin Clinton', 'The Hustlers', 3, 95000.50, 'Los Santos', 31),
(3, 'Trevor Philips', 'The Maniacs', 5, 21000.00, 'Sandy Shores', 42),
(4, 'Lamar Davis', 'The Hustlers', 2, 32000.75, 'Los Santos', 18),
(5, 'Lester Crest', 'The Hackers', 1, 275000.00, 'Los Santos', 50),
(6, 'Ron Jakowski', 'The Maniacs', 4, 18000.00, 'Sandy Shores', 21),
(7, 'Wei Cheng', 'The Triads', 3, 80000.00, 'Los Santos', 16),
(8, 'Tao Cheng', 'The Triads', 2, 60000.00, 'Los Santos', 9),
(9, 'Jimmy De Santa', 'The Rich Guys', 1, 15000.00, 'Los Santos', 4),
(10, 'Denise Robinson', 'The Hustlers', 1, 7000.00, 'Los Santos', 7);

-- ✅ Confirm the data
SELECT * FROM Players;


-- b) Show only names and gangs
SELECT name, gang FROM Players;

-- c) Show names and wanted levels for players from Los Santos
SELECT name, wanted_level FROM Players WHERE city = 'Los Santos';

INSERT INTO Players
VALUES
(11, 'Corrupt FBI agent', 'FBI', 0, 70000, 'Los Santos', 0);

UPDATE Players
SET wanted_level = 0
WHERE city = 'Sandy Shores';

DELETE FROM Players
WHERE name = 'Corrupt FBI agent';

SELECT gang, SUM(cash) AS total_cash
FROM Players
GROUP BY gang
ORDER BY total_cash DESC;