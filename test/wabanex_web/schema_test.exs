defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true
  doctest WabanexWeb.Schema

  alias Wabanex.User

  describe "users query" do
    test "when a valid id is given, return the user", %{conn: conn} do
      params = %{name: "popoga", password: "1234567", email: "popoga@gmail.com"}

      {:ok, %User{id: user_id}} = Wabanex.Users.Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            id
            email
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "getUser" => %{
                   "email" => "popoga@gmail.com",
                   "name" => "popoga",
                   "id" => _id
                 }
               }
             } = response
    end
  end

  describe "users mutations" do
    test "when all params are valid, create an user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {name: "pinapou", password: "1234567" , email: "julumba@gmail.com"}){
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{
                   "email" => "julumba@gmail.com",
                   "id" => _id,
                   "name" => "pinapou"
                 }
               }
             } = response
    end
  end
end
