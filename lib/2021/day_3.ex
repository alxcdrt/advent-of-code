defmodule AdventOfCode.Year2021.Day3 do


  def part_1(input) do
    parse_input(input)
      |> Enum.map(&(String.graphemes(&1)))
      |> Enum.zip_with(&(get_most_common_bit(&1)))
      |> Enum.join()
      |> compute_power_consuption()
  end


  def part_2(input) do

  end

  defp parse_input(input), do: input |> String.split("\n")

  defp get_most_common_bit(enum) do
    {bit, _} = Enum.frequencies(enum) |> Enum.max_by(fn {_, v} -> v end)
    bit
  end

  defp compute_power_consuption(gamma) do
    b_gamma = String.to_integer(gamma, 2)
    max = :math.pow(2, String.length(gamma)) - 1 |> trunc()

    b_gamma * Bitwise.bxor(b_gamma, max)
  end
end
