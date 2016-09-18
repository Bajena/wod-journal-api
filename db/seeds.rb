unless Movement.any?
  Movement.create!(name: "American Swing", default_reps: 10)
  Movement.create!(name: "Box Jump", default_reps: 15)
  Movement.create!(name: "Burpee", default_reps: 15)
  Movement.create!(
    name: "Clean & Jerk", default_kg_men: 40, default_kg_women: 30
  )
  Movement.create!(name: "Clean", default_kg_men: 40, default_kg_women: 30)
  Movement.create!(name: "Deadlift", default_kg_men: 80, default_kg_women: 60)
  Movement.create!(name: "Double Under", default_reps: 100)
  Movement.create!(name: "Handstand Pushup", default_reps: 10)
  Movement.create!(name: "Muscle-Up", default_reps: 10)
  Movement.create!(
    name: "Overhead Squat", default_kg_men: 40, default_kg_women: 30
  )
  Movement.create!(name: "Push Jerk", default_kg_men: 40, default_kg_women: 30)
  Movement.create!(name: "Push Press", default_kg_men: 40, default_kg_women: 30)
  Movement.create!(name: "Russian Swing", default_reps: 10)
  Movement.create!(name: "Sit-up", default_reps: 10)
  Movement.create!(name: "Snatch", default_kg_men: 40, default_kg_women: 30)
  Movement.create!(name: "Thruster", default_kg_men: 40, default_kg_women: 30)
  Movement.create!(name: "Toes To Bar", default_reps: 10)
  Movement.create!(name: "Wallball", default_reps: 10)
end
