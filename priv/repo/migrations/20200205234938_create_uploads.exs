defmodule Uploader.Repo.Migrations.CreateUploads do
  use Ecto.Migration

  def change do
    create table(:uploads) do
      add :filename, :string
      add :size, :integer
      add :content_type, :string
      add :hash, :string, size: 64

      timestamps()
    end

  end
end
