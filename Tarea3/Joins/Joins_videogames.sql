use video_games

-- videogames 1 --
SELECT 
	g.game_name,
	g2.genre_name 
FROM game g 
inner join genre g2 
on g2.id = g.genre_id 
GROUP BY g.game_name, g2.genre_name 

-- videogames 2 --
SELECT 
	p.platform_name,
	g.game_name 
FROM game_platform gp 
inner join game_publisher gp2 
on gp.game_publisher_id = gp2.id 
inner join game g 
on g.id = gp2.game_id 
inner join platform p 
on p.id = gp.platform_id 
GROUP BY p.platform_name, g.game_name 
ORDER BY p.platform_name 

-- videogames 3 --
SELECT 
	g.game_name,
	gp2.release_year
FROM game g 
inner join game_publisher gp 
on gp.game_id = g.id 
inner join game_platform gp2 
on gp2.game_publisher_id = gp.id 
WHERE gp2.release_year < 2000

-- videogames 4 --
SELECT 
	g.game_name,
	rs.num_sales 
FROM game g 
inner join game_publisher gp 
on gp.game_id = g.id 
inner join game_platform gp2 
on gp2.game_publisher_id = gp.id
inner join region_sales rs 
on rs.game_platform_id = gp2.id 
inner join region r 
on r.id = rs.region_id 
WHERE r.region_name = 'Europe'
ORDER BY rs.num_sales DESC 

-- videogames 5 --
SELECT 
	g.game_name,
	rs.num_sales 
FROM game g 
inner join game_publisher gp 
on gp.game_id = g.id 
inner join game_platform gp2 
on gp2.game_publisher_id = gp.id
inner join platform p 
on p.id = gp2.platform_id 
inner join region_sales rs 
on rs.game_platform_id = gp2.id 
WHERE rs.num_sales < 0.5 AND p.platform_name = 'Wii'

-- videogames 6 --
SELECT 
	p.platform_name,
	g.game_name 
FROM game_platform gp 
inner join game_publisher gp2 
on gp.game_publisher_id = gp2.id 
inner join game g 
on g.id = gp2.game_id 
inner join platform p 
on p.id = gp.platform_id 
WHERE p.platform_name = 'PS'

-- videogames 7 --
SELECT TOP 5 
	g2.genre_name,
	rs.num_sales 
FROM game g 
inner join genre g2 
on g.genre_id = g2.id 
inner join game_publisher gp 
on gp.game_id = g.id 
inner join game_platform gp2 
on gp2.game_publisher_id = gp.id
inner join region_sales rs 
on rs.game_platform_id = gp2.id 
inner join region r 
on r.id = rs.region_id 
WHERE r.region_name = 'Europe'
GROUP BY g2.genre_name, rs.num_sales 
ORDER BY rs.num_sales DESC 

-- videogames 8 --
SELECT 
	p.publisher_name,
	COUNT(p.publisher_name) as Presencia 
FROM game_publisher gp 
inner join publisher p
on p.id = gp.publisher_id 
inner join game_platform gp2 
on gp2.game_publisher_id = gp.id 
inner join region_sales rs 
on rs.game_platform_id = gp2.id
inner join region r 
on r.id = rs.region_id 
WHERE r.region_name = 'North America'
GROUP BY p.publisher_name HAVING COUNT(p.publisher_name)>1 
ORDER BY Presencia DESC 

-- videogames 9 --
SELECT 
	p.publisher_name,
	COUNT(p.publisher_name) as Genera 
FROM game_publisher gp 
inner join publisher p 
on p.id = gp.publisher_id 
inner join game g 
on g.id = gp.game_id 
inner join genre g2 
on g2.id = g.genre_id 
GROUP BY p.publisher_name HAVING COUNT(p.publisher_name)>1
ORDER BY Genera DESC 

-- videogames 10 --
SELECT 
	p.publisher_name,
	COUNT(p.publisher_name) as Cant 
FROM game_publisher gp 
inner join publisher p 
on p.id = gp.publisher_id 
inner join game g 
on g.id = gp.game_id 
inner join genre g2 
on g2.id = g.genre_id 
WHERE p.publisher_name = 'Microsoft Game Studios' AND g2.genre_name = 'Strategy'
GROUP BY p.publisher_name HAVING COUNT(p.publisher_name)>1
  