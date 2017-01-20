import datajoint as dj
import numpy as np
schema = dj.schema('dj_exams', locals())

@schema
class Person(dj.Manual):
    definition = """ # A person identity.
    person_id : int  # uniquely identifies a person
    ----
    first : varchar(32)
    last : varchar(32)
    """

@schema
class Student(dj.Manual):
    definition = """ # A person identity.
    -> Person
    ----
    major : varchar(32) # Field of study
    enrolled_on : date  # when the student enrolled.
    """

@schema
class Professor(dj.Manual):
    definition = """ # A person identity.
    -> Person
    ----
    department : varchar(64)  # Department that the professor works under.
    salary : int  # yearly pay
    """

@schema
class Course(dj.Manual):
    definition = """ # An course definition.
    course_number : int # the university's course number
    ----
    course_desc : varchar(128)
    """

@schema
class CourseOffering(dj.Manual):
    definition = """ # An course definition.
    course_offering_id : int #  Unique course offering.
    ----
    ->Course
    professor_id ->Professor
    term : enum("fall","spring","winter")
    year :  int
    """

@schema
class CourseRegistration(dj.Manual):
    definition = """ # An course definition.
    ->CourseOffering
    student ->Student
    ----
    """


@schema
class CourseExam(dj.Manual):
    definition = """ # An course definition.
    ->CourseOffering
    exam_id : smallint
    ----
    points_possible : smallint
    """

@schema
class StudentExam(dj.Manual):
    definition = """ # An instance of a student taking an exam.
    ->CourseExam
    ->Student
    ----
    points_earned : smallint
    """

schema.spawn_missing_classes()

import datetime
def create_fake_data():
    # Create people
    Person().insert((
        [1,'prof','one'],
        [2,'prof','two'],
        [3,'stud','a1'],
        [4,'stud','a2'],
        [5,'stud','b1'],
        [6,'stud','b2'],), skip_duplicates=True)

    # Create Professors
    Professor().insert((
        [1, 'math', 1337],
        [2, 'math', 1337],), skip_duplicates=True)

    # Create Students
    now = datetime.datetime.now()
    Student().insert((
        [3, 'math', now],
        [4, 'csci', now],
        [5, 'hist', now],
        [6, 'math', now],), skip_duplicates=True)

    # Create Course
    c = {'course_number':1,'course_desc':'An introduction to math culture.'}
    Course().insert([c], skip_duplicates=True)

    # Create course offerings
    CourseOffering().insert((
        [1, 1, 1, "fall", 2016],
        [2, 1, 2, "winter", 2017]),skip_duplicates=True)

    # Assign students to course offerings
    CourseRegistration().insert((
        [1,3],
        [1,4],
        [2,5],
        [2,6],),skip_duplicates=True)
