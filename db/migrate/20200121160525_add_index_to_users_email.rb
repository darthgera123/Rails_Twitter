class AddIndexToUsersEmail < ActiveRecord::Migration[6.0]
  # Not predefined so we add custom classes. Used to ensure uniqueness at database level
  def change
  	add_index :users, :emails, unique: true
  end
end
