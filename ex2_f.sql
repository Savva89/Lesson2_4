SELECT
Department.namedepartment
FROM Department JOIN 
				(SELECT
				Personal.Department_id,
				SUM(Personal.Salary * Personal_Bonus.Bonus)
				FROM Personal JOIN (SELECT
									Personal_id,
									SUM(CASE WHEN grade = 'A' THEN 0.2
										 WHEN grade = 'B' THEN 0.1
										 WHEN grade = 'C' THEN 0
										 WHEN grade = 'D' THEN -0.1
										 WHEN grade = 'E' THEN -0.2
									END) + 1 AS Bonus
									FROM grade
									GROUP BY Personal_id) AS Personal_Bonus ON Personal.ID = Personal_Bonus.Personal_id
				GROUP BY Personal.Department_id
				ORDER BY SUM(Personal.Salary * Personal_Bonus.Bonus) DESC
				LIMIT 1) AS MaxBonus ON Department.ID = MaxBonus.Department_id