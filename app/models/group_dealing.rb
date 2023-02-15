class GroupDealing < ApplicationRecord
  belongs_to :group, foreign_key: 'group_id'
  belongs_to :dealing, foreign_key: 'dealing_id'
end
