# Be sure to restart your server when you modify this file.
require 'rack-cas/session_store/rails/active_record'
Sogno::Application.config.session_store ActionDispatch::Session::RackCasActiveRecordStore

Rails.application.config.session_store :cookie_store, key: '_sogno_session'
