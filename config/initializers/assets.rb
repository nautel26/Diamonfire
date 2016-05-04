# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
assets_javascripts = %w(all.js jquery.backgroundvideo.min.js jquery.mb.YTPlayer.js
  admin/modernizr.js select2.js select2_locale_vi.js admin/theme.js
  admin/theme.custom.js admin/theme.init.js bootstrap-fileupload.min.js jquery.autosize.js
  bootstrap-multiselect.js bootstrap-tagsinput.js dropzone.js jquery.validate.js)
assets_stylesheets = %w(select2.css admin/theme.css admin/default.css admin/theme-custom.css
  bootstrap-fileupload.min.css bootstrap-multiselect.css bootstrap-tagsinput.css
  basic.css dropzone.css.scss)
Rails.application.config.assets.precompile += assets_javascripts + assets_stylesheets
