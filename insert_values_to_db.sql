-- заполнение таблицы Building
INSERT INTO Building (id, name, address)
VALUES
    (1, 'Корпус 1', 'Адрес 1'),
    (2, 'Корпус 2', 'Адрес 2'),
    (3, 'Корпус 3', 'Адрес 3');

-- заполнение таблицы Semester
INSERT INTO Semester (id, name, date_start, date_end)
VALUES
    (1, 'Осенний семестр 2023', '2023-09-01', '2023-12-31'),
    (2, 'Весенний семестр 2024', '2024-01-01', '2024-05-31'),
    (3, 'Осенний семестр 2024', '2024-09-01', '2024-12-31');

-- заполнение таблицы Faculty
INSERT INTO Faculty (id, name)
VALUES
    (1, 'Факультет 1'),
    (2, 'Факультет 2'),
    (3, 'Факультет 3');

-- заполнение таблицы Department
INSERT INTO Department (id, name, faculty_id)
VALUES
    (1, 'Отделение 1', 1),
    (2, 'Отделение 2', 1),
    (3, 'Отделение 3', 2),
    (4, 'Отделение 4', 2),
    (5, 'Отделение 5', 3),
    (6, 'Отделение 6', 3);


-- заполнение таблицы Audience
INSERT INTO Audience (id, name, building)
VALUES
    (1, 'Аудитория 1', 1),
    (2, 'Аудитория 2', 1),
    (3, 'Аудитория 3', 2),
    (4, 'Аудитория 4', 2),
    (5, 'Аудитория 5', 3),
    (6, 'Аудитория 6', 3),
    (7, 'Аудитория 7', 3);

-- заполнение таблицы Course
INSERT INTO Course (id, name)
VALUES
    (1, 'Математика'),
    (2, 'Физика'),
    (3, 'Химия');

-- заполнение таблицы Syllabus
INSERT INTO Syllabus (id, course_id, semester_id, description)
VALUES
    (1, 1, 1, 'Учебный план 1'),
    (2, 2, 2, 'Учебный план 2'),
    (3, 3, 3, 'Учебный план 3');

-- заполнение таблицы "Group"
INSERT INTO "Group" (id, name, faculty_id, syllabus_id)
VALUES
    (1, 'Группа 1', 1, 1),
    (2, 'Группа 2', 2, 2),
    (3, 'Группа 3', 3, 3);

-- заполнение таблицы Student
INSERT INTO Student (id, first_name, middle_name, last_name, gender, birthday, email, phone, group_id)
VALUES
    (1, 'Мирослава', 'Максимовна', 'Еремеева', 'Женский', '2000-03-12', 'student1@example.com', '79952670765', 1),
    (2, 'Артем', 'Дмитриевич', 'Никитин', 'Мужской', '2000-09-01', 'student2@example.com', '79643351209', 1),
    (3, 'Лариса', 'Филипповна', 'Казакова', 'Женский', '1999-03-01', 'student3@example.com', '79912763421', 2),
    (4, 'Михаил', 'Тимофеевич', 'Казаков', 'Мужской', '2000-04-01', 'student4@example.com', '79254412786', 2),
    (5, 'Алиса', 'Романовна', 'Коновалова', 'Женский', '2000-07-17', 'studen54@example.com', '79056345623', 2),
    (6, 'Камила', 'Антоновна', 'Чернова', 'Женский', '1999-03-19', 'student6@example.com', '79219073144', 3),
    (7, 'Евгения', 'Павловна', 'Сахарова', 'Женский', '2000-06-28', 'student7@example.com', '79643873211', 3),
    (8, 'Федор', 'Всеволодович', 'Горшков', 'Мужской', '1999-05-23', 'student8@example.com', '79216120945', 3);


-- заполнение таблицы Exam
INSERT INTO Exam (id, name, task)
VALUES
    (1, 'Экзамен 1', 'Задание 1'),
    (2, 'Экзамен 2', 'Задание 2'),
    (3, 'Экзамен 3', 'Заданиее 3');


-- заполнение таблицы Independent_work
INSERT INTO Independent_work (id, task_name, submission_date, student_id, task)
VALUES
    (1, 'Самостоятельная работа 1', '2023-09-15', 1, 'Задание 1'),
    (2, 'Самостоятельная работа 2', '2020-10-15', 2, 'Задание 2'),
    (3, 'Самостоятельная работа 3', '2023-11-15', 3, 'Задание 3'),
    (4, 'Самостоятельная работа 3', '2023-11-16', 4, 'Задание 3');


-- заполнение таблицы Course_program
INSERT INTO Course_program (id, description, exam_id, course_id)
VALUES
    (1, 'Программа курса 1', 1, 1),
    (2, 'Программа курса 2', 2, 2),
    (3, 'Программа курса 3', 3, 3);

-- заполнение таблицы Course_program_Independent_work
INSERT INTO Course_program_Independent_work(id, course_program_id, ind_work_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

-- заполнение таблицы Teacher
INSERT INTO Teacher (id, first_name, middle_name, last_name, gender, birthday, email, phone, grade, salary)
VALUES
    (1, 'Тимошина', 'Ирина', 'Васильевна', 'Женский', '1955-04-24', 'teacher1@example.com', '79216548769', 'Доктор', 154000),
    (2, 'Беляев', 'Валерий', 'Юрьевич', 'Мужской', '1954-02-01', 'teacher2@example.com', '79642219807', 'Кандитат', 135000),
    (3, 'Долгов', 'Вадим', 'Абрамович', 'Мужской', '1960-03-12', 'teacher3@example.com', '79251711416', 'Доцент', 107500);

-- заполнение таблицы Mark
INSERT INTO Mark (id, mark, course_id, semester_id, student_id)
VALUES
    (1, 80, 1, 1, 1),
    (2, 90, 2, 2, 1),
    (3, 80, 3, 1, 2),
    (4, 90, 1, 2, 2),
    (5, 80, 2, 1, 3),
    (6, 90, 3, 2, 3),
    (7, 80, 1, 1, 4),
    (8, 90, 2, 2, 4),
    (9, 85, 3, 3, 5);

-- заполнение таблицы Schedule
INSERT INTO Schedule (id, day_of_the_week, time_start, time_end, teacher_id, group_id, audience_id)
VALUES
    (1, 'Monday', '09:00:00', '11:00:00', 1, 1, 1),
    (2, 'Monday', '10:00:00', '12:00:00', 2, 2, 2),
    (3, 'Tuesday', '10:00:00', '12:00:00', 2, 3, 5),
    (4, 'Monday', '10:00:00', '12:00:00', 3, 1, 6),
    (5, 'Friday', '10:00:00', '12:00:00', 2, 2, 7),
    (6, 'Wednesday', '11:00:00', '13:00:00', 3, 3, 3);

-- заполнение таблицы Schedule_course
INSERT INTO Schedule_course  (id, schedule_id, course_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 1),
    (5, 5, 2),
    (6, 6, 3);
