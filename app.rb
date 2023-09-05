require 'json'
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

  def read_data
    File.new('Data/people.json', 'w') unless File.exist?('Data/people.json')
    File.new('Data/books.json', 'w') unless File.exist?('Data/books.json')
    File.new('Data/rentals.json', 'w') unless File.exist?('Data/rentals.json')
    people_json = File.read('Data/people.json')
    if people_json.length.positive? 
      people = JSON.parse(people_json)
      people.each do |person|
        if person['type'] == 'student'
          @people.push(Student.new(person['age'], person['name'], person['parent_permission']))
        elsif person['type'] == 'teacher'
          @people.push(Teacher.new(person['age'], person['specialization'], person['name']))
        end
      end
    end
    books_json = File.read('Data/books.json')
    # books = JSON.parse(books_json)
    books.each do |book|
      @books.push(Book.new(book['title'], book['author']))
    end
    rentals_json = File.read('Data/rentals.json')
    # rentals = JSON.parse(rentals_json)
    rentals.each do |rental|
      book = @books.find { |book| book.title == rental['book_title'] }
      person = @people.find { |person| person.name == rental['person_name'] }
      @rentals.push(Rental.new(rental['date'], book, person))
    end
  end

 def write_data
    books = []
    people = []
    rentals = []

    @books.each do |book|
      books.push(title: book.title, author: book.author)
    end

    @people.each do |person|
      if person.instance_of?(Student)
        people.push(age: person.age, name: person.name,  parent_permission: person.permission, type: 'student')
      elsif person.instance_of?(Teacher)
        puts person.specialization
        people.push(age: person.age, name: person.name, specialization: person.specialization, type: 'teacher')
      end
    end

    @rentals.each do |rental|
      rentals.push(date: rental.date, book_title: rental.book.title, person_name: rental.person.name)
    end

    File.write('Data/books.json', JSON.pretty_generate(books))
    File.write('Data/people.json', JSON.pretty_generate(people))
    File.write('Data/rentals.json', JSON.pretty_generate(rentals))
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
      puts permission
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
