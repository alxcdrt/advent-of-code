defmodule AdventOfCode.Year2021.Day3 do

  @spec part_1(binary) :: integer
  def part_1(input) do
    parse_input(input)
    |> Enum.map(&(String.graphemes(&1)))
    |> Enum.zip_with(&(get_most_common_bit(&1)))
    |> Enum.join()
    |> compute_power_consuption()
  end

  def part_2(input) do
    t_input = parse_input(input) |> Enum.map(&(String.graphemes(&1)))
    compute_oxygen_rating(t_input, Enum.zip_with(t_input, &(&1)), 0) * compute_co2_rating(t_input, Enum.zip_with(t_input, &(&1)), 0)

  end

  defp parse_input(input), do: input |> String.split("\n")

  defp get_most_common_bit(enum) do
    {bit, _} = Enum.frequencies(enum) |> Enum.max_by(fn {_, v} -> v end)
    bit
  end

  defp get_most_common_bit_or_1(enum) do
    Enum.frequencies(enum) |> Enum.max_by(fn {_, v} -> v end, &>/2)
  end

  defp get_least_common_bit_or_0(enum) do
    Enum.frequencies(enum) |> Enum.min_by(fn {_, v} -> v end)
  end

  defp compute_power_consuption(gamma) do
    b_gamma = String.to_integer(gamma, 2)
    max = :math.pow(2, String.length(gamma)) - 1 |> trunc()

    b_gamma * Bitwise.bxor(b_gamma, max)
  end

  defp compute_oxygen_rating(input, _, _) when length(input) == 1, do: Enum.join(input) |> String.to_integer(2)
  defp compute_oxygen_rating(input, zip, index) do
    {bit, _} = get_most_common_bit_or_1(Enum.at(zip, index))
    new_input = Enum.filter(input, &(Enum.at(&1, index)) == bit)
    new_zip = Enum.zip_with(new_input, &(&1))
    compute_oxygen_rating(new_input, new_zip, index + 1)
  end

  defp compute_co2_rating(input, _, _) when length(input) == 1, do: Enum.join(input) |> String.to_integer(2)
  defp compute_co2_rating(input, zip, index) do
    {bit, _} = get_least_common_bit_or_0(Enum.at(zip, index))
    new_input = Enum.filter(input, &(Enum.at(&1, index)) == bit)
    new_zip = Enum.zip_with(new_input, &(&1))
    compute_co2_rating(new_input, new_zip, index + 1)
  end
end
