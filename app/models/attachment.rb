class Attachment < ActiveRecord::Base
  mount_uploader :file, FileUploader

  belongs_to :attachable, polymorphic: true

  before_save :set_file_name

  def file_name
    base_name(read_attribute(:file_name) || file.filename)
  end

  def truncated_file_name
    file_name.to_s.truncate Settings.attachment.length_name
  end

  def truncated_file_name_with_extension
    "#{truncated_file_name}#{file_extension}"
  end

  def file_name_with_extension
    "#{file_name}#{file_extension}"
  end

  def thumb_url
    file.thumb.url
  end

  private
  def set_file_name
    self.file_name ||= base_name file.path
    self.file_name = file_name.strip
  end

  def base_name path
    File.basename path, ".*" if path
  end

  def file_extension
    File.extname file.path
  end
end
