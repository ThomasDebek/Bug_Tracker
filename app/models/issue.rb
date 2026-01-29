class Issue < ApplicationRecord
  belongs_to :project
  has_many :comments, dependent: :destroy


  enum status: { open: 0, in_progress: 1closed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }


  validates :title, :status, :priority,  presence: true


  scope :by_status, ->(status) { where(status: status) if status.present? }
  scope :by_priority, ->(priority) { where(priority: priority) if priority.present? }
  scope :assigned_to_user, ->(user) { where(assigned_to: user) if user.present? }
  scope :overdue, -> { where("due_date < ?", Date.today).where.not(status: :closed) }

end
