defmodule OwletChat.Auth do
  def logged_in_users do
    HTTPotion.get(Application.get_env(:owlet_chat, OwletChat.Auth)[:firebase_url]).body
    |> Poison.Parser.parse
    |> elem(1)
    |> Enum.reject(fn{user_id, state} -> !is_map(state) || !state["online"] end)
    |> Enum.reduce([], fn(tuple, acc) -> (acc ++ [elem(tuple, 0)]) end)
  end

  def logged_in?(user_id) do
    Enum.member?(logged_in_users, user_id)
  end
end
