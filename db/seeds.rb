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


r1 = Role.create({name: "Student", description: "Can read items"})
r2 = Role.create({name: "Staff", description: "Can read and create items. Can update and destroy own items"})
r3 = Role.create({name: "Admin", description: "Can perform any CRUD operation on any resource"})

u1 = User.create({name: "Sally", email: "sally@example.com",age: "12",ICNo:"930219-14-5252",programme:"RSD",  password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r1.id})
u1.confirm
u2 = User.create({name: "Sue", email: "sue@example.com",age: "13",ICNo:"930219-14-5251",programme:"", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u2.confirm
u3 = User.create({name: "Kev", email: "kev@example.com",age: "14",ICNo:"930219-14-5253",programme:"", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r2.id})
u3.confirm
u4 = User.create({name: "Jack", email: "jack@example.com",age: "15",ICNo:"930219-14-5254",programme:"", password: "aaaaaaaa", password_confirmation: "aaaaaaaa", role_id: r3.id})
u4.confirm


