class RenameTitleMovieUrlToPerformers < ActiveRecord::Migration
  def change
    rename_column :performers, :movie_url, :movie
  end
end
