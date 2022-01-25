class AddLocationIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_reference(:items, :location, foreign_key: true)
  end
end
