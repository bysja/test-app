defmodule TestApp.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :name, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:name, :completed, :user_id])
    |> validate_required([:name, :completed, :user_id])
  end
end
