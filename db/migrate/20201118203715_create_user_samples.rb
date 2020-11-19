class CreateUserSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :user_samples do |t|
      t.integer :user_id
      t.integer :sample_id

      t.timestamps
    end
  end
end
