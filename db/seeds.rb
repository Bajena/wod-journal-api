# Movements

Movement.create(name: "American Swing", default_reps: 10)
Movement.create(name: "Box Jump", default_reps: 15)
Movement.create(name: "Burpee", default_reps: 15)
Movement.create(name: "Clean & Jerk", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Clean", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Deadlift", default_kg_men: 80, default_kg_women: 60)
Movement.create(name: "Double Under", default_reps: 100)
Movement.create(name: "Handstand Push-Up", default_reps: 10)
Movement.create(name: "Muscle-Up", default_reps: 10)
Movement.create(
  name: "Overhead Squat", default_kg_men: 40, default_kg_women: 30
)
Movement.create(name: "Pull-Up", default_reps: 10)
Movement.create(name: "Push-Up", default_reps: 20)
Movement.create(name: "Push Jerk", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Push Press", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Ring Dip", default_reps: 10)
Movement.create(name: "Russian Swing", default_reps: 10)
Movement.create(name: "Sit-Up", default_reps: 10)
Movement.create(name: "Snatch", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Squat", default_reps: 50)
Movement.create(name: "Thruster", default_kg_men: 40, default_kg_women: 30)
Movement.create(name: "Toes To Bar", default_reps: 10)
Movement.create(name: "Wallball", default_reps: 10)

def movement(name)
  Movement.find_by!(name: name)
end

# Benchmarks
# http://www.crossfitcvi.com/resources/benchmark-hero-wods/
Wod.create(
  title: "Angie",
  goal_type: "for_time",
  preset: true,
  wod_items: [
    WodItem.new(movement: movement("Pull-Up"), reps: 100),
    WodItem.new(movement: movement("Push-Up"), reps: 100),
    WodItem.new(movement: movement("Sit-Up"), reps: 100),
    WodItem.new(movement: movement("Squat"), reps: 100)
  ]
)

Wod.create(
  title: "Barbara",
  goal_type: "for_time",
  rounds: 5,
  preset: true,
  wod_items: [
    WodItem.new(movement: movement("Pull-Up"), reps: 20),
    WodItem.new(movement: movement("Push-Up"), reps: 30),
    WodItem.new(movement: movement("Sit-Up"), reps: 40),
    WodItem.new(movement: movement("Squat"), reps: 50)
  ]
)

Wod.create(
  title: "Chelsea",
  goal_type: "emom",
  rounds: 30,
  preset: true,
  wod_items: [
    WodItem.new(movement: movement("Pull-Up"), reps: 5),
    WodItem.new(movement: movement("Push-Up"), reps: 10),
    WodItem.new(movement: movement("Sit-Up"), reps: 15)
  ]
)

Wod.create(
  title: "Cindy",
  goal_type: "amrap",
  timecap_seconds: 20.minutes,
  preset: true,
  wod_items: [
    WodItem.new(movement: movement("Pull-Up"), reps: 5),
    WodItem.new(movement: movement("Push-Up"), reps: 10),
    WodItem.new(movement: movement("Sit-Up"), reps: 15)
  ]
)

Wod.create(
  title: "Diane",
  goal_type: "for_time",
  preset: true,
  wod_items: [
    WodItem.new(
      movement: movement("Deadlift"),
      reps: 21,
      men_weight_kg: 100,
      women_weight_kg: 100
    ),
    WodItem.new(movement: movement("Handstand Push-Up"), reps: 21),
    WodItem.new(
      movement: movement("Deadlift"),
      reps: 15,
      men_weight_kg: 100,
      women_weight_kg: 100
    ),
    WodItem.new(movement: movement("Handstand Push-Up"), reps: 15),
    WodItem.new(
      movement: movement("Deadlift"),
      reps: 9,
      men_weight_kg: 100,
      women_weight_kg: 100
    ),
    WodItem.new(movement: movement("Handstand Push-Up"), reps: 9)
  ]
)

Wod.create(
  title: "Elizabeth",
  goal_type: "for_time",
  preset: true,
  wod_items: [
    WodItem.new(
      movement: movement("Clean"),
      reps: 21,
      men_weight_kg: 60,
      women_weight_kg: 60
    ),
    WodItem.new(movement: movement("Ring Dip"), reps: 21),
    WodItem.new(
      movement: movement("Clean"),
      reps: 15,
      men_weight_kg: 60,
      women_weight_kg: 60
    ),
    WodItem.new(movement: movement("Ring Dip"), reps: 15),
    WodItem.new(
      movement: movement("Clean"),
      reps: 9,
      men_weight_kg: 60,
      women_weight_kg: 60
    ),
    WodItem.new(movement: movement("Ring Dip"), reps: 9)
  ]
)
