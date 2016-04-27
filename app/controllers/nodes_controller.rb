class NodesController < ApplicationController
  before_action :update_score

  def index

  end

  def show
    name = ActionController::Base.helpers.sanitize(params[:name])
    #puts "name is #{name}"
    render "#{name}.html.md"
  end

  private

  def set_score
    @score = session[:score] || 0
    @chain = session[:chain] || []
  end

  def update_score
    set_score

    hash = {
        "barbie": 1
    }

    if controller_name == "nodes" and action_name == "index"
      @score = 0
      @chain = []
    elsif controller_name == "nodes" and action_name == "show"
      name = params[:name]

      if !@chain.include?(name)
        @chain << name
        delta = hash[name.parameterize.underscore.to_sym]
        @score += delta if delta
      end
    end
    session[:score] = @score
    session[:chain] = @chain
  end

end
