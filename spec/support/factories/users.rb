# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::Name.first_name }
    password { FFaker::Internet.password }
  end
end
