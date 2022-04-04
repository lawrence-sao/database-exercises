SELECT COUNT(*) FROM albums; -- 31 rows
SELECT COUNT(DISTINCT artist) from albums; -- 23 unique artist names
SHOW KEYS FROM albums WHERE key_name = 'PRIMARY'; -- key name = primary
SELECT * FROM albums ORDER BY release_date; -- 1967/2011
SELECT * FROM albums WHERE artist = "pink floyd"; -- The Dark Side of the Moon/ the wall
SELECT * FROM albums WHERE artist = "The Beatles"; -- 1967 release date SPLHCB
SELECT * FROM albums WHERE artist = "Nirvana"; -- Grunge, alt. rock
SELECT * FROM albums where release_date BETWEEN 1990 AND 1999; -- these 11 albums were released in the 1990s
SELECT * FROM albums where sales < 20.0; -- These 13 albums have less than 20mil in certified sales
SELECT * FROM albums where genre = "rock"; -- These 5 albums are rock genre. Other types of rock don't show because they are labeled as completely independent genres.