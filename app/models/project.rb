class Project < ApplicationRecord
  has_many :issues
  validates :name, presence: true

  def open_issues_count
    issues.open.count
  end

  def in_progress_issues_count
    issues.in_progress.count
  end

  def closed_issues_count
    issues.closed.count
  end

  def overdue_issues_count
    issues.overdue.count
  end

end
