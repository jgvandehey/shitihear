class Post < ActiveRecord::Base
  attr_accessible :description, :source, :category_ids
  belongs_to :user
  has_many :categorizations
  has_many :categories, :through => :categorizations
end
