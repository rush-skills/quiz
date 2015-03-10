json.array!(@test_attempts) do |test_attempt|
  json.extract! test_attempt, :id, :user_id, :test_id, :marks, :time_taken
  json.url test_attempt_url(test_attempt, format: :json)
end
