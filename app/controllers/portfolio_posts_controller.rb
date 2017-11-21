class PortfolioPostsController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
	layout 'portfolio'
	access all: [:show, :index, :angular_scope], user: {except: [:destroy, :new, :create, :edit, :update]}, site_admin: :all


	def index
		@portfolio_items = PortfolioPost.by_position
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
	end

	def update
		respond_to do |format|
	    if @portfolio_item.update(post_params)
	      format.html { redirect_to portfolio_posts_path, notice: 'Portfolio item was  successfully updated.' }
	    else
	      format.html { render :edit }
	    end
    end
	end

	def show
	end

	def destroy
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
											   :main_image,
											   :thumb_image,
											    technologies_attributes: [:name]
											  )
	end

	def set_portfolio_item
		@portfolio_item = PortfolioPost.find(params[:id])
	end
end
