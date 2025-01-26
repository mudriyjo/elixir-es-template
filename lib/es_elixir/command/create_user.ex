defmodule EsElixir.Command.CreateUser do
  @enforce_keys [:user_id, :name, :email]
  defstruct [:user_id, :name, :email]
end
