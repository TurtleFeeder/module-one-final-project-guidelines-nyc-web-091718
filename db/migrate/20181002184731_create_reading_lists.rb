class CreateReadingLists < ActiveRecord::Migration[5.0]
  def change
    create_table :reading_lists do |t|
      t.integer :user_id
      t.integer :comic_id
    end
  end
end
