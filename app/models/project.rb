class Project < ActiveRecord::Base

  belongs_to :user
  has_many :microposts, :dependent => :destroy
  has_many :comments, :through => :microposts
  
    default_scope :order => 'projects.created_at DESC'
end
