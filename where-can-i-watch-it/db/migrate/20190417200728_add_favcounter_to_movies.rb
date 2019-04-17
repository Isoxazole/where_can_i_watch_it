class AddFavcounterToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :favcounter, :integer
  end
end
