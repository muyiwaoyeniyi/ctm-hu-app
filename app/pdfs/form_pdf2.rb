class FormPdf2 < Prawn::Document

	def initialize(form)
		super(top_margin: 70)
		@form = form
		title
		student_info
		course_info
		total_info
		other_info
	end

	def title
		text "#{@form.school_name}", size: 20, style: :bold, align: :center
		text "Advance Standing", size: 22, style: :bold, align: :center
	end

	def student_info		
		move_down 20
		text "Name: #{@form.full_name} ID# #{@form.student_id} Department: #{@form.department_name}", style: :bold
		move_down 7
		text "Source of Credit: #{@form.source_of_credit}, #{@form.location}", style: :bold
		move_down 7
		text "Date: #{@form.date_course_taken}", style: :bold
	end

    def course_info
    	move_down 30
    	table(course_info_rows, :header => true, :cell_style => { :size => 10 }, :column_widths => [150,60,330]) do
    		row(0).align = :center
    		row(0).font_style = :bold
    		column(1).align = :center
  		end
    end

    def course_info_rows		
		course_data = [["College Course", "Credits", "HU Equivalent Course #"]] +
		@form.courses.map do |item|
      		[item.tCourse, item.tCourse_hrs, item.hcourse.number]
    	end
    end

	def total_info		
		table(total_info_row, :column_widths => [150,60,330]) do
			row(0).font_style = :bold
			column(1).align = :center
		end
	end

	def total_info_row
		total_data = [["TOTAL", "#{@form.tCourse_hrs_total}", ""]]
	end

	def other_info		
		move_down 50
		time = Time.new
		text "Awarded By: #{@form.dept_chair}         		     Date: #{time.strftime("%m/%d/%y")}"
		move_down 12
		text "Prescribed in HU: Lawanda V. Peace, Ph.D, Assistant Dean"
	end

end