class ActivityTool < ActiveRecord::Base
  belongs_to :tool
  belongs_to :activity
end
