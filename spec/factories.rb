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
    starts_at "10:00 AM"
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

  factory :user, aliases: [:customer] do
    fname "fname"
    lname "lname"
    email "email@email.com"
    password "password"
    phone "999-999-9999"

    trait :confirmed do
      confirmed_at Time.zone.now
    end

    trait :admin do
      role :admin
    end

    factory :confirmed_user, traits: [:confirmed]
    factory :admin, traits: [:admin, :confirmed]
  end
end
