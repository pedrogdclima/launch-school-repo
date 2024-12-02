# Create a class 'Student' with attributes name and grade.
# Do NOT make the grade getter public, so joe.grade will raise an error.
# Create a better_grade_than? method, that you can call like so...

class Student
    
#    attr_writer :name, :grade

    def initialize(name, grade)
        @name = name
        @grade = grade
    end

    def better_grade_than?(comp_student)
        grade > comp_student.grade
    end

    protected
    
    attr_reader :grade

end

dave = Student.new('Dave Smith', 80)
bill = Student.new('Bill Withers', 90)

puts dave.better_grade_than?(bill)
