require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def start
    puts 'School library App!'
    menu
  end

  def menu
    loop do
      puts ' ' * 10
      puts 'Enter a number from 1 to 7 to pick your option:'
      puts '1 - List of all books available'
      puts '2 - List of all people available'
      puts '3 - Add a person'
      puts '4 - Add a book'
      puts '5 - Add a rental'
      puts '6 - List all rentals for a person id'
      puts '7 - Exit the library'
      puts ''

      choice = gets.chomp.to_i

      case choice
      when 1..6 then app.chosen(choice)
      when 7 then puts 'Thank you for using this application, come back soon.'
      end
      break if choice == 7
    end
  end

  def chosen(choice)
    case choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      puts create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals
    end
  end

  def list_all_books
    if @books.empty?
      puts 'Books folder is empty'
    else
      @books.each do |book, index|
        puts "#{index} - Title: #{book.title}, Author: #{book.author}"
      end
    end
  end

  def list_all_people
    if @people.empty?
      puts 'Peoples folder is empty'
    else
      @people.each_with_index do |person, index|
        puts "#{index}- [#{person.type}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    category = gets.chomp.to_i
    case category
    when 1
      create_a_student
    when 2
      create_a_teacher
    else
      puts 'Please Enter a valid number, 1 or 2'
    end
  end

  def create_a_student
    print 'Enter Age: '
    age = gets.chomp.to_i
    puts "Age is #{age}"
    print 'Enter Name: '
    name = gets.chomp
    puts "name is #{name}"
    print 'Has parent permission? [Y/N]: '
    permission = gets.chomp
    puts "permission is #{permission}"
    person = Student.new(age, name, permission)
    @people.push(person)
    puts "Student #{name} added successfully"
  end

  def create_a_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, specialization, name)
    @people.push(person)
    puts "Teacher '#{name}' created successfully"
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books.push(book)
    puts "Book '#{title}' created successfully"
  end

  def create_a_rental
    if @books.empty?
      puts 'No book to rent out'
    elsif @people.empty?
      puts 'There is no one in the Database. Add a person first'
    else
      puts 'Choose a book from the following list by number'
      @books.each_with_index { |book, index| puts "#{index} - Title: #{book.title}, Author: #{book.author}" }
      book_index = gets.chomp.to_i
      book = @books[book_index]
      puts 'choose a person from the following list by number (not id)'
      @people.each_with_index do |person, index|
        puts "#{index} [#{person.category}] - Name: #{person.name}, Age: #{person.age}"
      end
      person_id = gets.chomp.to_i
      person = @people[person_id]
      print 'Date: '
      date = gets.chomp
      rental = Rental.new(date, person, book)
      @rentals.push(rental)
      puts "Rental for '#{book.title}' by '#{person.name}' created successfully"
    end
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'Rentals folder is empty'
    else
      puts 'ID of person: '
      person_id = gets.chomp.to_i
      puts 'Rentals: '
      @rentals.each do |rental, _index|
        if person_id == rental.person.id
          puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}"
        end
      end
    end
  end
end

# first = App.new
# first.start
