require_relative 'app'

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
    when 1..6 then chosen(choice)
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

def main
  app = App.new
  app.start
end

main
