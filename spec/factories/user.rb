FactoryBot.define do
  factory :user do
    uid      { 'test@mail.com' }
    email    { 'test@mail.com' }
    password { 'testing' }
    password_confirmation { 'testing' }
    gender   { 'male ' }
  end
end
