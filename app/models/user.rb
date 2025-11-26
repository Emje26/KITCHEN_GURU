class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :recipes, dependent: :destroy

  after_create :create_profile

  private

  def create_profile
    Profile.create!(
      user: self,
      gender: 'autre',
      age: 18,
      activity_level: 'modéré',
      weekly_budget_max: 100.0,
      max_prep_time_minutes: 30,
      allergies: ''
    )
  end
end
