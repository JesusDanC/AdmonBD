use universities

-- universities 1 --
SELECT 
	u.university_name,
	c.country_name 
FROM university u 
inner join country c 
on c.id = u.country_id 
GROUP BY u.university_name, c.country_name 

-- universities 2 --
SELECT 
	c.country_name,
	COUNT(c.country_name) as Cant_U 
FROM university u 
inner join country c 
on c.id = u.country_id 
GROUP BY c.country_name HAVING COUNT(c.country_name)>=1 

-- universities 3 --
SELECT 
	c.country_name
FROM university u 
full outer join country c 
on c.id = u.country_id 
WHERE c.id IS NULL OR u.country_id IS NULL

-- universities 4 --
SELECT 
	rs.system_name,
	rc.criteria_name 
FROM ranking_system rs 
inner join ranking_criteria rc 
on rc.ranking_system_id = rs.id 
GROUP BY rs.system_name, rc.criteria_name 

-- universities 5 --
SELECT TOP 1
	rs.system_name,
	COUNT(rs.system_name) as Num_criterios 
FROM ranking_system rs 
inner join ranking_criteria rc 
on rc.ranking_system_id = rs.id 
GROUP BY rs.system_name HAVING COUNT(rs.system_name)>1
ORDER BY Num_criterios DESC 

-- universities 6 --
SELECT 
	u.university_name,
	rc.criteria_name,
	ury.score
FROM university u 
inner join university_ranking_year ury 
on ury.university_id = u.id 
inner join ranking_criteria rc 
on rc.id = ury.ranking_criteria_id 
WHERE ury.[year] = 2012
ORDER BY ury.score DESC 

-- universities 7 --
SELECT 
	u.university_name,
	ury.score,
	COUNT(*) as Repetido 
FROM university u 
inner join university_ranking_year ury 
on ury.university_id = u.id 
WHERE ury.score = 100
GROUP BY u.university_name, ury.score HAVING COUNT(*)>1 
ORDER BY Repetido DESC 

-- universities 8 --
SELECT 
	c.country_name
FROM university u 
inner join country c 
on c.id = u.country_id 
inner join university_ranking_year ury 
on ury.university_id = u.id 
where ury.score > 90
GROUP BY c.country_name 

-- universities 9 --
SELECT 
	u.university_name
FROM university u 
inner join university_ranking_year ury
on ury.university_id = u.id 
inner join ranking_criteria rc 
on rc.id = ury.ranking_criteria_id 
inner join ranking_system rs 
on rs.id = rc.ranking_system_id 
where rs.system_name = 'Shanghai Ranking'

-- universities 10 --
SELECT 
	u.university_name,
	rs.system_name,
	ury.score 
FROM university u 
inner join university_ranking_year ury 
on ury.university_id = u.id 
inner join ranking_criteria rc 
on rc.id = ury.ranking_criteria_id 
inner join ranking_system rs 
on rs.id = rc.ranking_system_id 
WHERE ury.score >= 0 AND rs.system_name='Times Higher Education World University Ranking'
order by ury.score ASC 