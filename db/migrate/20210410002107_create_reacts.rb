class CreateReacts < ActiveRecord::Migration[6.1]
  def change
    create_table :reacts do |t|
      t.boolean :is_like

      t.timestamps
    end
  end
end
