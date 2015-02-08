Fabricator(:requirement) do
  name {Faker::Lorem.words(1).to_s}
  value {Faker::Lorem.words(1).to_s}
  mode {Faker::Lorem.words(1).to_s}
end