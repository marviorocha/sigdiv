# frozen_string_literal: true

require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  config.ftp_host = '201.48.33.241'
  config.ftp_port = '21'
  config.ftp_user = 'sadp'
  config.ftp_passwd =  Rails.application.credentials.storage_server_passwd
  config.ftp_folder = '/'
  #config.ftp_url = 'ftp://sadp:' + Rails.application.credentials.storage_server_passwd + '@201.48.33.241'
  config.ftp_passive = true # false by default
  config.ftp_tls = false # false by default
  config.ftp_chmod = false
end