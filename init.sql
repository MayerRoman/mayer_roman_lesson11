CREATE TABLE IF NOT EXISTS label (
id BIGINT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
director VARCHAR(255) NOT NULL,
country VARCHAR(255) NOT NULL,
rating SMALLINT CHECK (rating > 0 AND rating < 6));

INSERT INTO label
VALUES 
(1, 'Island Records', 'Asif Kapadia', 'United Kingdom', 5),
(2, 'A&M Records', 'Herb Alpert', 'United States', 5),
(3, 'Albert Productions', 'Ted Albert', 'Australia', 4),
(4, 'Parlophone ', 'Carl Lindström', 'United Kingdom', 5),
(5, 'Universal Pictures Music', 'Lucian Grainge', 'United Kingdom', 3);



CREATE TABLE IF NOT EXISTS singer (
id BIGINT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
concert_price INTEGER CHECK (concert_price > 0),
label_id BIGINT,
FOREIGN KEY (label_id) REFERENCES label (id) ON UPDATE CASCADE);

INSERT INTO singer
VALUES 
(1, 'U2', 1500000, 1),
(2, 'Sting', 1000000, 2),
(3, 'AC/DC', 1100000, 3),
(4, 'Coldplay', 1150000, 4),
(5, 'Billy Mack', 500000, 1);



CREATE TABLE IF NOT EXISTS album (
id BIGINT PRIMARY KEY,
name VARCHAR(255) NOT NULL,
genre VARCHAR(255) NOT NULL,
singer_id BIGINT NOT NULL,
FOREIGN KEY (singer_id) REFERENCES singer (id) ON UPDATE CASCADE);

INSERT INTO album
VALUES 
(1, 'All That You Cant Leave Behind', 'POP', 1),
(2, 'No Line On The Horizon', 'ROCK', 1),
(3, 'Brand New Day', 'POP', 2),
(4, 'Fields Of Gold', 'POP', 2),
(5, 'Iron Man 2', 'ROCK', 3),
(6, 'A Head Full Of Dreams', 'ROCK', 4);



CREATE TABLE IF NOT EXISTS song (
id BIGINT PRIMARY KEY,
title VARCHAR(255) NOT NULL,
duration INTERVAL NOT NULL,
singer_id BIGINT NOT NULL,
album_id BIGINT,
FOREIGN KEY (singer_id) REFERENCES singer (id) ON UPDATE CASCADE,
FOREIGN KEY (album_id) REFERENCES album (id) ON UPDATE CASCADE);

INSERT INTO song
VALUES 
(1, 'Beautiful Day', INTERVAL '00:04:15', 1, 1),
(2, 'Walk On', INTERVAL '00:03:37', 1, 1),
(3, 'No Line On The Horizon', INTERVAL '00:04:07', 1, 2),
(4, 'Desert Rose', INTERVAL '00:03:25', 2, 3),
(5, 'Fragile', INTERVAL '00:05:01', 2, 4),
(6, 'Back In Black', INTERVAL '00:03:54', 3, 5),
(7, 'Adventure Of A Lifetime', INTERVAL '00:04:14', 4, 6),
(8, 'Christmas is all Around', INTERVAL '00:06:05', 5, null);