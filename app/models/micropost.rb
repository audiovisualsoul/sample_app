class Micropost < ActiveRecord::Base
  attr_accessible :content, :file

  belongs_to :project
  belongs_to :user
  has_many :comments, :dependent => :destroy

  validates :content, :presence => true, :length => { :maximum => 140 }
	mount_uploader :file, FileUploader

  default_scope :order => 'microposts.created_at DESC'
end