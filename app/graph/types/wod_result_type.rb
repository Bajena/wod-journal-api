WodResultType = GraphQL::ObjectType.define do
  name "WodResult"
  description "A result of a WOD"
  interfaces [NodeIdentification.interface]
  global_id_field :id

  field :id, !types.ID, "Result ID"
  field :reps, types.Int, "Number of completed reps (for AMRAP WODs)"
  field :time_seconds, types.Int, "How much time (seconds) the workout took?"
  field :done, types.Boolean, "Workout completed?"
  field :scaled, types.Boolean, "Was the WOD scaled?"
  field :wod, !WodType, "a WOD"
end
