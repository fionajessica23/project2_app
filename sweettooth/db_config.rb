require 'active_record'

options = {
  adapter: 'postgresql',
  database: 'sweettooth_db'
}


ActiveRecord::Base.establish_connection(options)
