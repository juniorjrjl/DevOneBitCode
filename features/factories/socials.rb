FactoryBot.define do
    factory :social do
        kind {  [:faceboo, :twitter, :linkedin, :github, :instagram, :other].sample }
        url { FFaker::internet.http_url }
        portfolio
    end
end