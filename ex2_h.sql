SELECT
	Department.NameDepartment AS Department,
	Department.HeadName AS HeadName,
	COUNT(Personal.ID) AS CountPersonal,
	AVG(age(Personal.StartWorkDate)) AS AvgExperience,
	AVG(Personal.Salary) AS AvgSalary,
	SUM(CASE WHEN Personal.PersonalLevel = 'jun' 
		  	THEN 1 
		  	ELSE 0 
		  END) AS Count_Jun,
	SUM(CASE WHEN Personal.PersonalLevel = 'middle' 
			  THEN 1 
			  ELSE 0 
		  END) AS Count_Middle,
	SUM(CASE 
		  WHEN Personal.PersonalLevel = 'senior' 
			  THEN 1 
			  ELSE 0 
		  END) AS Count_Senior,
	SUM(CASE WHEN Personal.PersonalLevel = 'lead'
		  	THEN 1 
		  	ELSE 0 
		  END) AS Count_Lead,
	SUM(Personal.Salary) AS TotalSalary,
	SUM(CASE WHEN Personal_Bonus.Bonus > 1.2 THEN Personal.Salary*1.2
		 	WHEN Personal_Bonus.Bonus < 1 THEN Personal.Salary*1
	 	 	ELSE Personal.Salary*1.1
		 END) AS TotalIndexedSalary,
	SUM (Personal_Bonus.TotalA) AS TotalA,
	SUM (Personal_Bonus.TotalB) AS TotalB,
	SUM (Personal_Bonus.TotalC) AS TotalC,
	SUM (Personal_Bonus.TotalD) AS TotalD,
	SUM (Personal_Bonus.TotalE) AS TotalE,
	AVG(Personal_Bonus.Bonus) AS AvgBonus,
	SUM(Personal.Salary*Personal_Bonus.Bonus) AS TotalBonus,
	SUM(Personal.Salary + Personal.Salary*Personal_Bonus.Bonus) AS TotalNotIndexedSalaryAndBonus,
	SUM(CASE WHEN Personal_Bonus.Bonus > 1.2 THEN Personal.Salary*1.2 + Personal.Salary*Personal_Bonus.Bonus
		 	WHEN Personal_Bonus.Bonus < 1 THEN Personal.Salary*1 + Personal.Salary*Personal_Bonus.Bonus
	 	 	ELSE Personal.Salary*1.1 + Personal.Salary*Personal_Bonus.Bonus
		 END) AS TotalNotIndexedSalaryAndBonus,
	(SUM(CASE WHEN Personal_Bonus.Bonus > 1.2 THEN Personal.Salary*1.2 + Personal.Salary*Personal_Bonus.Bonus
		 	WHEN Personal_Bonus.Bonus < 1 THEN Personal.Salary*1 + Personal.Salary*Personal_Bonus.Bonus
	 	 	ELSE Personal.Salary*1.1 + Personal.Salary*Personal_Bonus.Bonus
		 END) - SUM(Personal.Salary + Personal.Salary*Personal_Bonus.Bonus))/SUM(Personal.Salary + Personal.Salary*Personal_Bonus.Bonus)*100 AS ProcentDifference
FROM Department JOIN Personal ON Department.ID = Personal.Department_id JOIN (SELECT
					Personal_id,
					SUM(CASE WHEN grade = 'A' THEN 0.2
							 WHEN grade = 'B' THEN 0.1
							 WHEN grade = 'C' THEN 0
							 WHEN grade = 'D' THEN -0.1
							 WHEN grade = 'E' THEN -0.2
						END) + 1 AS Bonus,
					SUM(CASE WHEN grade = 'A' THEN 1
							 ELSE 0
						END) As TotalA,
					SUM(CASE WHEN grade = 'B' THEN 1
							 ELSE 0
						END) As TotalB,
					SUM(CASE WHEN grade = 'C' THEN 1
							 ELSE 0
						END) As TotalC,
					SUM(CASE WHEN grade = 'D' THEN 1
							 ELSE 0
						END) As TotalD,
					SUM(CASE WHEN grade = 'E' THEN 1
							 ELSE 0
						END) As TotalE
					FROM grade
					GROUP BY Personal_id) AS Personal_Bonus ON Personal.ID = Personal_Bonus.Personal_id
GROUP BY Department.NameDepartment,
		 Department.HeadName