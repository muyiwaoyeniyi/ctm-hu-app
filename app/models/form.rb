class Form < ActiveRecord::Base
  
  #Accessible attributes
  	attr_accessible :first_name, :courses_attributes, :department_name, :school_name
    attr_accessible :last_name, :initial, :student_id, :student_ssn
    attr_accessible :source_of_credit, :location, :date_course_taken
    attr_accessible :tCourse_hrs_total, :hCourse_hrs_total, :notes
  	attr_accessible	:dept_evaluator, :dept_chair

    attr_accessor :full_name, :ms_king

  #Associations
  	has_many :courses, :dependent => :destroy
    accepts_nested_attributes_for :courses, :reject_if => :all_blank, allow_destroy: true
    belongs_to :department
    belongs_to :school

  #Callbacks
    before_save :calculate_all_courses_total, :the_titleizer

  #validations
    validates_presence_of :first_name, :last_name
    validates_presence_of :student_id, :department_name, :school_name  
    validates_presence_of :source_of_credit, :location, :date_course_taken, :dept_evaluator
    #validates_associated :courses

  #Methods
    def calculate_all_courses_total
        @sum = 0
        @sum2 = 0
        self.courses.each do |p|
          @sum = p.tCourse_hrs.to_i + @sum
          @sum2 = p.hCourse_hrs.to_i + @sum2
        end
        self.tCourse_hrs_total = @sum
        self.hCourse_hrs_total = @sum2
    end

    def the_titleizer
        self.first_name = self.first_name.capitalize.strip
        self.last_name = self.last_name.capitalize.strip
        self.initial = self.initial.upcase.strip

        self.source_of_credit = self.source_of_credit.titleize.strip
        self.location = self.location.titleize.strip

        self.dept_evaluator = self.dept_evaluator.titleize.strip
        self.dept_chair = self.dept_chair.titleize.strip
    end

    def full_name               #for showing all forms
        self.last_name + ", " + self.first_name
    end

    def department_name                         #getter
        department.try(:name)
    end

    def department_name=(name)                  #setter
        name = name.titleize.strip
        self.department = Department.find_or_create_by_name(name) if name.present?
    end

    def school_name
        school.try(:name)
    end

    def school_name=(name)
        name = name.titleize.strip
        self.school = School.find_or_create_by_name(name) if name.present?
    end

    #for changing validation message
    HUMANIZED_ATTRIBUTES = {      
        :student_id => "Student ID",
        :dept_evaluator => "Department Evaluator",
        :date_course_taken => "Date the course was taken"        
    }

    def self.human_attribute_name(attr, options={})
      HUMANIZED_ATTRIBUTES[attr.to_sym] || super
    end
    #end for changing validation message

end
