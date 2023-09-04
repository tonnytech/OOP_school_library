require_relative 'app'

class Menu
  def initialize
    @app = App.new
  end

  def run
    puts 'welcome to school library app!'
    menu
  end

  def menu
    loop do
      puts ''
      puts 'Please choose an option by entering a number:'
      puts '1 - list all books'
      puts '2 - list all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      puts ''

      option = gets.chomp.to_i
      chosen(option)

      exit if option == 7

      break if option == 7
    end
  end

  def chosen(option)
    case option
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      puts 'Do you want to create a student (1) or a teacher (2)?'
      person_type = gets.chomp.to_i
      @app.create_a_person(person_type)
    when 4
      @app.create_a_book
    when 5
      @app.create_a_rental
    when 6
      @app.list_all_rentals
    end
  end

  def exit
    puts 'Thank you for using this app!'
  end
end

menu = Menu.new
menu.run
