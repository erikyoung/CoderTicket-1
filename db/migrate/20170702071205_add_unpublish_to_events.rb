class AddUnpublishToEvents < ActiveRecord::Migration[5.0]
  def change
  	add_column :events, :unpublish, :boolean
  end
end
