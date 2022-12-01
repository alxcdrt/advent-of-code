defmodule AdventOfCode.Year2022.Day1 do

    @spec part_1(binary) :: non_neg_integer
    def part_1(input) do
        parse_input(input)
        |> sum_elves_calories()
        |> Enum.max
    end

    @spec part_2(binary) :: non_neg_integer
    def part_2(input) do
        parse_input(input)
        |> sum_elves_calories
        |> Enum.sort(:desc)
        |> Enum.take(3)
        |> Enum.sum
    end   
    
    defp parse_input(input) do
        String.split(input, "\n\n")
        |> Enum.map(&(String.split(&1)))
        |> Enum.map(&(to_integer_list(&1)))
    end
    
    defp to_integer_list(string_list), do: Enum.map(string_list, &(String.to_integer(&1)))

    defp sum_elves_calories(parsed_input), do: Enum.map(parsed_input, &(Enum.sum(&1)))

end