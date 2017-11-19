class AddPositionToPortfolioPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolio_posts, :position, :integer
  end
end
