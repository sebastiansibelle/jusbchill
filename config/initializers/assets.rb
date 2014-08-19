# This will instruct the assets pipeline to precompile admin.css as a separate file. See: http://stackoverflow.com/questions/15422944/in-rails-3-how-to-create-a-layout-that-includes-css-that-is-only-used-by-a-certa
# Slightly different in Rails 4
Rails.application.config.assets.precompile += %w( admin.css )