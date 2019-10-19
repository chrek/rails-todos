class Item < ApplicationRecord
  belongs_to :todo

  def completed?
    !completed_at.blank?
  end
end
