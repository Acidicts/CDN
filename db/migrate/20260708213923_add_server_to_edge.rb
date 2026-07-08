class AddServerToEdge < ActiveRecord::Migration[8.1]
  def change
    add_reference :edges, :server, null: false, foreign_key: true
  end
end
