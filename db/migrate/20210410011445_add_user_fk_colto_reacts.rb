class AddUserFkColtoReacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :reacts, :user, foreign_key: true
  end
end
