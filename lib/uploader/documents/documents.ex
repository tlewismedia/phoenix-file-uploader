defmodule Uploader.Documents do
  require IEx
  import Ecto.Query, warn: false

  alias Uploader.Repo
  alias Uploader.Documents.Upload

  def list_uploads do
    Repo.all(Upload)
  end

  def get_upload!(id) do
    Upload
    |> Repo.get!(id)
  end

  def create_upload_from_plug_upload(%Plug.Upload{
    filename: filename,
    path: tmp_path,
    content_type: content_type
  }) do

    hash =
      File.stream!(tmp_path, [], 2048)
      |> Upload.sha256()

    Repo.transaction fn ->
      with(
        {:ok, %File.Stat{size: size}} <- File.stat(tmp_path),

        {:ok, upload} <-
          %Upload{} |> Upload.changeset(%{
            filename: filename, content_type: content_type,
            hash: hash, size: size })
          |> IO.inspect
          |> Repo.insert(),

        :ok <- File.cp(
            tmp_path ,
            Upload.local_path(upload.id , filename ) |> IO.inspect(label: "PATH -----")
         )

      ) do

        {:ok, upload}

      else

        {:error, reason} -> Repo.rollback(reason)

      end
    end

  end

end
