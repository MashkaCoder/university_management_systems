-- 1. Выбрать всех студентов, обучающихся на курсе "Математика".
SELECT Student.*
FROM Student
JOIN "Group" ON Student.group_id = "Group".id
JOIN Syllabus ON "Group".syllabus_id = Syllabus.id
JOIN Course ON Syllabus.course_id = Course.id
WHERE Course.name = 'Математика';

-- 2. Обновить оценку студента по курсу.
UPDATE Mark
SET mark = 77
WHERE student_id = 1
  AND course_id = 1;

-- 3. Выбрать всех преподавателей, которые преподают в здании No3.
SELECT DISTINCT Teacher.*
FROM Teacher
JOIN Schedule ON Teacher.id = Schedule.teacher_id
JOIN Audience ON Schedule.audience_id = Audience.id
JOIN Building ON Audience.building = Building.id
WHERE Building.id = 3;

-- 4. Удалить задание для самостоятельной работы, которое было создано более года назад.
DELETE FROM Course_program_Independent_work
WHERE ind_work_id IN (
    SELECT id
    FROM Independent_work
    WHERE submission_date < CURRENT_DATE - INTERVAL '1 year'
);

DELETE FROM Independent_work
WHERE submission_date < CURRENT_DATE - INTERVAL '1 year';

-- 5. Добавить новый семестр в учебный год.
INSERT INTO Semester (id, name, date_start, date_end)
VALUES (5, 'Весенний семестр 2025', '2025-01-01', '2025-05-31');
