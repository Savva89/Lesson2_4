SELECT
Personal.Fio AS FIO,
Department.namedepartment AS Department,
Personal.Salary AS Salary
FROM Personal INNER JOIN (SELECT
						  Department_id AS Department_id,
						  MAX(Salary) AS MaxSalary
						  FROM Personal
						  GROUP BY Department_id) AS DepartmentMaxSalary ON Personal.Salary = DepartmentMaxSalary.MaxSalary 
						  													AND Personal.Department_id = DepartmentMaxSalary.Department_id
	 		  JOIN Department ON Personal.Department_id = Department.ID
	 