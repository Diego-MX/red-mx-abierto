class Tool < ActiveRecord::Base
  has_many :activity_tools
  has_many :activities, through: :activity_tools
end
