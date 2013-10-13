FactoryGirl.define do
  factory :user do
    first_name            "Howard"
    last_name             "Chen"
    country               "Swagnesia"
    street_address        "1234 Fake St."
    city                  "Swag City"
    zip_code              "99999"
    phone_number          "510-000-0000"
    email                 "howardxchen@gmail.com"
    password              "foobar"
    password_confirmation "foobar"
  end
end