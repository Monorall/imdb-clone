class RemoveCategoryFromMovies < ActiveRecord::Migration[7.0]
  def change
    remove_column :movies, :category, :string
  end
end
