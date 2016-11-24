# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# devise create
#r4 = Role.create({name: "Student", description: "Can read items"})
#u1 = User.create({name: "Yang", email: "yangyang@example.com",age: "12",ICNo:"930219-14-1234",programme:"",  password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: "1"})
#u1.confirm

f0 = Faculty.create({facultyname: "All"})
f1 = Faculty.create({facultyname: "FASC"})
f2 = Faculty.create({facultyname: "FAFB"})
f3 = Faculty.create({facultyname: "FEBE"})
f4 = Faculty.create({facultyname: "FSAH"})
f4 = Faculty.create({facultyname: "CPUS"})

ys0 = Yearofstudy.create({year: "All"})
ys1 = Yearofstudy.create({year: "Year1"})
ys2 = Yearofstudy.create({year: "Year2"})
ys3 = Yearofstudy.create({year: "Year3"})
ys4 = Yearofstudy.create({year: "Year4"})

ls0 = Levelofstudy.create({levelname: "All"})
ls1 = Levelofstudy.create({levelname: "Pre-U"})
ls2 = Levelofstudy.create({levelname: "Diploma"})
ls3 = Levelofstudy.create({levelname: "Degree"})

p0 = Programme.create({programmename: "All"})
p1 = Programme.create({programmename: "RSD"})
p2 = Programme.create({programmename: "RIF"})
p3 = Programme.create({programmename: "REI"})

