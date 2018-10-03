class RemoveColumnCharIdFromComic < ActiveRecord::Migration[5.0]
  def change
    remove_column(:comics, :character_ID)
  end
end
