 CREATE TABLE HoleInfo (
    holeid INT PRIMARY KEY,
    courseid INT FOREIGN KEY,
    hname VARCHAR(200) NOT NULL,
    hnumber INT NOT NULL,
    hdistance INT NOT NULL,
    hpar INT NOT NULL);

INSERT INTO holeinfo (holeid, courseid, hname, hnumber, hdistance, hpar)
    VALUES
        (1, 001, 'Ironman', 1, 600, 5),
        (2, 001, 'Ant Man', 2, 320, 3),
        (3, 001, 'Hulk', 3, 575, 5),
        (4, 001, 'Thor', 4, 600, 5),
        (5, 001, 'Loki', 5, 425, 4),
        (6, 001, 'Black Widow', 6, 580, 5),
        (7, 001, 'Black Panther', 7, 610, 5),
        (8, 001, 'Spiderman', 8, 350, 3),
        (9, 001, 'Goose the Cat', 9, 650, 5),
        (10, 001, 'Captain America', 10, 701, 5),
        (11, 001, 'Hawkeye', 11, 480, 4),
        (12, 001, 'Star-Lord', 12, 510, 4),
        (13, 001, 'Mantis', 13, 635, 5),
        (14, 001, 'Rocket', 14, 690, 5),
        (15, 001, 'Gamora', 15, 325, 3),
        (16, 001, 'Groot', 16, 597, 5),
        (17, 001, 'Thanos', 17, 780, 5),
        (18, 001, 'Winter Soldier', 18, 545, 5);