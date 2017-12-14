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

#Now let's print them
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  select_students = []
  students.each do |student|
    if student[:name].length < 12
      select_students << student
    end
  end
  select_students.each_with_index do |student, index|
    puts "#{index+1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  #create an empty array
  students = []
  #request first name
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts  "Now we have #{students.length} students"
    name = gets.chomp
  end
  students
end

#choose a letter for sorting students by
letter = "C"

students = input_students
print_header
print(students)
print_footer(students)
