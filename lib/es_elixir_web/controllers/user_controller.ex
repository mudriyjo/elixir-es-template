defmodule EsElixirWeb.UserController do
  use EsElixirWeb, :controller

  def create(conn, %{"name" => name, "user_id" => user_id, "email" => email}) do
    case EsElixir.Commander.dispatch(%EsElixir.Command.CreateUser{user_id: user_id, name: name, email: email}, returning: :aggregate_state) do
      {:ok, aggregate} ->
        conn
        |> put_status(:created)
        |> json(aggregate)
      {:error, error} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: error})
    end
  end
end
