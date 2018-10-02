class CreateComics < ActiveRecord::Migration[5.0]
  def change
    create_table :comics do |t|
      t.string :title
      t.string :series
      t.integer :issueNumber
      t.integer :character_ID
    end
  end
end
