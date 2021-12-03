defmodule AdventOfCode.Year2021.Day3 do

  @spec part_1(binary) :: integer
  def part_1(input) do
    parse_input(input)
    |> Enum.map(&(String.graphemes(&1)))
    |> Enum.zip_with(fn x -> get_common_bit_by(x, &>/2) end)
    |> Enum.join()
    |> compute_power_consuption()
  end

  @spec part_2(binary) :: integer
  def part_2(input) do
    t_input = parse_input(input) |> Enum.map(&(String.graphemes(&1)))
    compute_oxygen_rating(t_input) * compute_co2_rating(t_input)
  end

  defp parse_input(input), do: input |> String.split("\n")

  defp get_common_bit_by(enum, fun), do: Enum.frequencies(enum) |> Enum.max_by(fn {_, v} -> v end, fun) |> Tuple.to_list() |> Enum.at(0)

  defp compute_power_consuption(gamma) do
    b_gamma = String.to_integer(gamma, 2)
    max = :math.pow(2, String.length(gamma)) - 1 |> trunc()

    b_gamma * Bitwise.bxor(b_gamma, max)
  end

  defp compute_rating(input, _, _) when length(input) == 1, do: Enum.join(input) |> String.to_integer(2)
  defp compute_rating(input, index, fun) do
    bit = Enum.zip_with(input, &(&1)) |> Enum.at(index) |> get_common_bit_by(fun)
    Enum.filter(input, &(Enum.at(&1, index)) == bit) |> compute_rating(index + 1, fun)
  end

  defp compute_oxygen_rating(input), do: compute_rating(input, 0, &>/2)
  defp compute_co2_rating(input), do: compute_rating(input, 0, &<=/2)
end
