class Task < ApplicationRecord
  validates :title, presence: true
  validates :details, length: { minimum: 5, maximum: 50 }

  def truncated_details
    "#{self.details[0..15]}..."
  end
end
