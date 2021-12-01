defmodule AdventOfCode do
  def get_input(year, day) do
    root_path = File.cwd!
    File.read!("#{root_path}/input/#{year}/day_#{day}")
  end
end
