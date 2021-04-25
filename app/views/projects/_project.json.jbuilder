json.extract! project, :id, :name, :repo_url, :owner_id, :owner_type, :created_at, :updated_at
json.url project_url(project, format: :json)
