class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to planner_path, notice: "Profil mis à jour avec succès !"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_profile
    # Créer le profil s'il n'existe pas encore (pour les anciens utilisateurs)
    @profile = current_user.profile || current_user.create_profile(
      gender: 'autre',
      age: 18,
      activity_level: 'modéré',
      weekly_budget_max: 100.0,
      max_prep_time_minutes: 30,
      allergies: ''
    )
  end

  def profile_params
    params.require(:profile).permit(
      :gender,
      :age,
      :activity_level,
      :weekly_budget_max,
      :max_prep_time_minutes,
      :allergies
    )
  end
end
