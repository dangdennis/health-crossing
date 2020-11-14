defmodule Crossable.UserHabitsTest do
  use Crossable.DataCase

  alias Crossable.Schema.Habits.Habit

  describe "get_active_user_habit_by_discord_id/1" do
    test "get the user's single active habit" do
      {:ok, user} = Crossable.Users.create_user(%{discord_user_id: "qopriasdfa"})

      {:ok, habit} =
        Crossable.Habits.create_user_habit(%{
          user_id: user.id,
          active: true,
          habit: "swimming",
          frequency: %Postgrex.Interval{days: 1}
        })

      assert {:ok, habit} =
               Crossable.Habits.get_active_user_habit_by_discord_id(user.discord_user_id)
    end

    test "get the user's single active habit among their other inactive habits" do
      {:ok, user} = Crossable.Users.create_user(%{discord_user_id: "qopriasdfa"})

      {:ok, habit1} =
        Crossable.Habits.create_user_habit(%{
          user_id: user.id,
          active: true,
          habit: "swimming",
          frequency: %Postgrex.Interval{days: 1}
        })

      {:ok, habit2} =
        Crossable.Habits.create_user_habit(%{
          user_id: user.id,
          active: false,
          habit: "dance",
          frequency: %Postgrex.Interval{days: 1}
        })

      assert {:ok, habit1} =
               Crossable.Habits.get_active_user_habit_by_discord_id(user.discord_user_id)
    end
  end
end