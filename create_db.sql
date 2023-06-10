CREATE TABLE Building(
    id          INT PRIMARY KEY ,
    name        VARCHAR(200),
    address     VARCHAR(250)
);

CREATE TABLE Syllabus(
    id              INT PRIMARY KEY ,
    course_id       INT NOT NULL,
    semester_id     INT NOT NULL,
    description     VARCHAR(500) NOT NULL
);

CREATE TABLE Course(
    id          INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL
);

CREATE TABLE Course_program(
    id              INT PRIMARY KEY,
    description     VARCHAR(500) NOT NULL,
    exam_id         INT NOT NULL,
    course_id       INT NOT NULL
);

CREATE TABLE Faculty(
    id     INT PRIMARY KEY,
    name   VARCHAR(100) NOT NULL
);

CREATE TABLE Audience(
    id         INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    building   INT NOT NULL
);

CREATE TABLE Semester(
    id          INT PRIMARY KEY,
    name        VARCHAR(30) NOT NULL,
    date_start  DATE NOT NULL,
    date_end    DATE NOT NULL
);

CREATE TABLE Exam(
    id      INT PRIMARY KEY,
    name    VARCHAR(50) NOT NULL,
    task    VARCHAR(1000) NOT NULL
);

CREATE TABLE Department(
    id          INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    faculty_id  INT NOT NULL
);

CREATE TABLE Schedule(
    id                     INT PRIMARY KEY,
    day_of_the_week        VARCHAR(15) NOT NULL,
    time_start             TIME(0) WITHOUT TIME ZONE NOT NULL,
    time_end               TIME(0) WITHOUT TIME ZONE NOT NULL,
    teacher_id             INT NOT NULL,
    group_id               INT NOT NULL,
    audience_id            INT NOT NULL
);

CREATE TABLE Schedule_course (
    id              INT PRIMARY KEY,
    schedule_id     INT NOT NULL,
    course_id       INT NOT NULL
);

CREATE TABLE Independent_work(
    id                  INT PRIMARY KEY,
    task_name           VARCHAR(50) NOT NULL,
    submission_date     DATE NOT NULL,
    student_id          INT NOT NULL,
    task                VARCHAR(1000) NOT NULL
);

-- !!!!!!!!
CREATE TABLE Course_program_Independent_work
(
    id                INT PRIMARY KEY,
    course_program_id INT NOT NULL,
    ind_work_id       INT NOT NULL
);


CREATE TABLE "Group"(
    id          INT PRIMARY KEY,
    name        VARCHAR(50) NOT NULL,
    faculty_id  INT NOT NULL,
    syllabus_id INT NOT NULL
);

CREATE TABLE Mark(
    id              INT PRIMARY KEY,
    mark            INT NOT NULL,
    course_id       INT NOT NULL,
    semester_id     INT NOT NULL,
    student_id      INT NOT NULL
);

CREATE TABLE Student(
    id              INT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    middle_name     VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    gender          VARCHAR(10) NOT NULL,
    birthday        DATE NOT NULL,
    email           VARCHAR(100) NOT NULL,
    phone           VARCHAR(11) NOT NULL,
    group_id        INT NOT NULL
);

CREATE TABLE Teacher(
    id              INT PRIMARY KEY,
    first_name      VARCHAR(50) NOT NULL,
    middle_name     VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    gender          VARCHAR(10) NOT NULL,
    birthday        DATE NOT NULL,
    email           VARCHAR(100) NOT NULL,
    phone           VARCHAR(11) NOT NULL,
    grade           VARCHAR(30) NOT NULL,
    salary          INT NOT NULL
);

-- составление зависимостей между таблицами
ALTER TABLE
    Mark ADD CONSTRAINT "mark_semester_id_foreign" FOREIGN KEY("semester_id") REFERENCES Semester("id");
ALTER TABLE
    Course_program ADD CONSTRAINT "course_id_foreign" FOREIGN KEY("course_id") REFERENCES Course("id");
ALTER TABLE
    Mark ADD CONSTRAINT "mark_student_id_foreign" FOREIGN KEY("student_id") REFERENCES Student("id");
ALTER TABLE
    Course_program ADD CONSTRAINT "course_program_exam_id_foreign" FOREIGN KEY("exam_id") REFERENCES Exam("id");
ALTER TABLE
    Mark ADD CONSTRAINT "mark_course_id_foreign" FOREIGN KEY("course_id") REFERENCES Course("id");
ALTER TABLE
    Syllabus ADD CONSTRAINT "syllabus_semester_id_foreign" FOREIGN KEY("semester_id") REFERENCES Semester("id");
ALTER TABLE
    Schedule ADD CONSTRAINT "schedule_teacher_foreign" FOREIGN KEY("teacher_id") REFERENCES Teacher("id");
ALTER TABLE
    "Group" ADD CONSTRAINT "group_syllabus_id_foreign" FOREIGN KEY("syllabus_id") REFERENCES Syllabus("id");
ALTER TABLE
    Independent_work ADD CONSTRAINT "independent_work_student_id_foreign" FOREIGN KEY("student_id") REFERENCES Student("id");
ALTER TABLE
    Department ADD CONSTRAINT "department_faculty_id_foreign" FOREIGN KEY("faculty_id") REFERENCES Faculty("id");
ALTER TABLE
    Schedule ADD CONSTRAINT "schedule_audience_foreign" FOREIGN KEY("audience_id") REFERENCES Audience("id");
ALTER TABLE
    "Group" ADD CONSTRAINT "group_faculty_id_foreign" FOREIGN KEY("faculty_id") REFERENCES Faculty("id");
ALTER TABLE
    Student ADD CONSTRAINT "student_group_id_foreign" FOREIGN KEY("group_id") REFERENCES "Group"("id");
ALTER TABLE
    Audience ADD CONSTRAINT "audience_building_foreign" FOREIGN KEY("building") REFERENCES Building("id");
ALTER TABLE
    Syllabus ADD CONSTRAINT "syllabus_course_id_foreign" FOREIGN KEY("course_id") REFERENCES Course("id");
ALTER TABLE
    Schedule ADD CONSTRAINT "schedule_group_foreign" FOREIGN KEY("group_id") REFERENCES "Group"("id");

ALTER TABLE
    Schedule_course ADD CONSTRAINT "schedule_course_id_foreign" FOREIGN KEY("course_id") REFERENCES Course("id");
ALTER TABLE
    Schedule_course ADD CONSTRAINT "schedule_course_schedule_id_foreign" FOREIGN KEY("schedule_id") REFERENCES Schedule("id");

ALTER TABLE
    Course_program_Independent_work ADD CONSTRAINT "course_program_ind_work_id_foreign" FOREIGN KEY ("ind_work_id") REFERENCES Independent_work ("id");
ALTER TABLE
    Course_program_Independent_work ADD CONSTRAINT "course_program_id_foreign" FOREIGN KEY ("course_program_id") REFERENCES Course_program ("id");