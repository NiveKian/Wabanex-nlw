defmodule WabanexWeb.Schema.Types.Exercice do
  use Absinthe.Schema.Notation

  @desc "Logic Exercice Representation"
  object :exercice do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :youtube_video_url, non_null(:string)
    field :protocol_description, non_null(:string)
    field :repetitions, non_null(:string)
  end

  input_object :create_exercice_input do
    field :name, non_null(:string), description: "Exercice Name"
    field :youtube_video_url, non_null(:string), description: "Exercice Youtube Video"
    field :protocol_description, non_null(:string), description: "Exercice Protocol Description"
    field :repetitions, non_null(:string), description: "Exercice Set of Repetitions"
  end
end
