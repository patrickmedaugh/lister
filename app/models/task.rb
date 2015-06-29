class Task < ActiveRecord::Base
  validates  :title, presence: true
  has_many   :tags
  belongs_to :list
end
