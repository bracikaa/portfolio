class CommentsController < ApplicationController
	def new
		@comment = current_user.comments.build(comment_params)
	end

	private

	def comment_params
		params.require(:comment).include(:content)
	end
end
