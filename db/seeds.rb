def seed(model, data)
  data.each do |item|
    model.create!(item) unless model.exists?(item)
  end
end

buildings = [
    {title: "Classic 7", code: "C7H"},
    {title: "Parukářka", code: "PAR"},
    {title: "Chodov", code: "CHO"},
    {title: "Chajda v lese", code: "TO_CHCES"}
]

seed(Building, buildings)

rooms = [
    {title: "Plná lekcí", code: "PAR_1.1", building_id: 2},
    {title: "Medium", code: "PAR_0.1", building_id: 2},
    {title: "Small", code: "PAR_1.3", building_id: 2},
    {title: "Fancy", code: "C7H_F", building_id: 1},
    {title: "Daleko", code: "CHO_D", building_id: 3},
    {title: "U krbu", code: "TO_CHCES_KRB", building_id: 4}
]
seed(Room, rooms)

students = [
    {first_name: "Jarda", last_name: "Zelený", email: "j@z", study_type: "Full-time"},
    {first_name: "Jožo", last_name: "Červený", email: "j@c", study_type: "Full-time"},
    {first_name: "Tran Duc Nguyen Phuket", last_name: "Kuala Lumpur", email: "verylongemail@hello.com", study_type: "Part-time"},
    {first_name: "Karel", last_name: "Vorel", email: "kv", study_type: "Full-time"}
]
seed(Student, students)

teachers = [
    {first_name: "Pepa", last_name: "Vomáčka", email: "p@v.cz"},
    {first_name: "Jura", last_name: "Dura", email: "j@d.cz"},
    {first_name: "John", last_name: "Doe", email: "something"},
    {first_name: "Ruda", last_name: "Vrána", email: "rv"},
    {first_name: "Hana", last_name: "Zelená", email: "hz"}
]
seed(Teacher, teachers)

courses = [
    {title: "Webové technologie", code: "WEB", study_type: "Full-time", language: "Czech"},
    {title: "Matematika 1", code: "MA1", study_type: "Full-time", language: "Czech"},
    {title: "Czech for Erasmus Students", code: "CZE", study_type: "Part-time", language: "English"},
    {title: "Makroekonomie", code: "MAE", study_type: "Full-time", language: "Czech"},
    {title: "Workshop", code: "WRK", study_type: "Full-time", language: "Czech"}
]
seed(Course, courses)

lessons = [
    {start_at: "2017-12-12 09:00:00", end_at: "2017-12-12 10:00:00", duration: nil, room_id: 1, teacher_id: 2, course_id: 1},
    {start_at: "2017-12-13 13:00:00", end_at: "2017-12-14 14:30:00", duration: nil, room_id: 2, teacher_id: 1, course_id: 1},
    {start_at: "2017-12-12 11:00:00", end_at: "2017-12-12 12:00:00", duration: nil, room_id: 1, teacher_id: 4, course_id: 2},
    {start_at: "2017-12-12 17:00:00", end_at: "2017-12-12 18:30:00", duration: 90, room_id: 1, teacher_id: 3, course_id: 3},
    {start_at: "2017-12-11 10:07:00", end_at: "2017-12-11 10:08:00", duration: nil, room_id: 1, teacher_id: 2, course_id: 4},
    {start_at: "2017-12-13 10:07:00", end_at: "2017-12-13 15:14:00", duration: nil, room_id: 1, teacher_id: 1, course_id: 4},
    {start_at: "2017-12-14 12:15:00", end_at: "2017-12-15 14:15:00", duration: nil, room_id: 1, teacher_id: 4, course_id: 5},
    {start_at: "2017-12-16 08:00:00", end_at: "2017-12-16 10:00:00", duration: nil, room_id: 1, teacher_id: 3, course_id: 3},
    {start_at: "2017-12-14 10:06:00", end_at: "2017-12-14 11:14:00", duration: nil, room_id: 4, teacher_id: 1, course_id: 2},
    {start_at: "2017-12-14 10:00:00", end_at: "2017-12-14 15:00:00", duration: nil, room_id: 6, teacher_id: 4, course_id: 4},
    {start_at: "2017-12-12 10:20:00", end_at: "2017-12-14 12:30:00", duration: nil, room_id: 3, teacher_id: 1, course_id: 4}
]
seed(Lesson, lessons)


student_assignments = [
    {course_id: 2, student_id: 3},
    {course_id: 3, student_id: 3},
    {course_id: 1, student_id: 2},
    {course_id: 2, student_id: 2},
    {course_id: 1, student_id: 1},
    {course_id: 2, student_id: 1},
    {course_id: 5, student_id: 1},
    {course_id: 2, student_id: 4},
    {course_id: 3, student_id: 4},
    {course_id: 4, student_id: 4}
]
seed(StudentAssignment, student_assignments)

teacher_assignments = [
    {teacher_id: 5, course_id: 1},
    {teacher_id: 5, course_id: 3},
    {teacher_id: 4, course_id: 2},
    {teacher_id: 4, course_id: 5},
    {teacher_id: 3, course_id: 1},
    {teacher_id: 3, course_id: 2},
    {teacher_id: 2, course_id: 3},
    {teacher_id: 1, course_id: 1},
    {teacher_id: 1, course_id: 2},
    {teacher_id: 1, course_id: 4}
]
seed(TeacherAssignment, teacher_assignments)

