SELECT
Personal.Fio AS FIO,
Department.namedepartment AS Department
FROM Personal JOIN Department ON Personal.Department_id = Department.ID