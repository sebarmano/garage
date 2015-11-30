FactoryGirl.define do
  factory :job_type do
    name "job_type"
  end

  factory :job do
    type nil
    appointment nil
    status 1
  end

  factory :appointment do
    date_on Date.tomorrow
    starts_at Time.zone.now.strftime("%H:%M")
    duration 2
    car
  end

  factory :car do
    brand "Brand"
    model "Model"
    color "Color"
    license "AAA000"
    year 1
    user
  end

  factory :user do
    fname "fname"
    lname "lname"
    email "email@email.com"
    password "password"
    phone "999-999-9999"

    trait :confirmed do
      confirmed_at { Time.current }
    end

    factory :confirmed_user, traits: [:confirmed]
  end
end
