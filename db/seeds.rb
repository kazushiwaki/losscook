user = User.create!(email: "test@example.com", password: "password", name: "テストユーザー")

6.times do |i|
  Recipe.create!(
    title: "レシピ#{i + 1}",
    description: "これはレシピ#{i + 1}の説明です。",
    ingredients_text: "材料#{i + 1}",
    step_text: "手順#{i + 1}",
    user: user
  )
end