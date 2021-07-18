class AddUserFkColtoFriends < ActiveRecord::Migration[6.1]
  def change
    add_reference :friends, :requester, references: :users
    add_reference :friends, :requestee, references: :users
  end
end
