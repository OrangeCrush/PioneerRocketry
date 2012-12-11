class Post < ActiveRecord::Base
  attr_accessible :body, :image, :posted, :public, :title
end
