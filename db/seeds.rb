Building.create!([
  {title: "Classic 7", code: "C7H"},
  {title: "Parukářka", code: "PAR"},
  {title: "Chodov", code: "CHO"},
  {title: "Chajda v lese", code: "TO_CHCES"}
])
Course.create!([
  {title: "Webové technologie", code: "WEB", study_type: "Full-time", language: "Czech"},
  {title: "Matematika 1", code: "MA1", study_type: "Full-time", language: "Czech"},
  {title: "Czech for Erasmus Students", code: "CZE", study_type: "Part-time", language: "English"},
  {title: "Makroekonomie", code: "MAE", study_type: "Full-time", language: "Czech"},
  {title: "Workshop", code: "WRK", study_type: "Full-time", language: "Czech"}
])
Lesson.create!([
  {start_at: "2017-12-15 09:00:00", end_at: "2017-12-15 10:00:00", duration: nil, room_id: 1, teacher_id: 2, course_id: 1},
  {start_at: "2017-12-16 13:00:00", end_at: "2017-12-17 14:30:00", duration: nil, room_id: 2, teacher_id: 1, course_id: 1},
  {start_at: "2017-12-15 11:00:00", end_at: "2017-12-15 12:00:00", duration: nil, room_id: 1, teacher_id: 7, course_id: 2},
  {start_at: "2017-12-15 17:00:00", end_at: "2017-12-15 18:30:00", duration: 90, room_id: 1, teacher_id: 3, course_id: 3},
  {start_at: "2017-12-14 10:07:00", end_at: "2017-12-14 10:08:00", duration: nil, room_id: 1, teacher_id: 2, course_id: 4},
  {start_at: "2017-12-16 10:07:00", end_at: "2017-12-16 15:14:00", duration: nil, room_id: 1, teacher_id: 1, course_id: 4},
  {start_at: "2017-12-17 12:15:00", end_at: "2017-12-18 14:15:00", duration: nil, room_id: 1, teacher_id: 7, course_id: 5},
  {start_at: "2017-12-19 08:00:00", end_at: "2017-12-19 10:00:00", duration: nil, room_id: 1, teacher_id: 3, course_id: 3},
  {start_at: "2017-12-17 10:06:00", end_at: "2017-12-17 11:14:00", duration: nil, room_id: 4, teacher_id: 1, course_id: 2},
  {start_at: "2017-12-17 10:00:00", end_at: "2017-12-17 15:00:00", duration: nil, room_id: 6, teacher_id: 7, course_id: 4},
  {start_at: "2017-12-15 10:20:00", end_at: "2017-12-17 12:30:00", duration: nil, room_id: 3, teacher_id: 1, course_id: 4}
])
Room.create!([
  {title: "Plná lekcí", code: "PAR_1.1", building_id: 2},
  {title: "Medium", code: "PAR_0.1", building_id: 2},
  {title: "Small", code: "PAR_1.3", building_id: 2},
  {title: "Fancy", code: "C7H_F", building_id: 1},
  {title: "Daleko", code: "CHO_D", building_id: 4},
  {title: "U krbu", code: "TO_CHCES_KRB", building_id: 5}
])
Student.create!([
  {first_name: "Jarda", last_name: "Zelený", email: "j@z", study_type: "Full-time"},
  {first_name: "Jožo", last_name: "Červený", email: "j@c", study_type: "Full-time"},
  {first_name: "Tran Duc Nguyen Phuket", last_name: "Kuala Lumpur", email: "verylongemail@hello.com", study_type: "Part-time"},
  {first_name: "Karel", last_name: "Vorel", email: "kv", study_type: "Full-time"}
])
StudentAssignment.create!([
  {course_id: 2, student_id: 3},
  {course_id: 3, student_id: 3},
  {course_id: 1, student_id: 2},
  {course_id: 2, student_id: 2},
  {course_id: 1, student_id: 1},
  {course_id: 2, student_id: 1},
  {course_id: 4, student_id: 1},
  {course_id: 2, student_id: 4},
  {course_id: 3, student_id: 4},
  {course_id: 4, student_id: 4}
])
Teacher.create!([
  {first_name: "Pepa", last_name: "Vomáčka", email: "p@v.cz"},
  {first_name: "Jura", last_name: "Dura", email: "j@d.cz"},
  {first_name: "John", last_name: "Doe", email: "something"},
  {first_name: "Ruda", last_name: "Vrána", email: "rv"},
  {first_name: "Hana", last_name: "Zelená", email: "hz"}
])
TeacherAssignment.create!([
  {teacher_id: 5, course_id: 1},
  {teacher_id: 5, course_id: 3},
  {teacher_id: 7, course_id: 2},
  {teacher_id: 7, course_id: 4},
  {teacher_id: 3, course_id: 1},
  {teacher_id: 3, course_id: 2},
  {teacher_id: 2, course_id: 3},
  {teacher_id: 1, course_id: 1},
  {teacher_id: 1, course_id: 2},
  {teacher_id: 1, course_id: 4}
])
