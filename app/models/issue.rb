class Issue < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy


  enum status: { open: 0, in_progress: 1closed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }


  validates :title, :status, :priority,  presence: true

end
