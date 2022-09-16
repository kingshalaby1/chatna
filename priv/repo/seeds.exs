# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chatna.Repo.insert!(%Chatna.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Chatna.Accounts.register_user(%{email: "ahmed@ahmed.com", password: "ahmed", username: "ahmed"})
Chatna.Accounts.register_user(%{email: "ali@ali.com", password: "ali123", username: "ali"})
Chatna.Accounts.register_user(%{email: "hassan@hassan.com", password: "hassan", username: "hassan"})



Chatna.Repo.insert!(%Chatna.Messaging.Room{title: "ali", owner_id: 1})
Chatna.Repo.insert!(%Chatna.Messaging.Room{title: "hassan", owner_id: 1})


Chatna.Repo.insert!(%Chatna.Messaging.Subscription{user_id: 1, room_id: 1})
Chatna.Repo.insert!(%Chatna.Messaging.Subscription{user_id: 2, room_id: 1})
Chatna.Repo.insert!(%Chatna.Messaging.Subscription{user_id: 1, room_id: 2})
Chatna.Repo.insert!(%Chatna.Messaging.Subscription{user_id: 3, room_id: 2})
