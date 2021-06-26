defmodule Wabanex.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Wabanex.Training

  @primary_key {:id, :binary_id, autogenerate: true}

  @fields [:email, :password, :name, :height, :weight, :fat_index, :muscle_index]

  # struct that User module will follow
  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :height, :float
    field :weight, :float
    field :fat_index, :float
    field :muscle_index, :float

    has_many :trainings, Training

    timestamps()
  end

  # build a changeset based on a map by given types
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_length(:password, min: 6)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i)
    |> unique_constraint(:email)
    |> unique_constraint(:name)
  end
end
