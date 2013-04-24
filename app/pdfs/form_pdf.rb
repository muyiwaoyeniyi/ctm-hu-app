class FormPdf < Prawn::Document

	def initialize(form)
		super(top_margin: 70)
		@form = form
		title
		student_info
		course_info
		other_info
	end


	def title
		text "Transfer Form", size: 20, style: :bold, align: :center
	end

	def student_info		
		move_down 30
		text "Student Infomation:", size: 12, style: :bold
		student_data = [ 
			["Fullname:", @form.full_name], 
			["Student ID#:", @form.student_id],
			["Department:", @form.department.name],
			["School:", @form.school.name],
			["School/Source of Credit:", @form.source_of_credit],
			["Location:", @form.location],
			["Date course was taken:", @form.date_course_taken] 
		] 

		table(student_data) do
			columns(0..1).borders = []
			#column(0).align = :right
			#column(0).font_style = :bold
			#column(1).padding_right = 15
			#column(1).width = 150
		end
	end

    def course_info
    	move_down 30
    	text "Course Infomation:", size: 12, style: :bold
    	move_down 8
    	table course_info_rows, :cell_style => { :size => 10 } do
    		#self.row_colors = ["DDDDDD", "FFFFFF"]
      		self.header = true
      		columns(3..5).text_color = "B22222"
  		end
  		move_down 3
  		text "*Howard University Equivalent in red", size: 8
    end

    def course_info_rows		
		course_data = [["Course #", "Course name", "Hours", "Course #", "Course name", "Hours"]] +
		@form.courses.map do |item|
      		[item.tCourse_num, item.tCourse, item.tCourse_hrs, item.hcourse.number, item.hcourse.name, item.hCourse_hrs]
    	end 
    end

	def other_info		
		move_down 30
		text "Other Infomation:", size: 12, style: :bold
		
		if @form.notes.empty?

			data = [ 
				["Notes:", "None"], 
				["Created at:", @form.created_at.to_s], 
				["Last Modified:", @form.updated_at.to_s],
				["Department Evaluator:", @form.dept_evaluator], 
				["Department Chair:", @form.dept_chair]
			] 
		else

			data = [ 
				["Notes:", @form.notes], 
				["Created at:", @form.created_at.to_s], 
				["Last Modified:", @form.updated_at.to_s],
				["Department Evaluator:", @form.dept_evaluator], 
				["Department Chair:", @form.dept_chair]
			] 
		end

		table(data) do
			columns(0..1).borders = []
		end
	end

end