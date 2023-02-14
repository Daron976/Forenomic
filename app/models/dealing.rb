class Dealing < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :group_dealings, foreign_key: 'dealing_id'
  has_many :groups, through: :group_dealings

  validates :name, presence: true
  validates :amount, presence: true
end
