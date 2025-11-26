class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :gender, null: false, default: 'autre'
      t.integer :age, null: false, default: 18
      t.string :activity_level, null: false, default: 'modéré'
      t.decimal :weekly_budget_max, precision: 8, scale: 2, default: 100.0
      t.integer :max_prep_time_minutes, default: 30
      t.string :allergies, default: ''

      t.timestamps
    end
  end
end
