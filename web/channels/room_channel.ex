defmodule OwletChat.RoomChannel do
  use Phoenix.Channel

  def join("room:"<>room_id, %{"user_id" => user_id}, socket) do
    if can_read(user_id, room_id) do
      {:ok, socket}
    else
      {:error, 'Not Authorized'}
    end
  end

  def handle_in("new_msg", payload, socket) do
    %{"body" => body, "room_id" => room_id, "user_id" => user_id} = payload
    if (can_write(user_id, room_id)) do
      broadcast! socket, "new_msg", %{body: body}
      {:reply, :ok, socket}
    else
      {:reply, :error, socket}
    end
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
