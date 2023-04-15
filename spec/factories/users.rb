FactoryBot.define do
  factory :user do
    nickname                    { Faker::Name.initials(number: 2) }
    email                       { Faker::Internet.free_email }
    password                    { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation       { password }
    last_name                   { Gimei.name.first.kanji }
    first_name                  { Gimei.name.last.kanji }
    last_name_kana              { Gimei.name.last.katakana }
    first_name_kana             { Gimei.name.first.katakana }
    birth_data                  { Faker::Date.birthday }
  end
end
