FactoryBot.define do
  factory :user_order do
    postalcode         { '123-4567' }
    prefecture_id      { 2 }
    maincipality       { '横浜市' }
    address            { '青山1-1-1' }
    building           { '柳ビル103' }
    phone              { '09012345678' }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
