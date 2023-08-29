require_relative 'person'
require_relative 'student'
require_relative 'teacher'

student = Student.new(1, 16, 'Physics', 'Alice')
teacher = Teacher.new(2, 35, 'Mathematics', 'Mr. Smith')

puts student.name
puts teacher.name