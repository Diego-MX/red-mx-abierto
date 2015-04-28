class Step < ActiveRecord::Base
  belongs_to :stage
  has_many :activities

  default_scope { order(:created_at) }
end
