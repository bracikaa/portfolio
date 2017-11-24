module PortfolioPostsHelper
	def image_generator(height:, width:)
		"http://via.placeholder.com/#{height}x#{width}"
	end

	def main_portfolio_img
			image_generator(height: '600', width: '450')
	end

	def thumb_portfolio_img
			image_generator(height: '350', width: '250')
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
