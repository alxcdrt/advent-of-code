defmodule AdventOfCode.Year2021.Day1 do

@spec part_1(binary) :: non_neg_integer
def part_1(input) do
  [h_data | t_data] = parse_input(input)
  compute_increased_count(t_data, h_data, 0)
end

@spec part_2(binary) :: non_neg_integer
def part_2(input) do
  [h_window | t_window] = parse_input(input) |> compute_windows([])
  compute_increased_count(t_window, h_window, 0)
end

defp parse_input(input), do: input |> String.split("\n") |> Enum.map(fn x -> String.to_integer(x) end)

defp compute_increased_count([], _, count), do: count

defp compute_increased_count([h | t], current, count) do
  compute_increased_count(t, h, count +  (if h > current, do: 1, else: 0) )
end

defp compute_windows([], windows), do: Enum.reverse(windows)

defp compute_windows(data, windows) do
  sum = Enum.take(data, 3) |> Enum.sum()
  compute_windows(tl(data), [sum | windows])
end

end
