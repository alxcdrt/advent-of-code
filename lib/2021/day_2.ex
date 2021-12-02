defmodule AdventOfCode.Year2021.Day2 do

  @spec part_1(binary) :: number
  def part_1(input) do
    position = execute_commands(%{x: 0, y: 0}, parse_input(input))
    position.x * position.y
  end

  @spec part_2(binary) :: number
  def part_2(input) do
    position = execute_advanced_commands(%{x: 0, y: 0, aim: 0}, parse_input(input))
    position.x * position.y
  end

  defp parse_input(input) do
    String.split(input, "\n")
    |> Enum.map(fn x -> String.split(x) end)
    |> Enum.map(fn x -> [Enum.at(x, 0), Enum.at(x, 1) |> String.to_integer()] end)
  end

  defp execute_commands(position, []), do: position
  defp execute_commands(position, [h | t]), do: compute_position(position, h) |> execute_commands(t)

  defp compute_position(position, ["forward", n]), do: %{position | x: position.x + n}
  defp compute_position(position, ["down", n]), do: %{position | y: position.y + n}
  defp compute_position(position, ["up", n]), do: %{position | y: position.y - n}

  defp execute_advanced_commands(position, []), do: position
  defp execute_advanced_commands(position, [h | t]), do: compute_advanced_position(position, h) |> execute_advanced_commands(t)

  defp compute_advanced_position(position, ["forward", n]), do: %{position | x: position.x + n, y: position.y + (position.aim * n)}
  defp compute_advanced_position(position, ["down", n]), do: %{position | aim: position.aim + n}
  defp compute_advanced_position(position, ["up", n]), do: %{position | aim: position.aim - n}

end
