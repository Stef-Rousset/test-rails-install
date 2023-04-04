class Schedule < ApplicationRecord
  belongs_to :shop

  validates :day, presence: true, uniqueness: {scope: :shop_id}
  validates :opening, presence: true, if: :open?
  validates :closing, presence: true, if: :open?
  validates :midday_opening, presence: true, if: :midday_closing
  validates :midday_closing, presence: true, if: :midday_opening


  #attribute :closed, :boolean, default: false
  enum day: {lundi: 1, mardi: 2, mercredi: 3, jeudi: 4, vendredi: 5, samedi: 6, dimanche: 7}

  def open?
    closed == false
  end
end
