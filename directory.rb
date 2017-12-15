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
  n = 1
  while n <= students.length
    puts "#{n}. " + students[n-1][:name].to_s + " (" + students[n-1][:cohort].to_s + " cohort)"
    n +=1
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish just hit return twice"
  #create an empty array
  students = []
  #request first name
  name = gets.sub("\n","")
  while !name.empty? do
    students << {name: name, cohort: :november, hobbies: :cycling, country_of_birth: :UK}
    if students.length == 1
      puts "Now we have 1 student"
    else
      puts  "Now we have #{students.length} students"
    end
    name = gets.sub("\n","")
  end
  students
end

#choose a letter for sorting students by
letter = "C"

students = input_students
print_header
print(students)
print_footer(students)
