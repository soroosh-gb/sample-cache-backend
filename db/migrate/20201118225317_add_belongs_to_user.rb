class AddBelongsToSamples < ActiveRecord::Migration[6.0]
  def change
    add_reference :samples, :user, null: false, foreign_key: true
  end
end
