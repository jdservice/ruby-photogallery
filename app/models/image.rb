class Image < ActiveRecord::Base
  
  belongs_to :group
  has_many :entities
  has_many :metadata
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :enumerated_types
    
  validates_presence_of :file_name, :name
  validates_uniqueness_of :name
  
end
