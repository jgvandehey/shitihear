class Post < ActiveRecord::Base
  attr_accessible :description, :source
  belongs_to :user
end
