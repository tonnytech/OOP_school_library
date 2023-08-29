class Person
    def initialize(id, age, name = "Unknown", parent_permission = true)
        @id = id
        @name = name
        @age = age 
        @parent_permission = parent_permission            
    end

# getters

    attr_reader :id
    attr_reader :name
    attr_reader :age
# setters
    attr_writer :name
    attr_writer :age

# -------------------

def of_age?
   @age >= 18
end

public

def can_use_services?
    of_age? || @parent_permission
end

end

# person = Person.new(1,2,"Alice")
# puts person.can_use_service?

# person_2 = Teacher.new(1,5,"Tonny", false,"teaching")

# puts person_2