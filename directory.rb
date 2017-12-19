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

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
  puts "What would you like to do?"
end

def user_choice(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    puts "Call my file:"
    filename = gets.chomp
    save_students(filename)
  when "4"
    puts "Load file:"
    filename = gets.chomp
    load_students(filename)
  when "9"
    exit
  else
    puts "I don't know what you meant, please try again."
  end
end


def interactive_menu
  loop do
    print_menu
    user_choice(STDIN.gets.chomp)
  end
end

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

def put_students_into_array(name, cohort)
  @students << {name: name, cohort: cohort}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    put_students_into_array(name, :november)
    if @students.length == 1
      puts "Now we have 1 student."
    else
      puts  "Now we have #{@students.length} students."
    end
    name = STDIN.gets.chomp
  end
  puts "You have input the students."
  @students
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

def save_students(filename)
  file = File.open(filename,"w")
  @students.each do |student|
    csv_line = [student[:name], student[:cohort]].join(",")
    file.puts csv_line
  end
  file.close
  puts "You have saved the students into #{filename}"
end

def load_students(filename)
  file = File.open(filename,"r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    put_students_into_array(name, cohort.to_sym)
  end
  file.close
  puts "The students have been loaded from #{filename}"
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Loaded #{filename} doesn't exist."
    exit
  end
end

interactive_menu
