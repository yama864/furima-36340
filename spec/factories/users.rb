FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name }
    end

    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    last_name             { gimei.last.kanji }
    first_name            { gimei.first.kanji }
    last_name_kana        { gimei.last.katakana }
    first_name_kana       { gimei.first.katakana }
    birth_date            { Faker::Date.backward }
  end
end
