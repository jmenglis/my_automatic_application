require 'bundler'
Bundler.require

DB = Sequel.connect('postgres://localhost:5432/twitter')

# Adding Models
require './models/user'
# Adding Controllers
require './controllers/application_controller'
# Mapping Routes to Classes
map('/')       { run ApplicationController }
