class AddPriceToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :price, :string
  end
end
