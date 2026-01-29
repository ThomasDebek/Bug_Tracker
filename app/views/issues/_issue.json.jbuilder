json.extract! issue, :id, :title, :description, :status, :priority, :assigned_to, :due_date, :project_id, :created_at, :updated_at
json.url issue_url(issue, format: :json)
