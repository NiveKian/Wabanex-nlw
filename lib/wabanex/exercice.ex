defmodule Wabanex.Exercice do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @fields [:name, :youtube_video_url, :protocol_description, :repetitions]

  # struct that module will follow
  schema "users" do
    field :name, :string, null: false
    field :youtube_video_url, :string, null: false
    field :protocol_description, :string, null: false
    field :repetitions, :string, null: false

    belongs_to :training, Training

    timestamps()
  end

  # build a changeset based on a map by given types
  def changeset(exercice, params) do
    exercice
    |> cast(params, @fields)
    |> validate_required(@fields)
  end
end
