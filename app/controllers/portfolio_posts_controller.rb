class PortfolioPostsController < ApplicationController
	def index
		@portfolio_items = PortfolioPost.all
	end

	def new
		@portfolio_item = PortfolioPost.new
	end

	def create
		@portfolio_item = PortfolioPost.new(params.require(:portfolio_post).permit(:title, :subtitle, :body))

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolio_posts_path, notice: 'Portfolio item was succesfully created.'}
			else
				format.html { render :new }
			end
		end
	end

end
