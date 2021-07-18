class AddUserFkColtoMessages < ActiveRecord::Migration[6.1]
  def change
    add_reference :messages, :sender, references: :users
    add_reference :messages, :receiver, references: :users
  end
end
