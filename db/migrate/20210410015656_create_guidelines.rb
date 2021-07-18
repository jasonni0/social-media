class CreateGuidelines < ActiveRecord::Migration[6.1]
  def change
    create_table :guidelines do |t|
      t.string :guideline

      t.timestamps
    end
  end
end
