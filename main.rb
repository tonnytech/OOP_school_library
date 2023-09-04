require_relative 'app'

class Menu

  attr_accessor :choice
  def initialize
    @app = App.new
  end

  def menu_list
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
      when 1..6 then @app.chosen(choice)
      when 7 then puts 'Thank you for using this application, come back soon.'
      end
      break if choice == 7
    end
  end

  def main
    @app.chosen(choice)
  end

  def start
    puts 'School library App!'
    menu_list
  end

end


startApp = Menu.new()
startApp.main
startApp.start
