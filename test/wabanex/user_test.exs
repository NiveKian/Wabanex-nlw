defmodule Wabanex.UserTest do
  use Wabanex.DataCase
  doctest Wabanex.User

  alias Wabanex.User

  describe "changeset/1" do
    test "When params are valid, return user" do
      params = %{name: "Banana", email: "banana@gmail.com", password: "banana1234"}

      response = User.changeset(params)

      assert %Ecto.Changeset{
               changes: %{email: "banana@gmail.com", name: "Banana", password: "banana1234"},
               valid?: true,
               errors: []
             } = response
    end

    test "When params are invalid, return invalid changeset" do
      params = %{name: "B", email: "banana@gmail.com", password: "ban"}

      response = User.changeset(params)

      expected_response = %{
        name: ["should be at least 2 character(s)"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
