/*Получить название и длительность песен каждого исполнителя*/
SELECT si.name, s.title, s.duration
FROM singer si
JOIN song s ON si.id = s.singer_id
ORDER BY 1;

/*Получить стоимость концерта на копоративе*/
SELECT SUM(concert_price)
FROM singer
WHERE name IN ('AC/DC', 'Sting', 'Billy Mack');

/*Получить длительность песен в каждом альбоме каждого исполнителя*/
SELECT si.name singer, a.name album, SUM(s.duration) "total duration"
FROM singer si
JOIN album a
ON si.id = a.singer_id
JOIN song s
ON a.id = s.album_id
GROUP BY 1, 2
ORDER BY singer, album;


/*Получить песни, не вошедшие ни в один альбом*/
SELECT title
FROM song
WHERE album_id is NULL;

/*Получить все лейблы с рейтингом 5, расположенные в Великобритании*/
SELECT name
FROM label
WHERE rating = 5
AND country = 'United Kingdom';

/*Получить названия лейблов и относящиеся к ним песни*/
SELECT l.name, s.title
FROM label l
JOIN singer si
ON l.id = si.label_id
JOIN song s
ON si.id = s.singer_id
ORDER BY 1;

/*Получить суммарную продолжительность песен каждого исполнителя*/
SELECT si.name, SUM(s.duration)
FROM singer si
JOIN song s
ON si.id = s.singer_id
GROUP BY 1
ORDER BY 2 DESC;