Factory.define :player do |f|
  f.sequence(:first_name)     { |n| "foo#{n}" }
  f.sequence(:last_name)      { |n| "foo#{n}" }
  f.sequence(:email_address)  { |n| "foo#{n}@example.com" }
end
