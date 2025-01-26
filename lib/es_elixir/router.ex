defmodule EsElixir.Router do
  use Commanded.Commands.Router

  dispatch EsElixir.Command.CreateUser,
    to: EsElixir.Aggregate.User,
    identity: :user_id
end
