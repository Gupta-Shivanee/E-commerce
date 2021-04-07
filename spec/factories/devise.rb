FactoryBot.define do
  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    full_name {"Anything"}
    mobile_no {"0000000000"}
  end
end
