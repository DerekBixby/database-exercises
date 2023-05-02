use albums_db;
SHOW tables;
describe albums;

-- What is the primary key for the albums table? 
-- id

-- What does the column named 'name' represent?
-- name or title of album

SELECT sales from albums;

-- What do you think the sales column represents?
-- millions of album sales

select *
FROM albums
WHERE artist = 'Pink Floyd';

-- Find names of all albums by Pimnk Floyd: The Dark Side of the Moon and The Wall

SELECT *
FROM albums 
WHERE name = "sgt. Pepper's Lonely Hearts Club Band";

-- What is the year Sgt. Pepper's Lonely Hearts Club Band was Released?
-- 1967

Select * 
FROM albums
WHERE name = 'Nevermind';

-- What is the genre of the album Nevermind? 
-- Grunge, Alternative rock

SELECT * 
FROM albums
WHERE release_date BETWEEN 1989 and 1999;

-- Which albums were released in the 1990s?
-- The Immaculate Collection, The Bodyguard, Supernatural, Nevermind, Metallica, Let's Talk About Love, Jagged Little Pill, Falling Into You, Dangerous, Come on Over

Select sales 
FROM albums
AS lowest_selling_albums
WHERE sales < 20;




