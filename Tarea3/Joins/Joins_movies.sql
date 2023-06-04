use movies

-- 1 movies --
SELECT 
	m.title,
	l.language_name 
from movie m 
inner join movie_languages ml 
on m.movie_id = ml.movie_id
inner join [language] l 
on ml.language_id = l.language_id 
WHERE l.language_name='Español'

-- 2 movies --
SELECT 
	m.title,
	g.genre_name
from movie m 
inner join movie_genres mg 
on m.movie_id = mg.movie_id 
inner join genre g 
on mg.genre_id = g.genre_id 

-- 3 movies --
SELECT TOP 5
	pc.company_name,
	m.vote_count
from movie m 
inner join movie_company mc  
on mc.movie_id = m.movie_id 
inner join production_company pc 
on pc.company_id = mc.company_id 
ORDER BY m.vote_count DESC 

-- 4 movies --
SELECT 
	m.title,
	COUNT(*) as [Empleados]
FROM movie_cast mc 
inner join movie m 
on m.movie_id = mc.movie_id 
inner join person p 
ON mc.person_id = p.person_id 
GROUP BY m.title HAVING COUNT(*) > 1
ORDER BY [Empleados] DESC 

-- 5 movies --
SELECT 
	d.department_name,
	COUNT(*) as [Empleados]
FROM movie_crew mc 
inner join department d  
on d.department_id = mc.department_id 
inner join person p 
ON mc.person_id = p.person_id 
GROUP BY d.department_name HAVING COUNT(*) > 1
ORDER BY [Empleados] DESC 

-- 6 movies --
SELECT 
	m.title,
	mc.character_name
FROM movie_cast mc 
inner join movie m 
ON m.movie_id = mc.movie_id

-- 7 movies --
SELECT
	pc.company_name,
	c.country_name
FROM movie m
inner join production_country pc2
ON pc2.movie_id = m.movie_id 
inner join country c 
ON c.country_id = pc2.country_id 
inner join movie_company mc 
ON mc.movie_id = m.movie_id
inner join production_company pc 
ON  pc.company_id = mc.company_id
order by c.country_name 

-- 8 movies --
SELECT 
	g.genre_name,
	COUNT(*) as [Num_mujeres] 
FROM movie m 
inner join movie_genres mg 
on mg.movie_id = m.movie_id 
inner join genre g 
on g.genre_id = mg.genre_id 
inner join movie_cast mc 
on mc.movie_id = m.movie_id 
inner join gender g2 
on g2.gender_id = mc.gender_id
WHERE g.genre_name = 'Drama'
GROUP BY g.genre_name HAVING COUNT(*) > 1 

-- 9 movies --
SELECT 
	m.title,
	l.language_name 
FROM movie m 
inner join movie_languages ml 
on ml.movie_id = m.movie_id 
inner join [language] l 
on l.language_id = ml.language_id 
order by m.title 

-- 10 movies --
SELECT TOP 8
	k.keyword_name,
	COUNT(*) as [Repetidos]
FROM movie m 
inner join movie_keywords mk 
on mk.movie_id = m.movie_id 
inner join keyword k 
on k.keyword_id = mk.keyword_id 
GROUP BY k.keyword_name HAVING COUNT(*) > 1
ORDER BY [Repetidos] DESC 