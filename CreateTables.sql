
CREATE TABLE Department
	(
		ID Serial PRIMARY KEY,
		NameDepartment VARCHAR(50),
		HeadName VARCHAR(100),
		CountOfPersonal INTEGER
	);
	
CREATE TABLE Personal 
	(
		ID Serial PRIMARY KEY,
		FIO VARCHAR(100),
		Birthday Date,
		StartWorkDate Date,
		JobTitle VARCHAR(100),
		PersonalLevel VARCHAR(10),
		Salary INTEGER,
		Department_id INTEGER,
		FOREIGN KEY (Department_id ) REFERENCES Department(id),
		DriverLicense BOOL	
	);
	
CREATE TABLE Grade 
	(
		ID Serial PRIMARY KEY,
		Personal_id INTEGER,
		FOREIGN KEY (Personal_id) REFERENCES Personal(id),
		quarter CHAR, 
		Grade CHAR	
	);



INSERT INTO department (NameDepartment, HeadName, CountOfPersonal) 
VALUES 
('Бухгалтерия', 'Андреева Анна Геннадьевна', 2),
('IT-отдел', 'Иванов Василий Петрович', 4),
('отдел Интеллектуального анализа данных', 'Дмитриев Сергей Иванович', 3);

INSERT INTO Personal (FIO ,Birthday, StartWorkDate, JobTitle, PersonalLevel, Salary, Department_id, DriverLicense) 
VALUES 
('Андреева Анна Геннадьевна', '1981-5-17', '2019-1-15', 'Главный бухгалтер', 'lead', 95000, (SELECT ID FROM Department WHERE NameDepartment = 'Бухгалтерия'),'NO'),
('Плотникова Жанна Сергеевна', '1989-9-1', '2021-7-12', 'Бухгалтер', 'middle', 60000, (SELECT ID FROM Department WHERE NameDepartment = 'Бухгалтерия'),'YES'),
('Иванов Василий Петрович', '1982-2-5', '2020-3-1', 'Руководитель IT-отдел','lead' , 110000, (SELECT ID FROM Department WHERE NameDepartment = 'IT-отдел'),'YES'),
('Хохлов Максим Алексеевич', '1991-8-12', '2019-10-12', 'Системный администратор', 'senior', 90000, (SELECT ID FROM Department WHERE NameDepartment = 'IT-отдел'),'YES'),
('Колесников Петр Александрович', '1993-9-25', '2020-3-12', 'Программист', 'middle', 80000, (SELECT ID FROM Department WHERE NameDepartment = 'IT-отдел'),'NO'),
('Долгих Андрей Дмитриевич', '1999-3-21', '2021-9-22', 'Программист', 'jun', 50000, (SELECT ID FROM Department WHERE NameDepartment = 'IT-отдел'),'NO'),
('Дмитриев Сергей Иванович', '1980-9-9', '2022-11-1', 'Руководитель отдела ИАД', 'lead', 100000, (SELECT ID FROM Department WHERE NameDepartment = 'отдел Интеллектуального анализа данных'),'YES'),
('Васильев Кирилл Романович', '1990-11-7', '2022-11-1', 'Специалист отдела ИАД', 'middle', 85000, (SELECT ID FROM Department WHERE NameDepartment = 'отдел Интеллектуального анализа данных'),'NO'),
('Семенов Александр Андреевич', '1993-8-14', '2022-11-1', 'Специалист отдела ИАД', 'middle', 82000, (SELECT ID FROM Department WHERE NameDepartment = 'отдел Интеллектуального анализа данных'),'NO');

INSERT INTO Grade(Personal_id, quarter, Grade)
VALUES
((SELECT ID FROM Personal WHERE FIO = 'Андреева Анна Геннадьевна'), '1','A'),
((SELECT ID FROM Personal WHERE FIO = 'Андреева Анна Геннадьевна'), '2','C'),
((SELECT ID FROM Personal WHERE FIO = 'Андреева Анна Геннадьевна'), '3','D'),
((SELECT ID FROM Personal WHERE FIO = 'Андреева Анна Геннадьевна'), '4','A'),

((SELECT ID FROM Personal WHERE FIO = 'Плотникова Жанна Сергеевна'), '1','B'),
((SELECT ID FROM Personal WHERE FIO = 'Плотникова Жанна Сергеевна'), '2','E'),
((SELECT ID FROM Personal WHERE FIO = 'Плотникова Жанна Сергеевна'), '3','A'),
((SELECT ID FROM Personal WHERE FIO = 'Плотникова Жанна Сергеевна'), '4','A'),

((SELECT ID FROM Personal WHERE FIO = 'Иванов Василий Петрович'), '1','A'),
((SELECT ID FROM Personal WHERE FIO = 'Иванов Василий Петрович'), '2','A'),
((SELECT ID FROM Personal WHERE FIO = 'Иванов Василий Петрович'), '3','E'),
((SELECT ID FROM Personal WHERE FIO = 'Иванов Василий Петрович'), '4','D'),

((SELECT ID FROM Personal WHERE FIO = 'Хохлов Максим Алексеевич'), '1','C'),
((SELECT ID FROM Personal WHERE FIO = 'Хохлов Максим Алексеевич'), '2','C'),
((SELECT ID FROM Personal WHERE FIO = 'Хохлов Максим Алексеевич'), '3','C'),
((SELECT ID FROM Personal WHERE FIO = 'Хохлов Максим Алексеевич'), '4','A'),

((SELECT ID FROM Personal WHERE FIO = 'Колесников Петр Александрович'), '1','A'),
((SELECT ID FROM Personal WHERE FIO = 'Колесников Петр Александрович'), '2','B'),
((SELECT ID FROM Personal WHERE FIO = 'Колесников Петр Александрович'), '3','D'),
((SELECT ID FROM Personal WHERE FIO = 'Колесников Петр Александрович'), '4','C'),

((SELECT ID FROM Personal WHERE FIO = 'Долгих Андрей Дмитриевич'), '1','B'),
((SELECT ID FROM Personal WHERE FIO = 'Долгих Андрей Дмитриевич'), '2','C'),
((SELECT ID FROM Personal WHERE FIO = 'Долгих Андрей Дмитриевич'), '3','B'),
((SELECT ID FROM Personal WHERE FIO = 'Долгих Андрей Дмитриевич'), '4','A'),

((SELECT ID FROM Personal WHERE FIO = 'Дмитриев Сергей Иванович'), '1','A'),
((SELECT ID FROM Personal WHERE FIO = 'Дмитриев Сергей Иванович'), '2','C'),
((SELECT ID FROM Personal WHERE FIO = 'Дмитриев Сергей Иванович'), '3','E'),
((SELECT ID FROM Personal WHERE FIO = 'Дмитриев Сергей Иванович'), '4','A'),

((SELECT ID FROM Personal WHERE FIO = 'Васильев Кирилл Романович'), '1','C'),
((SELECT ID FROM Personal WHERE FIO = 'Васильев Кирилл Романович'), '2','C'),
((SELECT ID FROM Personal WHERE FIO = 'Васильев Кирилл Романович'), '3','A'),
((SELECT ID FROM Personal WHERE FIO = 'Васильев Кирилл Романович'), '4','B'),

((SELECT ID FROM Personal WHERE FIO = 'Семенов Александр Андреевич'), '1','B'),
((SELECT ID FROM Personal WHERE FIO = 'Семенов Александр Андреевич'), '2','B'),
((SELECT ID FROM Personal WHERE FIO = 'Семенов Александр Андреевич'), '3','B'),
((SELECT ID FROM Personal WHERE FIO = 'Семенов Александр Андреевич'), '4','B');