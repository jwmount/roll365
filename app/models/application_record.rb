# app/models/application_record.rb
# the presence of this file prevents rails migrations from recreating application_record.rb
# see https://github.com/rails/rails/issues/29407

require 'models/application_record.rb'


# allow remote access to all scopes - i.e. you can count or get a list of ids
# for any scope or relationship
ApplicationRecord.regulate_scope :all
  end unless Rails.env.production?