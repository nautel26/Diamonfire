class FileUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

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

  version :thumb, if: :image? do
    process :resize_to_fill => [150, 150]
  end

  protected
  def image? file
    file.content_type.include? "image"
  end
end
