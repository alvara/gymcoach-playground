require 'ruby/openai'

class QuestionsController < ApplicationController
  def ask
    @params = params
    if @params.present?
      @reply = 'ai chat response given'
    end
  end
end
