class Stage < ActiveRecord::Base
  has_many :steps

  default_scope { order(:created_at) }
end
