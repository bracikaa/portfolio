class PagesController < ApplicationController
  def home
  	@pages = Blog.all
  end

  def about
  end

  def contact
  end

  def rails_news
  	@tweets = TwitterSearch.twitter_search
  end
end
