require_relative 'person'

class Teacher < Person
  attr_accessor :category

  def initialize(age, specialization, name, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @category = 'Teacher'
  end

  def can_use_services?
    true
  end
end
