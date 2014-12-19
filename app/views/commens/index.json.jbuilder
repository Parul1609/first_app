json.array!(@commens) do |commen|
  json.extract! commen, :id, :user_name, :body, :idea_id
  json.url commen_url(commen, format: :json)
end
