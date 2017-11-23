module PortfolioPostsHelper
	def image_generator(height:, width:)
		"http://via.placeholder.com/#{height}x#{width}"
	end

	def portfolio_type img, type
		if  img.model.thumb_image? || img.model.main_image? 
			img
		elsif type="main"
			image_generator(height: '500', width: '350')
		elsif type="thumb"
			image_generator(height: '350', width: '250')
		end
			
	end
end
