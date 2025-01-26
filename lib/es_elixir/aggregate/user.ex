defmodule EsElixir.Aggregate.User do
  defstruct [:user_id, :name, :email]

  def execute(%__MODULE__{}, %EsElixir.Command.CreateUser{} = command) do
    %EsElixir.Events.UserCreated{
      user_id: command.user_id,
      name: command.name,
      email: command.email
    }
  end

  def apply(%__MODULE__{} = user, %EsElixir.Events.UserCreated{} = event) do
    %__MODULE__{ user |
      user_id: event.user_id,
      name: event.name,
      email: event.email
    }
  end
end
