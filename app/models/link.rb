class Link < ApplicationRecord
  belongs_to :user
  has_many :visits

  def visit_count
   visits.count
  end

end
