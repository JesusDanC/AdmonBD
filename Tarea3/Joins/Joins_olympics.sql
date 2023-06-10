use olympics

-- olympics 1 --
SELECT 
	p.full_name,
	s.sport_name,
	m.medal_name 
FROM games_competitor gc 
inner join competitor_event ce
on ce.competitor_id = gc.id 
inner join person p 
on p.id = gc.person_id 
inner join medal m 
on m.id = ce.medal_id 
inner join event e 
on e.id = ce.event_id 
inner join sport s 
on s.id = e.sport_id 
WHERE m.medal_name = 'Gold' AND (s.sport_name = 'Football' OR s.sport_name = 'Handball' OR s.sport_name = 'Golf')

-- olympics 2 --
SELECT 
	e.event_name 
FROM event e 
inner join competitor_event ce 
on ce.event_id = e.id 
inner join games_competitor gc 
on gc.id = ce.competitor_id 
inner join games g 
on g.id = gc.games_id 
WHERE g.games_year = 2000

-- olympics 3 --
SELECT TOP 20
	c.city_name,
	COUNT(c.city_name) as Olimpiadas_jugadas 
FROM games g
inner join games_city gc 
on gc.games_id = g.id 
inner join city c 
on c.id = gc.city_id 
GROUP BY c.city_name HAVING COUNT(c.city_name)>0
ORDER BY Olimpiadas_jugadas DESC 

-- olympics 4 --
SELECT 
	c.city_name
FROM games_competitor gc 
inner join games g
on g.id = gc.games_id 
inner join games_city gc2 
on gc2.games_id = g.id 
inner join city c 
on c.id = gc2.city_id 
WHERE g.games_year < 1998
GROUP BY c.city_name 

-- olympics 5 --
SELECT TOP 5
	c.city_name,
	COUNT(c.city_name) as Medallas_ganadas 
FROM games_competitor gc 
inner join games g 
on g.id = gc.games_id 
inner join games_city gc2 
on gc2.games_id = gc.games_id 
inner join city c 
on c.id = gc2.city_id 
inner join competitor_event ce 
on ce.competitor_id = gc.id 
inner join medal m 
on m.id = ce.medal_id 
WHERE m.medal_name = 'Gold'
GROUP by c.city_name HAVING COUNT(c.city_name)>1 
ORDER BY Medallas_ganadas DESC 

-- olympics 6 --
SELECT TOP 1
	e.event_name,
	COUNT(e.event_name) as Cantidad_participantes
FROM event e 
inner join competitor_event ce
on ce.event_id = e.id 
GROUP BY e.event_name HAVING COUNT(e.event_name)>1 
ORDER BY Cantidad_participantes DESC 

-- olympics 7 --
SELECT 
	s.sport_name 
FROM sport s 
inner join event e 
on s.id = e.sport_id 
inner join competitor_event ce 
on ce.event_id = e.id 
inner join games_competitor gc 
on gc.id = ce.competitor_id 
inner join games g 
on gc.games_id = g.id 
GROUP BY s.sport_name 

-- olympics 8 --
SELECT 
	p.gender,
	COUNT(p.gender) as Medallas_ganadas
FROM competitor_event ce 
inner join medal m 
on ce.medal_id = m.id 
inner join games_competitor gc 
on gc.id = ce.competitor_id 
inner join person p 
on p.id = gc.person_id 
WHERE m.medal_name = 'Gold' OR m.medal_name = 'Silver' OR m.medal_name = 'Bronze'
GROUP BY p.gender HAVING COUNT(p.gender)>1

-- olympics 9 --
SELECT 
	p.height,
	p.weight,
	COUNT(*) as Freq 
FROM sport s 
inner join event e
on e.sport_id = s.id 
inner join competitor_event ce 
on ce.event_id = e.id 
inner join games_competitor gc 
on gc.id = ce.competitor_id 
inner join person p 
on p.id = gc.person_id 
WHERE s.sport_name = 'Boxing' AND p.height != 0
GROUP BY p.height, p.weight HAVING COUNT(*)>1
ORDER BY Freq DESC 

-- olympics 10 --
SELECT 
	p.full_name,
	gc.age 
FROM games_competitor gc 
inner join person p 
on p.id =gc.person_id 
WHERE gc.age < 18