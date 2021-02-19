class PagesController < ApplicationController

  def form
  end

  def results
    @results = params.fetch(:results)
  end

  def register_new_user
    puts "register_new_user !!!!!!!!!!!!!!!!!!!!!!!!!!!"
  end
end
