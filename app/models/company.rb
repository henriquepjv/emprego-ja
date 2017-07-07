class Company < ApplicationRecord
  has_many :jobs

  def premium?
    jobs.count >= 5 ? self : false
  end
end
