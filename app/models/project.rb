class Project < ApplicationRecord
  has_many :issues
  validates :name, presence: true
end
