json.array!(@tests) do |test|
  json.extract! test, :id, :title, :free
  json.url test_url(test, format: :json)
end
