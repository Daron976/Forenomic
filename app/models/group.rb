class Group < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :group_dealings, foreign_key: 'group_id'
  has_many :dealings, through: :group_dealings

  validates :name, presence: true
end
