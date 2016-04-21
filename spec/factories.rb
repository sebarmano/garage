FactoryGirl.define do
  factory :assignment do
    appointment
    job_type
  end

  factory :customer do
    fname "John"
    lname "Smith"
    phone "123-456-7890"
  end

  factory :job_type do
    name "Balanceo"
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

    trait :booked do
      status :booked
    end

    trait :uncompleted do
      car nil
      status :uncompleted
    end

    trait :confirmed do
      status :confirmed
    end

    trait :cancelled do
      status :cancelled
    end
  end

  factory :car do
    brand "Brand"
    model "Model"
    color "Color"
    license "AAA000"
    year 1
    customer
  end

  factory :user do
    email "email@email.com"
    password "password"
    customer

    trait :confirmed do
      confirmed_at Time.zone.now
    end

    trait :admin do
      role :admin
      customer nil
    end

    factory :confirmed_user, traits: [:confirmed]
    factory :admin, traits: [:admin, :confirmed]
  end
end
