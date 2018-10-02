class Comic < ActiveRecord::Base
  has_many :reading_lists
  has_many :users, through: :reading_lists
end
