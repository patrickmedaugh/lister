class Task < ActiveRecord::Base
  belongs_to :list, dependent: :destroy, :foreign_key => 'list_id'
end
