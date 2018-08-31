--1.Query all of the entries in the Genre table

SELECT * FROM Genre;

 --2.Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist(ArtistId, ArtistName, YearEstablished)
VALUES (null,'Michael Jackson',1970); 

--3.Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album VALUES (null, 'Bad',"8/31/1987", 2312, "Epic Records", 9, 4); 

--4.Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song VALUES (null, 'Bad', 123, "8/31/1987",9, 4, 8);

-- 5. Write a SELECT query that provides the song titles, album title, 
--and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables,
-- and the WHERE keyword to filter the results to the album and artist you added.

SELECT Album.Title, Artist.ArtistName, Song.Title 
FROM Album 
LEFT JOIN Artist ON Album.ArtistId = Artist.ArtistId
LEFT JOIN Song ON Song.ArtistId = Artist.ArtistId;

--6. Using SELECT and LEFT JOIN, write a query that displays the song title, 
--the song duration, the album label, and the genre name for every song.

SELECT Song.Title, Song.SongLength, Album.Label, Genre.Label
FROM Song
LEFT JOIN Album ON Album.ArtistId = Album.ArtistId
LEFT JOIN Artist ON Artist.ArtistId = Artist.ArtistId
LEFT JOIN Genre ON Genre.GenreId = Genre.GenreId
WHERE Song.SongLength > 250;

--7.Using a WHERE clause, modify the previous query to only show the
-- information for songs that have a duration of 250 or greater.

--8.Write a SELECT statement to display how many songs exist for each album. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a on s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;
--9. Write a SELECT statement to display how many songs exist for each artist. 
--You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT s.ArtistId, s.Title, COUNT(s.Title)
FROM Song s
GROUP BY s.ArtistId;

-- 10.Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT g.Label, COUNT(g.Label)
FROM Genre g
GROUP BY  g.Label;

-- 11.Write a SELECT statement to display how many artists exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT (g.GenreId)
FROM Genre g
Group By  g.Label;

--12.Using MAX() function, write a select statement to find the album with the longest duration. 
--The result should display the album title and the duration.

SELECT a.Title, MAX (a.AlbumLength)
FROM Album a;

-- 13. Using MAX() function, write a select statement to find the song with the longest duration. 
--The result should display the song title and the duration.

 SELECT s.Title "Song", a.Title "Album", MAX(s.SongLength) "Song Length"
 FROM Song s
 JOIN Album a ON s.AlbumId = a.AlbumId;

-- 14.Modify the previous query to also display the title of the album.
