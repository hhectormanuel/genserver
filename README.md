# AgentSuperv

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `agent_superv` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:agent_superv, "~> 0.1.0"}
  ]
end
```

## How to enable Supervisor
```elixir

childs [
  %{start: {Calculadora, :start_link, [[]]}, id: Calculadora},
  %{start: {Stack, :start_link, [[]]}, id: Stack}
]
Supervisor.start_link(childs, strategy: :one_for_one)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/agent_superv](https://hexdocs.pm/agent_superv).

