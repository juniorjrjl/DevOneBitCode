FactoryBot.define do
    factory :portfolio do
        slug { FFakers::Lorem.unique.word.downcase }
        active { FFakers::Boolean.sample }
        listed { FFakers::Boolean.sample }
        featured { FFakers::Boolean.sample }
        user
    end
end