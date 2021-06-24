defmodule Wabanex.Repo.Migrations.CreateExercicesTable do
  use Ecto.Migration

  def change do
    create table(:exercices) do
      add :name, :string, null: false
      add :youtube_video_url, :string, null: false
      add :protocol_description, :string, null: false
      add :repetitions, :string, null: false
      add :training_id, references(:trainings)

      timestamps()
    end
  end
end
