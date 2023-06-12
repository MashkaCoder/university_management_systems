# Система управления университетом

Данный проект представляет собой API для университетской системы управления, которая позволяет выполнять операции с данными о студентах, преподавателях, курсах и оценках студентов.

## Установка

```angular2html
    git clone https://github.com/MashkaCoder/university_management_systems.git
    cd university_management_systems
```
Создайте виртуальное окружение и установите необходимые библиотеки
```angular2html
    pip install -r requirements.txt
```

## Настройка базы данных

1. Проверьте, что PostgreSQL сервер установлен и запущен на вашем компьютере.
2. Создайте базу данных с именем `university` в pgAdmim.
3. Укажите соответствующие значения хоста, порта, имени пользователя и имени бд для подключения к базе данных в файле `api_point.py` или замените соответвующие данные на ваши.
4. Установите соедение с созданной базой данных `university` удобным вам способом и запустите скрипт для создания таблиц `create_db.sql` и заполнения базы данных `insert_values_to_db.sql`.

## Запуск приложения

1. Запустите API-сервер с помощью команды:
```angular2html
    uvicorn api_point:app --reload
```
2. Приложение будет доступно по адресу `http://localhost:8000`.

## Документация API

После запуска приложения, вы можете просмотреть и протестировать доступные точки входа, перейдя по адресу `http://localhost:8000/docs`. В документации API вы найдете подробные описания и примеры запросов для каждой точки входа.


## ER-диаграма
[!er_diagram](er_diagram.png)

## Описание сущностей и их свойств
<details>
<summary>Студент (Student)</summary>

- id (int): Уникальный идентификатор студента
- first_name (varchar(50)): Имя студента
- middle_name (varchar(50)): Отчество студента
- last_name (varchar(50)): Фамилия студента
- gender (varchar(10)): Пол студента
- birthday (date): Дата рождения студента
- email (varchar(100)): Email студента
- phone (varchar(11)): Телефонный номер студента
- group_id (int): Идентификатор группы, в которой состоит студент
</details>

<details>
<summary> Преподаватель (Teacher) </summary>

- id (int): Уникальный идентификатор преподавателя 
- first_name (varchar(50)): Имя преподавателя
- middle_name (varchar(50)): Отчество преподавателя 
- last_name (varchar(50)): Фамилия преподавателя 
- gender (varchar(10)): Пол преподавателя
- birthday (date): Дата рождения преподавателя 
- email (varchar(100)): Email преподавателя 
- phone (varchar(11)): Телефонный номер преподавателя 
- grade (varchar(30)): Ученая степень преподавателя 
- salary (int): Зарплата преподавателя
</details>

<details>
<summary>Курс (Course)</summary>

- id (int): Уникальный идентификатор курса
- name (varchar(50)): Название курса
</details>


<details>
<summary>Группа (Group)</summary>

- id (int): Уникальный идентификатор группы 
- name (varchar(50)): Название группы 
- faculty_id (int): Идентификатор факультета, к которому принадлежит группа 
- syllabus_id (int): Идентификатор учебного плана, связанного с группо 
</details>

<details>
<summary>Отделение (Department)</summary>

- id (int): Уникальный идентификатор отделения
- name (varchar(50)): Название отделения
- faculty_id (int): Идентификатор факультета, к которому относится отделение
</details>

<details>
<summary>Оценка (Mark)</summary>

- id (int): Уникальный идентификатор оценки
- mark (int): Оценка
- course_id (int): Идентификатор курса
- semester_id (str): Идентификатор семестра
- student_id (int): Идентификатор студента

</details>

<details>
<summary>Расписание (Schedule)</summary>

- id (int): Уникальный идентификатор расписания
- day_of_the_week (varchar(15)): День недели, на который составлено расписание
- time_start (time): Время начала занятия
- time_end (time): Время окончания занятия
- teacher_id (int): Идентификатор преподавателя, который ведет занятие
- group_id (int): Идентификатор группы, для которой составлено расписание 
- audience_id (int): Идентификатор аудитории в которой проходит занятие
</details>

<details>
<summary>Расписание курса (ScheduleCourse)</summary>

- id (int): Уникальный идентификатор записи расписания курса
- schedule_id (int): Идентификатор расписания
- course_id (int): Идентификатор курса, связанного с расписанием
</details>

<details>
<summary>Здание (Building)</summary>

- id (int): Уникальный идентификатор здания
- name (varchar(200)): Название здания
- address (varchar(250)): Адрес здания
</details>

<details>
<summary>Аудитория (Audience)</summary>

- id (int): Уникальный идентификатор аудитории
- name (varchar(50)): Название аудитории
- building (int): Идентификатор здания
</details>

<details>
<summary>Семестр (Semester)</summary>

- id (int): Уникальный идентификатор семестра
- name (varchar(30)): Название семестра
- date_start (date): Дата начала семестра
- date_end (date): Дата окончания семестра
</details>

<details>
<summary>Факультет (Faculty)</summary>

- id (int): Уникальный идентификатор факультета
- name (varchar(100)): Название факультета
</details>

<details>
<summary>Экзамен (Exam)</summary>

- id (int): Уникальный идентификатор экзамена
- name (varchar(50)): Название экзамена
- task (varchar(1000)): Задание экзамена
</details>

<details>
<summary>Задание для самостоятельной работы (IndependentWork)</summary>

- id (int): Уникальный идентификатор самостоятельной работы
- task_name (varchar(50)): Название самостоятельной работы
- submission_date (date): Срок сдачи самостоятельной работы
- student_id (int): Идентификатор студента, сдавшего работу
- task (varchar(1000)): Задание самостоятельной работы
</details>

<details>
<summary>Программа курса самостоятельной работы (CourseProgramIndependentWork)</summary>

- id (int): Уникальный идентификатор программы курса самостоятельной работы
- course_program_id (int): Идентификатор программы курса, к которой относится самостоятельная работа
- ind_work_id (int): Идентификатор самостоятельной работы, включенной в программу курса
</details>

<details>
<summary>Программа курса (CourseProgram)</summary>

- id (int): Уникальный идентификатор программы курса
- description (varchar(500)): Описание программы курса
- course_id (int): Идентификатор курса, к которому относится программа
- exam_id (int) : Идентификатор экзамена, относящийся к программа
</details>

<details>
<summary>Учебный план (Syllabus)</summary>

- id (int): Уникальный идентификатор учебного плана
- course_id (int): Идентификатор курса
- semester_id (int): Идентификатор семестра
- description (varchar(500)): Описание учебного плана
</details>


## Файлы проекта

- `api_point.py` - основной файл приложения FastAPI, содержащий точки входа API
- `models.py` - определение моделей Pydantic для машрутов
- `index.html` - файл стартовой страницы приложения, содержащий описание доступных точек входа
- `create_db.sql` - скрипт для создания таблиц бд 
- `insert_values_to_db.sql` - скрипт для заполнения таблиц бд
- `query_db.sql` - некоторые SQL запросы к бд
- `requirements.txt` - список зависимостей проекта.

