defmodule TestApp.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestApp.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        completed: true,
        name: "some name"
      })
      |> TestApp.Tasks.create_task()

    task
  end
end
