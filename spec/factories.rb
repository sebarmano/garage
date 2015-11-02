FactoryGirl.define do
  factory :job_type do
    name "MyString"
  end

  factory :job do
    type nil
    appointment nil
    status 1
  end

  factory :appointment do
    starts_at DateTime.current + 1.week
    ends_at DateTime.current + 1.week + 2.hours
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
  end
end
