class Tool < ActiveRecord::Base
  has_many :activity_tools, dependent: :destroy
  has_many :activities, through: :activity_tools
  
  default_scope { order(:created_at) }

  mount_uploader :icon, IconUploader
end
