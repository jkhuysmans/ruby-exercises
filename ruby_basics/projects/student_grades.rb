class Student

    def initialize(name, grade)
        @name = name
        @grade = grade 
    end


    def better_grade_than?(student2)
    grade > student2.grade
    end

    protected

    def grade
        @grade
    end
end

joe = Student.new("Joe", 90)
bob = Student.new("Bob", 84)
puts "Well done!" if joe.better_grade_than?(bob)
