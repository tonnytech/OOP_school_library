require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'capitalize_deco'
require_relative 'trimmed_deco'

person = Person.new(22, 'maximilianus')
puts person
person.correct_name
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
