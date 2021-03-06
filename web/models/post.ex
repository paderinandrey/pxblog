defmodule Pxblog.Post do
  use Pxblog.Web, :model

  schema "posts" do
    belongs_to :user, Pxblog.User

    field :title, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body])
    |> validate_required([:title, :body])
  end
end
