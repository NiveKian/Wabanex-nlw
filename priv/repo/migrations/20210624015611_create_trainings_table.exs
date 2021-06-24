defmodule Wabanex.Repo.Migrations.CreateTrainingsTable do
  use Ecto.Migration

  def change do
    create table(:trainings) do
      add :start_date, :date, null: false
      add :end_date, :date, null: false
      add :user_id, references(:users)

      timestamps()
    end
  end
end
