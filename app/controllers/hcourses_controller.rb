class HcoursesController < ApplicationController

	def index
		if params[:name]
			@hcourses = Hcourse.order(:name).where("name like ?", "%#{params[:term]}%")
 			render json: @hcourses.map(&:name)
 		elsif params[:number]
 			@hcourses = Hcourse.order(:number).where("number like ?", "%#{params[:term]}%")
 			render json: @hcourses.map(&:number)
 		end
	end
end
