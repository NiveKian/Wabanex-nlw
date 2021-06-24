defmodule WabanexWeb.Schema.Types.Training do
  use Absinthe.Schema.Notation

  import_types WabanexWeb.Schema.Types.Exercice

  @desc "Logic Training Representation"
  object :training do
    field :id, non_null(:uuid4)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :exercices, list_of(:exercice)
  end

  input_object :create_training_input do
    field :user_id, non_null(:uuid4)
    field :start_date, non_null(:string), description: "Training Start Date"
    field :end_date, non_null(:string), description: "Training End Date"
    field :exercices, list_of(:create_exercice_input)
  end
end
