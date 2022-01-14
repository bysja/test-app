# TestApp

## Code to create initial commit

```
mix phx.new test_app
cd test_app
mix ecto.create
mix phx.gen.auth Accounts User users
mix deps.get
mix phx.gen.live Tasks Task tasks name completed:boolean user_id:references:users
mix ecto.migrate
```