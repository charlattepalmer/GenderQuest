class NodesController < ApplicationController
  def index

  end

  def show
    name = ActionController::Base.helpers.sanitize(params[:name])
    #puts "name is #{name}"
    render "#{name}.html.md"
  end
end
