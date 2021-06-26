defmodule Wabanex.Trainings.Update do
  alias Ecto.UUID
  alias Wabanex.{Repo, Training}

  def call(id, params) do
    id
    |> UUID.cast()
    |> handle_response(params)
  end

  defp handle_response({:ok, uuid}, params) do
    case Repo.get(Training, uuid) do
      nil -> {:error, "Training not found"}
      training -> update_handler(training, params)
    end
  end

  defp handle_response(:error, _params) do
    {:error, "Invalid UUID"}
  end

  defp update_handler(training, params) do
    training = Ecto.Changeset.change(training, params)
    Repo.update(training)
  end
end
