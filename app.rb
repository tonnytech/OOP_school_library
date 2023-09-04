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
        puts "#{index}- [#{person.category}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
      end
    end
  end

  def create_a_person(person_type)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person_type == 1
      print 'Has parent permission? (Y/N): '
      permission = gets.chomp
      person = Student.new(age, name, permission)
      @people.push(person)
      puts "Student #{person.name} was created successfully with ID #{person.id}"
    elsif person_type == 2
      print 'Specialization: '
      specialization = gets.chomp
      person = Teacher.new(age, specialization, name)
      @people.push(person)
      puts "Teacher #{name} was created successfully with ID #{person.id}"
    end
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
