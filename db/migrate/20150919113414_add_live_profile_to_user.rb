class AddLiveProfileToUser < ActiveRecord::Migration
  def change
    add_column :users, :live, :string
    add_column :users, :profile, :string
  end
end
