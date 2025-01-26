defmodule EsElixir.Events.UserCreated do
  @derive Jason.Encoder
  defstruct [:user_id, :name, :email]
end
