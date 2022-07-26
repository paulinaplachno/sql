-- 1. Finding 5 oldest users

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

-- 2. What day of the week do most users register on?

SELECT 
	 DAYNAME(created_at) AS day,
     COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC;


-- 3. We want to target our inactive users with an email campaign.

SELECT username, image_url from users
LEFT JOIN photos
	ON users.id = photos.user_id
    where photos.id IS NULL;
    
-- 4. Identify most popular photo

SELECT username,
		photos.id, 
		photos.image_url, 
        COUNT(*) AS total
FROM photos
INNER JOIN likes
    On likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY  photos.id
ORDER BY total DESC
LIMIT 1;


-- 5. How many times does the average user post?
-- total number of photos / total number od users
SELECT
(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-- 6. Top 5 most commonly used hastags

SELECT tags.tag_name,
    	COUNT(*) As total
FROM photo_tags
JOIN tags 
    ON photo_tags.tag_id = tags.id 
GROUP BY tags.id
ORDER BY total DESC
LIMIT 5;





