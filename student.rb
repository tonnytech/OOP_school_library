require_relative 'person'

class Student < Person
  attr_accessor :category

  def initialize(age, name, parent_permission)
    super(age, name, parent_permission: parent_permission)
    @category = 'Student'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
