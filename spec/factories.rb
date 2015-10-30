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
    starts_at "2015-10-30 10:29:19"
    ends_at "2015-10-30 10:29:19"
    car nil
  end

  factory :car do
    brand "Brand"
    model "Model"
    color "Color"
    license "AAA000"
    year 1
    user nil
  end

  factory :user do
  end
end
