class HomeController < ApplicationController

def read
@recommendations = Recommendation.all
    render("home/home.html.erb")
  end


end
