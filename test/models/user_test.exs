defmodule Pxblog.UserTest do
  use Pxblog.ModelCase

  alias Pxblog.User

  @valid_attrs %{email: "[email protected]", password: "test123", password_confirmation: "test123", username: "test user"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "password_digest value gets set to a hash" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert Comeonin.Bcrypt.checkpw(@valid_attrs.password, Ecto.Changeset.get_change(changeset, :password_digest))
  end

  test "password_digest value does not get set if password is nil" do
    changeset = User.changeset(%User{}, %{email: "[email protected]", password: nil, password_confirmation: nil, username: "test"})
    refute Ecto.Changeset.get_change(changeset, :password_digest)
  end
end
