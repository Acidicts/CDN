class AddRequestsToServer < ActiveRecord::Migration[8.1]
  def change
    add_column :servers, :requests, :integer
  end
end
