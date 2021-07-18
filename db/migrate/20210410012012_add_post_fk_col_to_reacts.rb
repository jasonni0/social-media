class AddPostFkColToReacts < ActiveRecord::Migration[6.1]
  def change
    add_reference :reacts, :post, foreign_key:true
  end
end
