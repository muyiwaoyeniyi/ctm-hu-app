class FormsController < ApplicationController
  # GET /forms
  # GET /forms.json
  def index
    @forms = Form.paginate(:page => params[:page], :per_page => 10).order('last_name')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @forms }
    end
  end

  # GET /forms/1
  # GET /forms/1.json
  def show
    @form = Form.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @form }
      format.pdf do
         pdf = FormPdf.new(@form)
         send_data pdf.render, filename: "#{@form.full_name} - TF.pdf",
                                type: "application/pdf",
                                disposition: "inline"
      end
    end
  end

  # GET /forms/new
  # GET /forms/new.json
  def new
    @form = Form.new
    @form.courses.build     #for course child objects
    @form.courses.build
    @form.courses.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @form }
    end
  end

  # GET /forms/1/edit
  def edit
    @form = Form.find(params[:id])
    @count = 0                                        # using this to populate the edit form view for howard course name and number 
    @form.courses.each do |p|                         # since I'm not using the usual setter and getter....wrote mine
      @hcourse = Hcourse.find_by_id(p.hcourse_id)
      @form.courses[@count].hcourse_number = @hcourse.number
      @form.courses[@count].hcourse_name = @hcourse.name
      @count += 1
    end
  end

  # POST /forms
  # POST /forms.json
  def create
    @form = Form.new(params[:form])

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Form was successfully created.' }
        format.json { render json: @form, status: :created, location: @form }
      else
        format.html { render action: "new" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /forms/1
  # PUT /forms/1.json
  def update
    @form = Form.find(params[:id])

    respond_to do |format|
      if @form.update_attributes(params[:form])
        format.html { redirect_to @form, notice: 'Form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forms/1
  # DELETE /forms/1.json
  def destroy
    @form = Form.find(params[:id])
    @form.destroy

    respond_to do |format|
      format.html { redirect_to forms_url }
      format.json { head :no_content }
    end
  end
end
