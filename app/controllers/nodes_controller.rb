class NodesController < ApplicationController
  before_action :get_params

  def index
  end

  def show
    render "#{@name}.html.md"
  end

  private

  def get_params
    hash = {
        "barbie_1" => -1,
        "barbie_3" => +1,

        "second_grade_1" => -1,
        "second_grade_3" => +1,

        "teams_1" => -1,
        "teams_3" => +1,

        "running_1" => -1,
        "running_3" => +1,

        "basketball_melody_1" => -1,
        "basketball_melody_3" => +1,

        "basketball_melody_1_1" => -1,
        "basketball_melody_1_3" => +1,

        "college_1" => -1,
        "college_3" => +1,

        "promotion_1" => -1,
        "promotion_3" => +1,
    }.with_indifferent_access

    @score = 0
    if controller_name == "nodes" and action_name == "index"
      @chain = []
    elsif controller_name == "nodes" and action_name == "show"
      @name = ActionController::Base.helpers.sanitize(params[:name])
      chain =  ActionController::Base.helpers.sanitize(params[:chain])
      redirect_to root_path, notice: "There has been an error, please start over." if chain.blank?

      @chain = chain.blank? ? [] : JSON.parse(chain)
      # puts "@name is #{@name}"
      # puts "old @chain is #{@chain}"
      # puts "old @score is #{@score}"
      @chain << @name

      @chain.each do |n|
        delta = hash[n.parameterize.underscore.to_sym]
        @score += delta if delta
      end
      # puts "new @chain is #{@chain}"
      # puts "new @score is #{@score}"
    end
  end

end