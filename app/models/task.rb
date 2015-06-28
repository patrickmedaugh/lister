class Task < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :list, dependent: :destroy, :foreign_key => 'list_id'
end
