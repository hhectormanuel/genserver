defmodule Stack do
  use GenServer


  def start_link(), do: GenServer.start_link(Stack, [], name: __MODULE__)

  def push(value), do: GenServer.call(__MODULE__, {:push, value})
  def pop(), do: GenServer.call(__MODULE__, {:pop})
  def top(), do: GenServer.call(__MODULE__, {:top})
  def empty?(), do: GenServer.call(__MODULE__, {:empty})

  def state(), do: GenServer.call(__MODULE__, {:state})

  def init(_init_arg) do
    IO.puts("The stack has been created")
    {:ok, []}
  end

  def handle_call({:push, value}, _from, state) do
    state = [value | state]
    {:reply, :push, state}
  end

  def handle_call({:pop}, _from, state) do
    state = state -- [hd(state)]
    {:reply, :pop, state}
  end

  def handle_call({:empty}, _from, state) do
    case length(state) do
      0 -> {:reply, true, state}
      _num -> {:reply, false, state}
    end
  end

  def handle_call({:top}, _from, state) do
    {:reply, hd(state), state}
  end

  def handle_call({:state}, _from, state) do
    IO.inspect(state)
    {:reply, state, state}
  end

end
