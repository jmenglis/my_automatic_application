require 'bundler'
Bundler.require

#DB = Sequel.connect('<enter database here>')

# Adding Models

# Adding Controllers
require './controllers/application_controller'
# Mapping Routes to Classes
map('/')       { run ApplicationController }
