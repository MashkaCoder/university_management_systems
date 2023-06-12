import psycopg2
from fastapi import FastAPI, HTTPException, Response
from models import Student, Student_update, Student_сreate, Course, Mark_create, Mark_update, Course_create

db_host = 'localhost'   # укажите ваш хост
db_port = '5433'  # укажите ваш порт
db_name = 'university'
db_user = 'postgres'  # укажите вашего юзера

# Создание подключения
conn = psycopg2.connect(
    host=db_host,
    port=db_port,
    dbname=db_name,
    user=db_user,
)


app = FastAPI()

#  стартовая страница
@app.get("/")
def read_root():
    with open('index.html', 'r') as file:
        html_content = file.read()
    response = Response(content=html_content, media_type='text/html')
    return response


#  1.создать нового студента
@app.post("/students")
def create_student(student: Student_сreate):
    try:
        cursor = conn.cursor()
        cursor.execute(
            """INSERT INTO Student (id, first_name, middle_name, last_name, gender, birthday, email, phone, group_id) 
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)""",
            (student.id, student.first_name, student.middle_name, student.last_name, student.gender,
             student.birthday, student.email, student.phone, student.group_id)
        )
        conn.commit()
        cursor.close()
        return {"message": "Student created successfully"}
    except Exception as e:
        return {"error": str(e)}


#  2.получить информацию о студенте по его id
@app.get('/students/{student_id}')
def get_student(student_id: int):
    try:
        cursor = conn.cursor()
        cursor.execute(f"SELECT * FROM Student WHERE id={student_id}")
        row = cursor.fetchone()
        cursor.close()
        if row:
            student = Student(
                id=row[0],
                first_name=row[1],
                middle_name=row[2],
                last_name=row[3],
                gender=row[4],
                birthday=str(row[5]),
                email=row[6],
                phone=row[7],
                group_id=row[8]
            )
            return student
        else:
            raise HTTPException(status_code=404, detail="Student not found")
    except Exception as e:
        return {"error": str(e)}


#   3.обновить информацию о студенте по его id
@app.put('/students/{student_id}')
def student(student_id: int, student_update: Student_update):
    try:
        cursor = conn.cursor()
        cursor.execute(
            """UPDATE Student SET
                            first_name = %s,
                            middle_name = %s,
                            last_name = %s,
                            gender = %s,
                            birthday = %s,
                           email = %s,
                           phone = %s,
                           group_id = %
                           WHERE id = %s""",
            (student_update.first_name,
             student_update.middle_name,
             student_update.last_name,
             student_update.gender,
             student_update.birthday,
             student_update.email,
             student_update.phone,
             student_update.group_id,
             student_id)
        )
        conn.commit()
        cursor.close()
        return {"message": "Student updated successfully", "student": get_student(student_id)}
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}


#  4.удалить студента по его id
@app.delete("/students/{student_id}")
def delete_student(student_id: int):
    try:
        with conn.cursor() as cur:
            cur.execute(f"DELETE FROM Mark WHERE student_id = {student_id}")
            cur.execute(
                f"DELETE FROM Course_program_independent_work WHERE ind_work_id IN (SELECT id FROM Independent_work WHERE student_id = {student_id})")
            cur.execute(f"DELETE FROM Independent_work WHERE student_id = {student_id}")
            cur.execute(f"DELETE FROM Student WHERE id = {student_id}")
        return {"message": "Student deleted successfully"}
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}


#  5.получить список всех преподавателей
@app.get('/teachers')
def get_teachers():
    try:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Teacher")
        rows = cursor.fetchall()
        cursor.close()

        teachers = []
        for row in rows:
            teacher = {
                'id': row[0],
                'first_name': row[1],
                'middle_name': row[2],
                'last_name': row[3],
                'gender': row[4],
                'birthday': str(row[5]),
                'email': row[6],
                'phone': row[7],
                'grade': row[8],
                'salary': row[9]

            }
            teachers.append(teacher)
        return teachers
    except Exception as e:
        return {'error': str(e)}


#  6.создать новый курс
@app.post('/courses')
def create_course(course: Course_create):
    try:
        cursor = conn.cursor()
        cursor.execute(
            """INSERT INTO Course(id, name)
                VALUES (%s, %s)
            """,
            (course.id, course.name)
        )
        conn.commit()
        cursor.close()
        return {"message": "Course created succesfully"}
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}


#  7.получить информацию о курсе по его id
@app.get('/courses/{course_id}')
def get_course(course_id: int):
    try:
        cursor = conn.cursor()
        cursor.execute(f"SELECT * FROM Course WHERE id={course_id}")
        row = cursor.fetchone()
        cursor.close()

        if row:
            course = Course(
                id=row[0],
                name=row[1]
            )
            return course
    except Exception as e:
        return {'error': str(e)}


#  8. получить список всех студентов на курсе
@app.get('/courses/{course_id}/students')
def get_students_on_course(course_id: int):
    try:
        cursor = conn.cursor()
        cursor.execute(f"""SELECT Student.*
                            FROM Student
                            JOIN "Group" ON Student.group_id = "Group".id
                            JOIN Syllabus ON "Group".syllabus_id = Syllabus.id
                            JOIN Course ON Syllabus.course_id = Course.id
                            WHERE Course.id = {course_id}""")
        rows = cursor.fetchall()

        students_course = []
        for row in rows:
            student = {
                'id': row[0],
                'first_name': row[1],
                'middle_name': row[2],
                'last_name': row[3],
                'gender': row[4],
                'birthday': str(row[5]),
                'email': row[6],
                'phone': row[7],
                'group_id': row[8],
            }
            students_course.append(student)
        return students_course
    except Exception as e:
        return {'error': str(e)}


#  9.создать новую оценку для студента по курсу
@app.post('/grades')
def create_mark(mark: Mark_create):
    try:
        cursor = conn.cursor()
        cursor.execute(
            """INSERT INTO Mark(id, mark, course_id, semester_id, student_id)
                VALUES (%s, %s, %s, %s, %s)""",
            (mark.id, mark.mark, mark.course_id, mark.semester_id, mark.student_id)
        )
        conn.commit()
        cursor.close()
        return {"message": "Mark created successfully"}
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}


# 10.обновить оценку студента по курсу
@app.put('/grades/{grade_id}')
def mark_update(grade_id: int, mark: Mark_update):
    try:
        cursor = conn.cursor()
        cursor.execute(
            """UPDATE Mark SET
                mark = %s,
                course_id = %s,
                semester_id = %s,
                student_id = %s
                WHERE id = %s""",
            (mark.mark, mark.course_id, mark.semester_id, mark.student_id, grade_id)
        )
        conn.commit()
        cursor.close()
        return {"message": "Mark updated successfully"}
    except Exception as e:
        conn.rollback()
        return {"error": str(e)}
