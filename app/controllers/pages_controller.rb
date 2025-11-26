class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @meal_plan = nil
  end

  def planner
    # Initialise un objet UserPreference vide pour le formulaire du chatbot
    @user_preference = UserPreference.new
    @meal_plan = nil
  end
end
