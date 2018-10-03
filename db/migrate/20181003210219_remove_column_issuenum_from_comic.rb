class RemoveColumnIssuenumFromComic < ActiveRecord::Migration[5.0]
  def change
    remove_column(:comics, :issueNumber)
  end
end
