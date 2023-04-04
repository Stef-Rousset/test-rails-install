class Shop < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :schedules, dependent: :destroy
end
