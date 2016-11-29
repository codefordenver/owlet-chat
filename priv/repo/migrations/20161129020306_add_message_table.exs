defmodule OwletChat.Repo.Migrations.AddMessageTable do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body,    :string
      add :room_id, :string
      add :user_id, :string
      timestamps
    end
  end
end
