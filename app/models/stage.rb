class Stage < ActiveRecord::Base
  has_many :steps, dependent: :destroy

  default_scope { order(:created_at) }
end
