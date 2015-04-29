class Tool < ActiveRecord::Base
  has_many :activity_tools, dependent: :destroy
  has_many :activities, through: :activity_tools
end
