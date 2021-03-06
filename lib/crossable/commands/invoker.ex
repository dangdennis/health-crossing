defmodule Crossable.Commands.Invoker do
  def handle(msg) do
    IO.inspect(msg)

    case String.split(msg.content, " ", trim: true) do
      ["!new" | _tl] ->
        Crossable.Commands.New.invoke(msg)

      ["!myhabit" | _tl] ->
        Crossable.Commands.MyHabit.invoke(msg)

      ["!balance" | _tl] ->
        Crossable.Commands.Balance.invoke(msg)

      ["!join"] ->
        Crossable.Commands.Join.invoke(msg)

      ["!help" | _tl] ->
        Crossable.Commands.Help.invoke(msg)

      ["!remindme" | _tl] ->
        Crossable.Commands.RemindMe.invoke(msg)

      ["!remindthem" | _tl] ->
        Crossable.Commands.RemindThem.invoke(msg)

      # ["!raid" | _tl] ->
      #   Crossable.Commands.Raid.invoke(msg)

      # ["!attack" | _tl] ->
      #   Crossable.Commands.Attack.invoke(msg)

      # ["!join" | _tl] ->
      #   Crossable.Commands.Join.invoke(msg)

      # ["!bomb" | _tl] ->
      #   Crossable.Commands.Bomb.invoke(msg)

      # ["!wallet" | _tl] ->
      #   Crossable.Commands.Balance.invoke(msg)

      # ["!daily" | _tl] ->
      #   Crossable.Commands.Daily.invoke(msg)
      _ ->
        nil
    end
  end
end
