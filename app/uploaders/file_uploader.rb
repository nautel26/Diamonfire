# encoding: utf-8

class FileUploader < CarrierWave::Uploader::Base
  storage :file
  after :remove, :delete_empty_upstream_dirs

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  def delete_empty_upstream_dirs
    path = ::File.expand_path store_dir, root
    Dir.delete path
  rescue SystemCallError
    true
  end
end
