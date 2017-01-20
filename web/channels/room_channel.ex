defmodule OwletChat.RoomChannel do
  use Phoenix.Channel
  import OwletChat.Auth, only: [logged_in?: 1]

  def join("room:"<>room_id, %{"user_id" => user_id}, socket) do
    if can_read(user_id, room_id) && logged_in?(user_id) do
      send(self, {:load_history, {user_id, room_id}})
      {:ok, socket}
    else
      {:error, 'Not Authorized'}
    end
  end

  def handle_in("new_msg", payload, socket) do
    %{"body" => body, "room_id" => room_id, "user_id" => user_id} = payload
    if (can_write(user_id, room_id)) do
      OwletChat.Message.save(payload)
      broadcast! socket, "new_msg", %{body: body, user_id: user_id}
      {:reply, :ok, socket}
    else
      {:reply, :error, socket}
    end
  end

  def handle_info({:load_history, {user_id, room_id}}, socket) do
    push socket, "msg_history", %{"messages" => OwletChat.Message.history(user_id, room_id)}
    {:noreply, socket}
  end

  def can_write(user_id, room_id) do
    # user_id == room_id
    # or room_id in student_ids_of_teacher(user_id)
    true
  end

  def can_read(user_id, room_id) do
    # can_write(user_id, room_id)
    # or room_id in teacher_id_of_student(user_id)
    true
  end
end
