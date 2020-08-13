class Employee

    attr_accessor :name, :salary, :manager
    @@all=[]

    def initialize (name, salary)
        @name=name
        @salary=salary
       @@all<< self
    end

    def manager_name
        self.manager.name
    end

    def self.all
        @@all
    end

    def self.paid_over (num)
        @@all.select{|emp| emp.salary > num}
    end

    def self.find_by_department(dept)
        @@all.find{|emp| emp.manager.department== dept}
    end

    def tax_bracket
        @@all.select{|emp| emp.salary < self.salary+1000 && emp.salary > self.salary-1000 && emp != self}
    end

end
