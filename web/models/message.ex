defmodule OwletChat.Message do
  use Ecto.Schema
  import Ecto.Query, only: [from: 2]

  schema "messages" do
    field :body,    :string
    field :room_id, :string
    field :user_id, :string
    timestamps()
  end

  def save(%{"body" => body, "room_id" => room_id, "user_id" => user_id}) do
    struct = %OwletChat.Message{
      body: body,
      room_id: room_id,
      user_id: user_id
    }
    OwletChat.Repo.insert! struct
  end

  def history(user_id, room_id) do
    query = from m in "messages",
            where: m.room_id == ^room_id,
            select: [:user_id, :room_id, :body, :inserted_at]

    OwletChat.Repo.all(query)
    |> Enum.map(fn(m) -> %{
        "body": m.body,
        "user_id": m.user_id,
        "time": m.inserted_at |> Ecto.DateTime.load |> elem(1)
       } end )
  end
end
