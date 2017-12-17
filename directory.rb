#let's put all the students into an array

#students = [
#  {name: "Dr. Hannibal Lecter", cohort: :november},
#  {name: "Darth Vader", cohort: :november},
#  {name: "Nurse Ratched", cohort: :november},
#  {name: "Michael Corleone", cohort: :november},
#  {name: "Alex DeLarge", cohort: :november},
#  {name: "The Wicked Witch of the West", cohort: :november},
#  {name: "Terminator", cohort: :november},
#  {name: "Freddy Kreuger", cohort: :november},
#  {name: "The Joker", cohort: :november},
#  {name: "Joffrey Baratheon", cohort: :november},
#  {name: "Norman Bates", cohort: :november}
#]

@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students
  @students.each do |student|
    puts "#{student[:name]}  (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  #request first name
  puts "Type name:"
  name = gets.chomp
  while !name.empty? do
    @students << {name: name, cohort: :november}
    if @students.length == 1
      puts "Now we have 1 student."
    else
      puts  "Now we have #{@students.length} students."
    end
    name = gets.chomp
  end
  @students
end


def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
  puts "What would you like to do?"
end

def show_students
  if @students.count == 0
    puts "There are no students enrolled."
  else
    print_header
    print_students
    print_footer
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "9"
    exit
  else
    puts "I don't know what you meant, please try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  file = File.open("students.csv","w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

interactive_menu
