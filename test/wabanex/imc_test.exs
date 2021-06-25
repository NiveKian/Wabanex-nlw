defmodule Wabanex.ImcTest do
  use ExUnit.Case, async: true
  doctest Wabanex.IMC

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when files exist, return key map data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
        {:ok,
         %{
           "Dani" => 23.437499999999996,
           "Diego" => 23.04002019946976,
           "Gabul" => 22.857142857142858,
           "Rafael" => 24.897060231734173,
           "Rodrigo" => 26.234567901234566
         }}

      assert expected_response == response
    end

    test "when the file dosen't exist, return error message" do
      params = %{"filename" => "student.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error - the filename dosen't exist"}

      assert expected_response == response
    end
  end
end
