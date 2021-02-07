class AttachfilesController < ApplicationController
    def create
        @assignment = Assignment.find(params[:assignment_id])
        @attachfile = @assignment.attachfiles.create(attachfile_params)
        @attachfile.user = current_user
        @attachfile.save
        redirect_to assignment_path(@assignment)
    end
    
    private
    def attachfile_params
      params.require(:attachfile).permit(:title, :file)
    end
end
