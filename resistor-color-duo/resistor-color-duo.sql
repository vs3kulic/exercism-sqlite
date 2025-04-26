-- Simplified table structure
CREATE TABLE IF NOT EXISTS color_codes (
    color TEXT PRIMARY KEY,
    value INTEGER
);

CREATE TABLE IF NOT EXISTS color_code (
    color1 TEXT REFERENCES color_codes(color),
    color2 TEXT REFERENCES color_codes(color),
    result INT
);

-- One-time color value setup
INSERT OR IGNORE INTO color_codes VALUES
('black', 0), ('brown', 1), ('red', 2), ('orange', 3),
('yellow', 4), ('green', 5), ('blue', 6), ('violet', 7),
('grey', 8), ('white', 9);

-- Generate all combinations with automatic calculation
INSERT INTO color_code (color1, color2, result)
SELECT 
    c1.color, 
    c2.color,
    (c1.value * 10) + c2.value
FROM color_codes c1, color_codes c2;
