class BlogsChannel < ApplicationCable::Channel
	def subscribed
		#stream_from "blogs_#{comment.id}_channel"
		stream_from "blogs_#{params['blog_id']}_channel"
	end

	def unsubscribed
	end

	def send_comment(data)
		current_user.comments.create!(content: data['content'], blog_id: data['blog_id'])
	end
end