defmodule Day1Test do
  use ExUnit.Case

  import AdventOfCode.Year2021.Day1

  setup_all do
    root_path = File.cwd!
    input = File.read!(root_path <> "/test/input/2021/day_1")
    {:ok, input: input}
  end

  test "part_1", context do
    assert(part_1(context[:input]) == 7)
  end

end
