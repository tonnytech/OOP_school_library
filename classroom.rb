class Classroom
  attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  # Add a student to the classroom
  def add_student(student)
    students << student
    student.classroom = self
  end
end
