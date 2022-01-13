defmodule TestAppWeb.TaskLive.Index do
  use TestAppWeb, :live_view

  alias TestApp.Tasks
  alias TestApp.Tasks.Task

  @impl true
  def mount(_params, session, socket) do
    socket = assign_current_user(socket, session)

    {:ok, assign(socket, :tasks, list_tasks(socket.assigns.current_user.id))}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Task")
    |> assign(:task, Tasks.get_task!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Task")
    |> assign(:task, %Task{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Tasks")
    |> assign(:task, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = Tasks.get_task!(id)
    {:ok, _} = Tasks.delete_task(task)

    {:noreply, assign(socket, :tasks, list_tasks(socket.assigns.current_user.id))}
  end

  defp list_tasks(user_id) do
    Tasks.list_tasks(user_id)
  end
end
