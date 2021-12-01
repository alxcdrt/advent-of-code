defmodule AdventOfCode.Year2021.Day1 do

@spec part_1(binary) :: non_neg_integer
def part_1(input) do
  [h_data | t_data] = parse_input(input)
  compute_increased_count(t_data, h_data, 0)
end

defp parse_input(input), do: input |> String.split("\n") |> Enum.map(fn x -> Integer.parse(x) end)

defp compute_increased_count([], _, count), do: count

defp compute_increased_count([h | t], current, count) do
  compute_increased_count(t, h, count +  (if h > current, do: 1, else: 0) )
end

end
