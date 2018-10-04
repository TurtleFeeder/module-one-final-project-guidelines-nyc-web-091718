class RemoveColumnSeriesFromComic < ActiveRecord::Migration[5.0]
  def change
    remove_column(:comics, :series)
  end
end
