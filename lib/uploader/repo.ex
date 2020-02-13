defmodule Uploader.Repo do
  use Ecto.Repo,
    otp_app: :uploader,
    adapter: Ecto.Adapters.Postgres
end
