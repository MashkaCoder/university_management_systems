from datetime import date
from pydantic import BaseModel, Field


#   модель таблицы студентов
class Student(BaseModel):
    id: int = Field(eg=0)
    first_name: str = Field(max_length=50)
    middle_name: str = Field(max_length=50)
    last_name: str = Field(max_length=50)
    gender: str = Field(max_length=10)
    birthday: str
    email: str = Field(max_length=100)
    phone: str = Field(max_length=11)
    group_id: int = Field(eg=0)


#  Модель данных для создания студента
class Student_сreate(BaseModel):
    id: int = Field(eg=0)
    first_name: str = Field(max_length=50)
    middle_name: str = Field(max_length=50)
    last_name: str = Field(max_length=50)
    gender: str = Field(max_length=10)
    birthday: date
    email: str = Field(max_length=100)
    phone: str = Field(max_length=11)
    group_id: int = Field(eg=0)


#  Модель данных для обновления данных студента
class Student_update(BaseModel):
    first_name: str = Field(max_length=50)
    middle_name: str = Field(max_length=50)
    last_name: str = Field(max_length=50)
    gender: str = Field(max_length=10)
    birthday: date
    email: str = Field(max_length=100)
    phone: str = Field(max_length=11)
    group_id: int = Field(eg=0)


#   модель таблицы педагогов
class Teacher(BaseModel):
    id: int = Field(eg=0)
    first_name: str = Field(max_length=50)
    middle_name: str = Field(max_length=50)
    last_name: str = Field(max_length=50)
    gender: str = Field(max_length=10)
    birthday: str
    email: str = Field(max_length=100)
    phone: str = Field(max_length=11)
    grade: str = Field(max_length=30)
    salary: int = Field(eg=0)


#   модель таблицы курса
class Course(BaseModel):
    id: int = Field(eg=0)
    name: str = Field(max_length=50)


#   модель для добавления новой оценки
class Mark_create(BaseModel):
    id: int = Field(eg=0)
    mark: int
    course_id: int = Field(eg=0)
    semester_id: int = Field(eg=0)
    course_id: int = Field(eg=0)
    student_id: int = Field(eg=0)


#   модель для обновления оценки
class Mark_update(BaseModel):
    mark: int
    course_id: int = Field(eg=0)
    semester_id: int = Field(eg=0)
    student_id: int = Field(eg=0)

#   модель для создания курса
class Course_create(BaseModel):
    id: int = Field(eg=0)
    name: str = Field(max_length=50)
