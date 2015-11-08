json.array!(@tasks) do |task|
  json.extract! task, :id, :title, :description, :end_date, :author_id
  json.url task_url(task, format: :json)
end
