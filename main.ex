###############################################################################
#                               GUESSING GAME                                 #
###############################################################################
defmodule GuessingGame do
  def play(lower, upper) do
    play(lower, upper, Enum.random(lower .. upper))
  end
  defp play(lower, upper, number) do
    guess = Integer.parse(IO.gets "Guess a number (#{lower}-#{upper}): ")
    case guess do
      {^number, _} ->
        IO.puts "Well guessed!"
      {n, _} when n in lower..upper ->
        IO.puts if n > number, do: "Too high.", else: "Too low."
        play(lower, upper, number)
      _ ->
        IO.puts "Guess not in valid range."
        play(lower, upper, number)
    end
  end
end

GuessingGame.play(1, 100)
###############################################################################
#                                 FIBONACCI                                   #
###############################################################################
# defmodule Fib do
#     def fib(n) do
#       case n do
#          {x} when x in 0..1 -> n
#           _ -> fib(n - 1) + fib(n - 2)
#       end
#     end
# end
# IO.puts(Fib.fib(4))
###############################################################################
#                                   FIZBUZZ                                   #
###############################################################################
defmodule Fizbuzz do
  fizbuzz = fn
    0, 0, _ -> "Fizzbuzz"
    0, _, _ -> "Fizz"
    _, 0, _ -> "Buzz"
    _, _, c -> c
  end
end
###############################################################################
#                                   Prefix                                    #
###############################################################################
prefix = fn front -> (fn back -> "#{front} #{back}" end) end
###############################################################################
#                               &... Notation                                 #
###############################################################################
Enum.map [1,2,3,4], &(&1 + 2)
Enum.map [1,2,3,4], &(IO.inspect (&1))
