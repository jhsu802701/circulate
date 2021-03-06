class Hold < ApplicationRecord
  belongs_to :member
  belongs_to :item, counter_cache: true
  belongs_to :creator, class_name: "User"
  belongs_to :loan, required: false

  scope :active, -> { where("ended_at IS NULL") }
  scope :ended, -> { where("ended_at IS NOT NULL") }

  def lend(loan, now: Time.current)
    update!(
      loan: loan,
      ended_at: now
    )
  end
end
