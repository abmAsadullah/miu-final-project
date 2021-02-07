class DiscussionsController < ApplicationController
    def create
        @assignment = Assignment.find(params[:assignment_id])
        @discussion = @assignment.discussions.create(discussion_params)
        @discussion.user = current_user
        @discussion.save
        redirect_to assignment_path(@assignment)
    end
    
    private
    def discussion_params
      params.require(:discussion).permit(:body)
    end
end
