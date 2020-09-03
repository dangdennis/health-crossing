defmodule Crossing.Avatars.Avatar do
  use Ecto.Schema
  import Ecto.Changeset

  schema "avatars" do
    field :deleted_at, :utc_datetime
    field :user_id, :id
    belongs_to :users, Crossing.Users.User

    timestamps()
  end

  @doc false
  def changeset(avatar, attrs) do
    avatar
    |> cast(attrs, [:deleted_at])
    |> validate_required([])
  end
end
