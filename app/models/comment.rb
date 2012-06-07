class Comment < ActiveRecord::Base
attr_accessible :body
  belongs_to :micropost
  
    default_scope :order => 'comments.created_at DESC'
end
