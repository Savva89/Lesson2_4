SELECT
Personal.ID,
Personal.FIO,
Personal.Birthday,
Personal.StartWorkDate,
Personal.JobTitle,
Personal.PersonalLevel,
Personal.Salary,
Personal.Department_id,
Personal.DriverLicense,
Personal_Bonus.Bonus,
CASE WHEN Personal_Bonus.Bonus > 1.2 THEN Personal.Salary*1.2
	 WHEN Personal_Bonus.Bonus < 1 THEN Personal.Salary*1
	 ELSE Personal.Salary*1.1
	 END AS Indexed_Salary
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