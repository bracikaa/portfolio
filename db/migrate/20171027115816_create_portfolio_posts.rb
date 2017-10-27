class CreatePortfolioPosts < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_posts do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
