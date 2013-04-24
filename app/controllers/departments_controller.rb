class DepartmentsController < ApplicationController

	def index
		@departments = Department.order(:name).where("name like ?", "%#{params[:term]}%")
 		render json: @departments.map(&:name)
	end
end