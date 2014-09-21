class RenameClientUuid < ActiveRecord::Migration
  def change
    rename_column :clients, :uuid, :prism_uuid
  end
end
