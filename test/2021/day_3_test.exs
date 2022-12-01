defmodule Year2021.Day3Test do
  use ExUnit.Case

  import AdventOfCode.Year2021.Day3

  setup_all do
    root_path = File.cwd!
    input = File.read!(root_path <> "/test/input/2021/day_3")
    {:ok, input: input}
  end

  test "part_1", context do
    assert(part_1(context[:input]) == 198)
  end

  test "part_2", context do
    assert(part_2(context[:input]) == 230)
  end

end
