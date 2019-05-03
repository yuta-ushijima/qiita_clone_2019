class AddUserIdToArticle < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :users, foreign_key: true
  end
end