r1 = Role.create({name: "Student", description: "Can read items"})
r2 = Role.create({name: "Staff", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally" ,age: '23' ,gender: 'Female', email: "sally@example.com",ICNo:"930219-14-5252",  password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id, programme_id:p0.id, yearofstudy_id: ys0.id, levelofstudy_id:ls0.id, faculty_id:f0.id})
u1.confirm
u2 = User.create({name: "Sue" ,age: '22',gender: 'Female', email: "sue@example.com",ICNo:"930219-14-5251", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id, programme_id:p0.id, yearofstudy_id: ys0.id, levelofstudy_id:ls0.id, faculty_id:f0.id})
u2.confirm
u3 = User.create({name: "Kev" ,age: '21',gender: 'Male', email: "kev@example.com",ICNo:"930219-14-5253", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id, programme_id:p0.id, yearofstudy_id: ys0.id, levelofstudy_id:ls0.id, faculty_id:f0.id})
u3.confirm
u4 = User.create({name: "Jack" ,age: '24',gender: 'Male', email: "jack@example.com",ICNo:"930219-14-5254", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id, programme_id:p0.id, yearofstudy_id: ys0.id, levelofstudy_id:ls0.id, faculty_id:f0.id})
u4.confirm


form1 = Form.create({FormName: "Student Survey Questionnaire on Student Counselling Services", FormDescription: "In order to make our services more relevent to TAR UC students, we would like to seek your assistance in helping us to develop and improve our existing services.", FormDateTime: "2016-11-15 18:27:03" ,FormStatus: "Published", user_id: u1.id })

section1 = Section.create({ SectionName: "Section A: Campus Life Experience", SectionDescription: "Please indicate the answers by selecting the boxes given", form_id: form1.id})
section2 = Section.create({ SectionName: "Section B: Student Counselling Service", SectionDescription: "Please indicate the answers by selecting the boxes given", form_id: form1.id})

question1_1 = Question.create({ QuestionDesc: "What are the challenges you faced during your studies in TAR UC? ", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "1", section_id: section1.id})
question1_2 = Question.create({ QuestionDesc: "How do you normally deal with your personal problems?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "2", section_id: section1.id})
question1_3 = Question.create({ QuestionDesc: "During your studies in University College, whom do you usually turn to when facing a problem?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "3", section_id: section1.id})

answer1_1_1 = Answer.create({ AnswerDesc: "Motivation in Studies", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_2 = Answer.create({ AnswerDesc: "Loss & Sadness", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_3 = Answer.create({ AnswerDesc: "Emotional Management", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_4 = Answer.create({ AnswerDesc: "Time Management", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_5 = Answer.create({ AnswerDesc: "Self-Confidence Issues", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_6 = Answer.create({ AnswerDesc: "Career Planning Issues", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_7 = Answer.create({ AnswerDesc: "Adjust To New Enviroment", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_8 = Answer.create({ AnswerDesc: "Academic Stress", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_9 = Answer.create({ AnswerDesc: "Family Relationship Issues", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_10 = Answer.create({ AnswerDesc: "Boy-Girl Relationship Issues", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_11 = Answer.create({ AnswerDesc: "Friends/Coursemates Relationship Issues", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})
answer1_1_12 = Answer.create({ AnswerDesc: "Others", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_1.id})

answer1_2_1 = Answer.create({ AnswerDesc: "Attend Worshop or Read Self-Help Books", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_2 = Answer.create({ AnswerDesc: "Seek Spiritual Guidance", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_3 = Answer.create({ AnswerDesc: "Express in Blog/Facebook/Tweeter", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_4 = Answer.create({ AnswerDesc: "Talk to Friends/Lecturers/Parents", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_5 = Answer.create({ AnswerDesc: "Take Time to Resolve it by Myself", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_6 = Answer.create({ AnswerDesc: "Ignore/Avoid Facing Problems", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_7 = Answer.create({ AnswerDesc: "Complain/blame Others", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})
answer1_2_8 = Answer.create({ AnswerDesc: "Others", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_2.id})

answer1_3_1 = Answer.create({ AnswerDesc: "Lecturers", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})
answer1_3_2 = Answer.create({ AnswerDesc: "Friends", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})
answer1_3_3 = Answer.create({ AnswerDesc: "Counsellors", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})
answer1_3_4 = Answer.create({ AnswerDesc: "Family Members", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})
answer1_3_5 = Answer.create({ AnswerDesc: "Spiritual Advisors (eg. Priest, Monk, Iman, Pastor, Etc.)", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})
answer1_3_6 = Answer.create({ AnswerDesc: "Others", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question1_3.id})


question2_1 = Question.create({ QuestionDesc: "Are you aware that there is counselling services for students in TAR UC?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "1", section_id: section2.id})
question2_2 = Question.create({ QuestionDesc: "Do you know that Student Counselling Services is located at Bangunan Tan Sri Khaw Kai Boh? (1st floor, room A107E)", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "2", section_id: section2.id})
question2_3 = Question.create({ QuestionDesc: "Do you think it is easy to find where the Student Counselling Services is?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "3", section_id: section2.id})
question2_4 = Question.create({ QuestionDesc: "Do you know that the counselling services provided in TAR UC are free of charge?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "4", section_id: section2.id})
question2_5 = Question.create({ QuestionDesc: "Which way do you prefer to approach Student Counselling Services for making enquires/appointment?", IsSubQuestion: 0, ParentID: 0, QuestionNumber: "5", section_id: section2.id})


answer2_1_1 = Answer.create({ AnswerDesc: "Yes. I am aware of the services through,", IsSubAnswer: 1, ParentID: 0, AnswerCount: 5, question_id: question2_1.id})
answer2_1_2 = Answer.create({ AnswerDesc: "No. I am not aware", IsSubAnswer: 1, ParentID: 0, AnswerCount: 5, question_id: question2_1.id})

subAnswer2_1_1_1 = Answer.create({ AnswerDesc: "Tar UC Website",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_2 = Answer.create({ AnswerDesc: "Society Day",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_3 = Answer.create({ AnswerDesc: "Self-enrichment workshops",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_4 = Answer.create({ AnswerDesc: "Self-help leaflets",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_5 = Answer.create({ AnswerDesc: "Student handbook/prospectus",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_6 = Answer.create({ AnswerDesc: "Friends",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_7 = Answer.create({ AnswerDesc: "Staffs/Lecturers",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })
subAnswer2_1_1_8 = Answer.create({ AnswerDesc: "Others",IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_1_1.id, question_id: question2_1.id })



answer2_2_1 = Answer.create({ AnswerDesc: "Yes", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_2.id})
answer2_2_2 = Answer.create({ AnswerDesc: "No", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_2.id})

answer2_3_1 = Answer.create({ AnswerDesc: "Yes", IsSubAnswer: 1, ParentID: 0, AnswerCount: 5, question_id: question2_3.id})
answer2_3_2 = Answer.create({ AnswerDesc: "No, Because", IsSubAnswer: 1, ParentID: 0, AnswerCount: 5, question_id: question2_3.id})

subAnswer2_3_2_1 = Answer.create({ AnswerDesc: "No direction sign to show the direction", IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_3_2.id, question_id: question2_3.id })
subAnswer2_3_2_2 = Answer.create({ AnswerDesc: "No signage at the entrance of the office", IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_3_2.id, question_id: question2_3.id })
subAnswer2_3_2_3 = Answer.create({ AnswerDesc: "I am too shy to ask", IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_3_2.id, question_id: question2_3.id })
subAnswer2_3_2_4 = Answer.create({ AnswerDesc: "I've not been there", IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_3_2.id, question_id: question2_3.id })
subAnswer2_3_2_5 = Answer.create({ AnswerDesc: "Others", IsSubAnswer: 0, AnswerCount: 5, ParentID: answer2_3_2.id, question_id: question2_3.id })


answer2_4_1 = Answer.create({ AnswerDesc: "Yes", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_4.id})
answer2_4_2 = Answer.create({ AnswerDesc: "No", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_4.id})

answer2_5_1 = Answer.create({ AnswerDesc: "Walk In", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_5.id})
answer2_5_2 = Answer.create({ AnswerDesc: "Email", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_5.id})
answer2_5_3 = Answer.create({ AnswerDesc: "Phone", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_5.id})
answer2_5_4 = Answer.create({ AnswerDesc: "Facebook", IsSubAnswer: 0, ParentID: 0, AnswerCount: 10, question_id: question2_5.id})


##CHECKBACK LTR
question2_6 = Question.create({ QuestionDesc: "Would you consider seeking counselling if needed?", IsSubQuestion: 1, ParentID: 0, QuestionNumber: "6", section_id: section2.id})

answer2_6_1 = Answer.create({ AnswerDesc: "Yes", IsSubAnswer: 0, ParentID: 0, AnswerCount: 5, question_id: question2_6.id})
answer2_6_2 = Answer.create({ AnswerDesc: "No", IsSubAnswer: 0, ParentID: 0, AnswerCount: 5, question_id: question2_6.id})

subquestion2_6_1_1 = Question.create({ QuestionDesc: "If Yes, the factors that encourage me to seek counselling are,", IsSubQuestion: 0, ParentID: question2_6.id, section_id: section2.id })

  subquestionanswer2_6_1_1_1 = Answer.create({ AnswerDesc: "Counsellor's friendliness", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_2 = Answer.create({ AnswerDesc: "Encouraged by friends/family/lecturers", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_3 = Answer.create({ AnswerDesc: "Had pervious good counselling experience", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_4 = Answer.create({ AnswerDesc: "Counsellor's willingness to listen", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_5 = Answer.create({ AnswerDesc: "Private and safe enviroment to share my problems", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_6 = Answer.create({ AnswerDesc: "Believe that counselling helps to solve problems", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })
  subquestionanswer2_6_1_1_7 = Answer.create({ AnswerDesc: "Familiarity with the counsellor", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })  
  subquestionanswer2_6_1_1_8 = Answer.create({ AnswerDesc: "Others", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_1_1.id })

subquestion2_6_2_1 = Question.create({ QuestionDesc: "If No, because,", IsSubQuestion: 0, ParentID: question2_6.id, section_id: section2.id })

  subquestionanswer2_6_2_1_1 = Answer.create({ AnswerDesc: "Too Shy", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_2 = Answer.create({ AnswerDesc: "Worry about privacy issue", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_3 = Answer.create({ AnswerDesc: "Afraid of how others might think", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_4 = Answer.create({ AnswerDesc: "Counsellor cannot understand my problems", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_5 = Answer.create({ AnswerDesc: "Do not like to share problems/thoughts with strangers", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_6 = Answer.create({ AnswerDesc: "It is a sign of my weakness", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_7 = Answer.create({ AnswerDesc: "Do not have serious problems", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })
  subquestionanswer2_6_2_1_8 = Answer.create({ AnswerDesc: "Others", AnswerCount: 5, ParentID: 0, question_id: subquestion2_6_2_1.id })



formassociate1 = Formassociate.create({ form_id: form1.id, yearofstudy_id: 1, levelofstudy_id: 1, faculty_id: 1, programme_id: 1 , agecondition: "All"})








