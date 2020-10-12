FactoryBot.define do
    factory :contact do
        phone { FFaker::PhoneNumberBR.phone_number }
        email { FFaker::Internet.email }
        website { FFaker::Internet.http_url }
        address_country { FFaker::address.country }
        address_city { FFaker::address.city }

        portfolio
    end
end