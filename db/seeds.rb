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


f1 = Faculty.create({facultyname: "FASC"})
f2 = Faculty.create({facultyname: "FAFB"})
f3 = Faculty.create({facultyname: "FEBE"})
f4 = Faculty.create({facultyname: "FSAH"})
f4 = Faculty.create({facultyname: "CPUS"})

ys1 = Yearofstudy.create({year: "Year1"})
ys2 = Yearofstudy.create({year: "Year2"})
ys3 = Yearofstudy.create({year: "Year3"})
ys4 = Yearofstudy.create({year: "Year4"})

ls1 = Levelofstudy.create({levelname: "Pre-U"})
ls2 = Levelofstudy.create({levelname: "Diploma"})
ls3 = Levelofstudy.create({levelname: "Degree"})

r1 = Role.create({name: "Student", description: "Can read items"})
r2 = Role.create({name: "Staff", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com",ICNo:"930219-14-5252",  password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u1.confirm
u2 = User.create({name: "Sue", email: "sue@example.com",ICNo:"930219-14-5251", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u2.confirm
u3 = User.create({name: "Kev", email: "kev@example.com",ICNo:"930219-14-5253", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u3.confirm
u4 = User.create({name: "Jack", email: "jack@example.com",ICNo:"930219-14-5254", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u4.confirm


