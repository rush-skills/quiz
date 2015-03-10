json.array!(@attempt_answers) do |attempt_answer|
  json.extract! attempt_answer, :id, :answer_id, :attempt_question_id, :choosen
  json.url attempt_answer_url(attempt_answer, format: :json)
end
