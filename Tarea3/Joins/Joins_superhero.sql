use superhero

-- 1 superhero --
SELECT 
	s.superhero_name,
	s2.power_name
FROM superhero s 
inner join hero_power hp 
on hp.hero_id = s.id 
inner join superpower s2 
on s2.id = hp.power_id 
ORDER BY s.superhero_name 

-- 2 superhero --
SELECT 
	s.superhero_name,
	COUNT(*) as Cantidad_poderes 
FROM superhero s 
inner join hero_power hp 
on hp.hero_id = s.id 
inner join superpower s2 
on s2.id = hp.power_id 
GROUP BY s.superhero_name HAVING COUNT(*)>1

-- 3 superhero --
SELECT TOP 10
	s2.power_name,
	COUNT(*) as Repetido
FROM superhero s 
inner join hero_power hp 
on hp.hero_id = s.id 
inner join superpower s2 
on s2.id = hp.power_id 
GROUP BY s2.power_name HAVING COUNT(*)>1
ORDER BY Repetido DESC 

-- 4 superhero --
SELECT 
	s.superhero_name
FROM superhero s 
inner join hero_attribute ha 
on ha.hero_id = s.id 
inner join [attribute] a 
on a.attribute_name != 'Intelligence'
GROUP by s.superhero_name 

-- 5 superhero --
SELECT
	s.superhero_name,
	COUNT(s.superhero_name) as Cant_atrb 
FROM superhero s 
inner join hero_attribute ha 
on ha.hero_id = s.id 
GROUP BY s.superhero_name HAVING COUNT(s.superhero_name)>3

-- 6 superhero --
SELECT 
	s.superhero_name,
	g.gender 
FROM superhero s  
inner join gender g 
on g.id = s.gender_id 
WHERE g.gender = 'Female'

-- 7 superhero --
SELECT 
	s.superhero_name,
	c.colour as eye_colour,
	c2.colour as hair_colour,
	c3.colour as skin_colour
FROM superhero s
inner join colour c 
on s.eye_colour_id = c.id 
inner join colour c2 
on s.hair_colour_id = c2.id 
inner join colour c3 
on s.skin_colour_id = c3.id 

-- 8 superhero --
SELECT 
	s.superhero_name,
	r.race,
	COUNT(*) as Cantidad_poderes	
FROM superhero s 
inner join hero_power hp 
on hp.hero_id = s.id 
inner join superpower s2 
on s2.id = hp.power_id 
inner join race r
on r.id = s.race_id 
GROUP BY s.superhero_name,r.race HAVING COUNT(*)>1

-- 9 superhero --
SELECT 
	p.publisher_name,
	COUNT(p.publisher_name) as Cant_buenos 
FROM superhero s
inner join publisher p 
on p.id = s.publisher_id 
inner join alignment a 
on a.id = s.alignment_id 
where a.alignment = 'Good'
GROUP BY p.publisher_name HAVING COUNT(p.publisher_name)>1 
