exports.config =
  paths:
    watched: ["client", "vendor"]

  files:
    javascripts:
      defaultExtension: "coffee"
      joinTo:
        'application.js': /^(client)/
        'bower_scripts.js': /^(bower_components)/
        'vendor_scripts.js': /^(vendor)/

    stylesheets:
      defaultExtension: 'scss'
      joinTo:
        'app.css': /^client\/styles\/app.scss/
        'vendor.css': /^bower_components/

  # Activate the brunch plugins
  plugins:
    sass:
      debug: 'comments'

  modules:
    nameCleaner: (path) ->
      path
        # Strip the client/ prefix from module names
        .replace(/^client\//, '')
