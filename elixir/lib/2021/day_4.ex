defmodule AdventOfCode.Year2021.Day4 do

  @spec part_1(binary) :: number
  def part_1(input) do
    {draws, boards} = parse_input(input)
    {_, _, winner, draw} = draw(draws, boards)
    Enum.reject(winner, &(&1 == nil)) |> Enum.map(&(String.to_integer(&1))) |> Enum.sum() |> Kernel.*(String.to_integer(draw))
  end

  def part_2(input) do
    {draws, boards} = parse_input(input)
    {_, _, winner, draw} = search_last(boards, draws)
    Enum.reject(winner, &(&1 == nil)) |> Enum.map(&(String.to_integer(&1))) |> Enum.sum() |> Kernel.*(String.to_integer(draw))
  end

  defp search_last(looser, draws) when length(looser) == 1, do: draw(draws, looser)
  defp search_last(boards, draws) do
    {boards, draws, winner, _} = draw(draws, boards)
    Enum.reject(boards, &(&1 == Enum.chunk_every(winner, 5))) |> search_last(draws)
  end

  defp parse_input(input), do: String.split(input) |> create_boards()
  defp create_boards([draws | boards]), do: {String.split(draws, ","), Enum.chunk_every(boards, 25) |> Enum.reduce([], &([Enum.chunk_every(&1, 5) | &2]))}

  defp draw([h | _] = draws, boards) do
    boards
    |> Enum.map(fn b -> Enum.map(b, fn r -> Enum.map(r, &(if &1 == h, do: nil, else: &1)) end) end)
    |> check_winner(draws)
  end

  defp check_winner(boards, [h | t]) do
    resolved = boards |> Enum.map(fn b -> resolve_board(b) end)
    if Enum.any?(resolved, fn {a, _} -> a end) do
     {boards, t, Enum.filter(resolved, fn {a, _} -> a end) |> Enum.map(fn {_, v} -> v end) |> List.flatten(), h}
    else
      draw(t, boards)
    end
  end

  defp resolve_board(board), do: {resolve_part(board) or Enum.zip_with(board, &(&1)) |> resolve_part(), board}
  defp resolve_part(board), do: Enum.any?(board, fn r -> Enum.all?(r, &(&1 == nil)) end)

end
