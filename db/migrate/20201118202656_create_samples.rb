class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      
      t.string :name
      t.string :image_file
      t.string :audio_file
      t.string :genre
      t.boolean :collection

      t.timestamps
    end
  end
end
