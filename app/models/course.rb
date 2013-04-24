class Course < ActiveRecord::Base
  
  #Accessible attributes
    attr_accessible :tCourse, :tCourse_num, :tCourse_hrs, :hCourse_hrs   #note naming convention - not the best
    attr_accessible :hcourse_name, :hcourse_number

  #Associations
    belongs_to :form
    belongs_to :hcourse

    attr_accessor :flag, :hcourse_name, :hcourse_number

  #Callbacks
    before_save :the_titleizer, :save_hcourse_association
    #before_update :check_hcourse

  #Validations    #note that the order affects which validation error message shows up first
    validates_presence_of :tCourse, :tCourse_num  
    validates_numericality_of :tCourse_hrs, message: "should be a number"
    validates_presence_of :hcourse_number, :hcourse_name
    validates_numericality_of :hCourse_hrs, message: "should be a number"    

  #Methods
    def the_titleizer
      self.tCourse = self.tCourse.titleize.strip
      self.tCourse_num = self.tCourse_num.upcase.strip     
    end
  
    def save_hcourse_association                                      #set hcourse association
      self.hcourse_number = self.hcourse_number.upcase.strip
      @hcourse = Hcourse.find_by_number(self.hcourse_number)         # if number is present find it   
      if @hcourse.present?                                 
        self.hcourse_id = @hcourse.id

      else                                  # else create it and set flag to true for course name           
        self.hcourse_name = self.hcourse_name.titleize.strip
        @hcourse = Hcourse.create!(:number => self.hcourse_number, :name => self.hcourse_name)
        self.hcourse_id = @hcourse.id                           
      end  
    end


=begin
      def check_hcourse    
      #@course = Course.find_by_id(self.id)
      self.hcourse_number = self.hcourse_number.upcase.strip            
      @hcourse = Hcourse.find_by_number(self.hcourse_number)
      if !(@hcourse.present?)
        self.hcourse_name = self.hcourse_name.titleize.strip
        @hcourse = Hcourse.create(:number => self.hcourse_number, :name => self.hcourse_name)
        self.hcourse_id = @hcourse.id
      end
    end
=end

end
