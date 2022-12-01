defmodule Year2021.Day2Test do

  use ExUnit.Case

  import AdventOfCode.Year2021.Day2

  setup_all do
    root_path = File.cwd!
    input = File.read!(root_path <> "/test/input/2021/day_2")
    {:ok, input: input}
  end

  test "part_1", context do
    assert(part_1(context[:input]) == 150)
  end

  test "part_2", context do
    assert(part_2(context[:input]) == 900)
  end

end
