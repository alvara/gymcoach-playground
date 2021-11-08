require 'ruby/openai'

class QuestionsController < ApplicationController
  def ask
     @params = params
    if params[:question].present?
      client = OpenAI::Client.new
      client.files.upload(parameters: { file: 'db/data.jsonl', purpose: 'search' })
      response = client.answers(parameters: {
        documents: ["I bench press 3 sets of 25kg at 8 reps on july 7th, 2020 and it was easy.", "I barbell squat 20kg twice, but failed on the third set on november 1st, 2021. But it was hard."],
        question: params[:question],
        model: "davinci",
        examples_context: "In 2017, U.S. life expectancy was 78.6 years.",
        examples: [["What is human life expectancy in the United States?","78 years."]],
        max_rerank: 10,
        max_tokens: 5
      })
      @reply = response['answers']
    end
  end
end
