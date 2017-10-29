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

	def edit
		@portfolio_item = PortfolioPost.find(params[:id])
	end

	def update
		@portfolio_item = PortfolioPost.find(params[:id])
		respond_to do |format|
	    if @portfolio_item.update(params.require(:portfolio_post).permit(:title, :subtitle, :body))
	      format.html { redirect_to portfolio_posts_path, notice: 'Portfolio item was  successfully updated.' }
	    else
	      format.html { render :edit }
	    end
    end
	end

	def show
		@portfolio_item = PortfolioPost.find(params[:id])
	end

	def destroy
		@portfolio_item = PortfolioPost.find(params[:id])
		@portfolio_item.destroy
    	respond_to do |format|
      		format.html { redirect_to portfolio_posts_url, notice: 'Portfolio item was successfully destroyed.' }
    	end
	end

end
