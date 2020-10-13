
require "byebug"
class Employee 
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name 
        @title = title 
        @salary = salary 
        @boss = boss 

    end

    def bonus(multiplier)
        @salary * multiplier
    end

end

class Manager < Employee 
    attr_reader :employees
    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def all_subemp
        new_arr = []
        @employees.each do |emp|
            # debugger 
            if emp.is_a?(Manager)
                new_arr += emp.all_subemp
                new_arr << emp 
            else 
                new_arr << emp 
            end   
        end
        new_arr 
    end

    def bonus(multiplier)
        # @employees.map {|emp| emp.salary}.sum * multiplier # only gives bonus one level down
        all_subemp.map {|emp| emp.salary}.sum * multiplier
    end

    def assign(employee)
        @employees << employee
    end


end 