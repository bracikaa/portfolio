class PortfolioPostsController < ApplicationController

	layout 'portfolio'

	def index
		@portfolio_items = PortfolioPost.all
	end

	def angular_scope
		@angular_portfolio = PortfolioPost.angular_scope
	end

	def new
		@portfolio_item = PortfolioPost.new
		3.times { @portfolio_item.technologies.build }
	end

	def create
		@portfolio_item = PortfolioPost.new(post_params)

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
	    if @portfolio_item.update(post_params)
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


	private

	def post_params
		params.require(:portfolio_post).permit(:title, 
											   :subtitle, 
											   :body, 
											    technologies_attributes: [:name]
											  )
	end
end
