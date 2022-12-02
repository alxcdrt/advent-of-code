defmodule AdventOfCode.Year2022.Day2 do
    @score %{"X" => 1, "Y" => 2, "Z" => 3, "A" => 1, "B" => 2, "C" => 3}  
    @win_value [-1, 2]

    @revert_win_score %{"A" => 2, "B" => 3, "C" => 1}
    @revert_lost_score %{"A" => 3, "B" => 1, "C" => 2}

    def part_1(input) do
        parse_input(input)
        |> play(0)
    end
    
    def part_2(input) do
        parse_input(input)
        |> play_with_rules(0)
    end
    
    defp parse_input(raw_input) do
        String.split(raw_input, "\n")
        |> Enum.map(&String.split/1)
    end
    
    defp play([], score), do: score
    defp play([h | t], score) do
        scores = to_score(h)
        play(t, score + result(scores))
    end
    
    defp play_with_rules([], score), do: score
    defp play_with_rules([h | t], score) do
        play_with_rules(t, score + compute_from_opponent(h))      
    end
    
    defp result([o, m]) when o - m == 0, do: 3 + m
    defp result([o, m]) when (o - m) in @win_value, do: 6 + m
    defp result([_, m]), do: m    
    
    defp to_score(p), do: Enum.map(p, &(@score[&1]))

    defp compute_from_opponent([o, "Z"]), do: @revert_win_score[o] + 6
    defp compute_from_opponent([o, "Y"]), do: @score[o] + 3
    defp compute_from_opponent([o, "X"]), do: @revert_lost_score[o]

end