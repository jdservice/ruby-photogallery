class Image < ActiveRecord::Base
  
  belongs_to :group
  has_many :entities
  has_many :metadata

  validates_presence_of :file_name, :name
  
end
