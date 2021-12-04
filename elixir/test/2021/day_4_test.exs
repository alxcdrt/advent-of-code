defmodule Day4Test do
  use ExUnit.Case

  import AdventOfCode.Year2021.Day4

  setup_all do
    root_path = File.cwd!
    input = File.read!(root_path <> "/test/input/2021/day_4")
    {:ok, input: input}
  end

  test "part_1", context do
    assert(part_1(context[:input]) == 4512)
  end

  test "part_2", context do
    assert(part_2(context[:input]) == 1924)
  end

end
