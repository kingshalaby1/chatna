defmodule Chatna.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :owner_id, references(:users, on_delete: :nothing)
      add :title, :string

      timestamps()
    end

    create index(:rooms, [:title])
  end
end
