require_relative 'person'

class Teacher < Person
  attr_accessor :category, :specialization

  def initialize(age, specialization, name)
    super(age, name)
    @specialization = specialization
    @category = 'Teacher'
  end

  def can_use_services?
    true
  end
end
