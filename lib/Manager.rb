class Manager

    attr_accessor :name, :department, :age
    @@all=[]

    def initialize (name, department, age)
        @name=name
        @department=department
        @age=age
       @@all<< self
    end

    def self.all
        @@all
    end

    def employees
        Employee.all.select{|emp| emp.manager==self}
    end

    def hire_employee (name, salary)
        new_employee=Employee.new(name, salary)
        new_employee.manager=self
    end 

    def self.all_departments
        @@all.map{|man| man.department}
    end

    def self.average_age
        @@all.map{|man| man.age}.reduce(:+)/@@all.length.to_f
    end
end
