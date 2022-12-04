defmodule AdventOfCode.Year2022.Day4 do

    def part_1(input) do
        parse_input(input)
        |> fully_contain_count(0)
    end
    
    def part_2(input) do
        parse_input(input)
        |> overlap_count(0)
    end
    
    defp parse_input(raw) do
        String.split(raw, "\n")
        |> Enum.map(&(String.split(&1, ",")))
    end

    defp fully_contain_count([], count), do: count
    defp fully_contain_count([h | t], count) do
        fully_contain_count(t, count + one_in_the_other?(h))
    end
    
    defp overlap_count([], count), do: count
    defp overlap_count([h | t], count) do
        overlap_count(t, count + overlap?(h))
    end

    defp one_in_the_other?([a, b]) do
        m_a = convert_to_map(a) 
        m_b = convert_to_map(b)
    
        if contains_all?(m_a, m_b) or contains_all?(m_b, m_a), do: 1, else: 0
    end
    
    
    defp contains_all?(a, b), do: a.first >= b.first and a.last <= b.last

    defp overlap?(a, b), do: a.last >= b.first
    defp overlap?([a, b]) do
        [m_a, m_b] = [convert_to_map(a), convert_to_map(b)] |> Enum.sort()
        
        if overlap?(m_a, m_b), do: 1, else: 0
    end
    
    defp convert_to_map(str_range) do
        Enum.zip([:first, :last], String.split(str_range, "-", trim: true) |> Enum.map(&String.to_integer/1)) |> Map.new
    end

end
