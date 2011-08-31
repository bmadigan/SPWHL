class ChangeNametoAttachment < ActiveRecord::Migration
  def self.up
    rename_column :mediafiles, :media_file_name, :attachment_file_name
    rename_column :mediafiles, :media_content_type, :attachment_content_type
    rename_column :mediafiles, :media_file_size, :attachment_file_size
    rename_column :mediafiles, :updated_at, :attachment_updated_at
  end
  
  def self.down
    rename_column :mediafiles, :attachment_file_name, :media_file_name
    rename_column :mediafiles, :attachment_content_type, :media_content_type
    rename_column :mediafiles, :attachment_file_size, :media_file_size
    rename_column :mediafiles, :attachment_updated_at, :media_updated_at
  end
end