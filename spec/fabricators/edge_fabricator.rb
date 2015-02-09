Fabricator(:edge) do
  name {Faker::Lorem.words(1).to_s}
  description {Faker::Lorem.words(10).join(" ").to_s}
  category
end