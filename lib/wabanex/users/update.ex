defmodule Wabanex.Users.Update do
  alias Ecto.UUID
  alias Wabanex.{Repo, User}

  def call(id, params) do
    id
    |> UUID.cast()
    |> handle_response(params)
  end

  defp handle_response({:ok, uuid}, params) do
    case Repo.get(User, uuid) do
      nil -> {:error, "User not found"}
      user -> update_handler(user, params)
    end
  end

  defp handle_response(:error, _params) do
    {:error, "Invalid UUID"}
  end

  defp update_handler(user, params) do
    user = Ecto.Changeset.change(user, params)
    Repo.update(user)
  end
end
