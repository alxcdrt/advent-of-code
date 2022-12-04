defmodule AdventOfCode.Year2022.Day3 do

    @alpha_values Map.merge(
        Enum.zip(?a..?z, 1..26) |> Enum.reduce(%{}, fn {c, v}, acc -> Map.put(acc, c, v) end),
        Enum.zip(?A..?Z, 27..52) |> Enum.reduce(%{}, fn {c, v}, acc -> Map.put(acc, c, v) end)
        )

    def part_1(input) do
        parse_input(input)
        |> Enum.map(&to_hash_set/1)
        |> Enum.flat_map(fn p -> get_char_in_both(p) end)
        |> Enum.sum
    end
    
    def part_2(input) do
        parse_input(input)
        |> Enum.map(&to_numeric/1)
        |> Enum.chunk_every(3)
        |> Enum.map(&get_badge/1)
        |> List.flatten
        |> Enum.sum
    end

    defp parse_input(input), do: String.split(input)

    defp to_hash_set(str) do
        a = String.slice(str, 0..div(String.length(str), 2)-1)
        b = String.slice(str, div(String.length(str), 2)..String.length(str)-1)
        {MapSet.new(to_numeric(a)), MapSet.new(to_numeric(b))}
    end
    
    defp get_badge([a, b]), do: {MapSet.new(a), MapSet.new(b)} |> get_char_in_both() |> MapSet.to_list
    defp get_badge([h1, h2 | t]) do
        [get_badge([h1, h2])] ++ t
        |> get_badge
    end

    defp get_char_in_both({a, b}), do: MapSet.intersection(a, b)

    defp to_numeric(str) do
        String.to_charlist(str)
        |> Enum.map(&(@alpha_values[&1]))
    end
end