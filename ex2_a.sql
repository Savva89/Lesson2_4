SELECT
FIO,
Salary
FROM Personal
WHERE(Salary = (SELECT
	  MAX(Salary)
	  FROM Personal))