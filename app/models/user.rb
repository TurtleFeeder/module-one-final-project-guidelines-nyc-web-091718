class User < ActiveRecord::Base
  has_many :reading_lists
  has_many :comics, through: :reading_lists
end
