class Machine < ApplicationRecord
  self.inheritance_column = :inheritance_type
  # atr_accessible :type
  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :condition, inclusion: { in: 1..5 }, allow_nil: true
end
