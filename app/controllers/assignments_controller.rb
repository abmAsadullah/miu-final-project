class AssignmentsController < ApplicationController
    before_action :set_assignment, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:show, :index]
  
    def index
      @assignments = Assignment.all
    end
  
    def show
      @assignment = Assignment.find(params[:id])
    end
  
    def new
      @assignment = Assignment.new
    end
  
    def edit
    end

    def create
      @assignment = Assignment.new(assignment_params)
      @assignment.user = current_user
      respond_to do |format|
        if @assignment.save
          format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
          format.json { render :show, status: :created, location: @assignment }
        else
          format.html { render :new }
          format.json { render json: @assignment.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @assignment.update(assignment_params)
          format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
          format.json { render :show, status: :ok, location: @assignment }
        else
          format.html { render :edit }
          format.json { render json: @assignment.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @assignment.destroy
      respond_to do |format|
        format.html { redirect_to assignments_url, notice: 'Assignment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_assignment
    @assignment = Assignment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def assignment_params
    params.require(:assignment).permit(:title, :body)
    end  
end
