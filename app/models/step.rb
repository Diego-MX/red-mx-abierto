class Step < ActiveRecord::Base
  belongs_to :stage
  has_many :activities
end
