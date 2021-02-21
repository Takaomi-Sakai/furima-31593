FactoryBot.define do
  factory :user do
    nickname              {"名前"}
    email                 {Faker::Internet.free_email}
    password              {"Aa1234"}
    password_confirmation {password}
    last_name             {"名字"}
    first_name            {"名前"}
    last_name_ruby        {"カタカナ"}
    first_name_ruby       {"カタカナ"}
    birthday              {'2021-01-01'}
  end
end