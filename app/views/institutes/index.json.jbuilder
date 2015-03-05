json.array!(@institutes) do |institute|
  json.extract! institute, :id, :name, :details
  json.url institute_url(institute, format: :json)
end
