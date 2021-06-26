defmodule WabanexWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "Logic User Representation"
  object :user do
    field :id, non_null(:uuid4)
    field :name, non_null(:string)
    field :email, non_null(:string)
    field :height, non_null(:float)
    field :weight, non_null(:float)
    field :fat_index, non_null(:float)
    field :muscle_index, non_null(:float)
    field :trainings, list_of(:training)
  end

  input_object :create_user_input do
    field :name, non_null(:string), description: "Users Name"
    field :email, non_null(:string), description: "Users Unique Email"
    field :password, non_null(:string), description: "Users Password"
    field :height, non_null(:float), description: "Users Height in Float"
    field :weight, non_null(:float), description: "Users Weight in Float"
    field :fat_index, non_null(:float), description: "Users Fat Index"
    field :muscle_index, non_null(:float), description: "Users Muscular Index"
  end
end
