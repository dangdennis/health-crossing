defmodule Crossable.Tokenomics.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :deleted_at, :utc_datetime
    field :amount, :float
    belongs_to :wallets, Crossable.Tokenomics.Wallet

    timestamps()
  end

  @doc false
  def changeset(txn, attrs) do
    txn
    |> cast(attrs, [:wallet_id, :amount, :deleted_at])
    |> validate_required([:wallet_id, :amount])
  end
end