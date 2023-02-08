defmodule Calculadora do
  use GenServer


  def start_link(), do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def add(num1, num2), do: GenServer.call(__MODULE__, {:+, num1, num2})

  def init(init_arg) do
    IO.puts("GenServer Calculadora iniciando")
    IO.inspect(init_arg)
    {:ok, %{conteo: 0}}
  end

  # def handle_call(request, from, state) do

  # end

  def handle_cast(:reset, _state) do
    IO.puts "se reinicio el conteo en 0"
    {:noreply, %{conteo: 0}}
  end

  def handle_call({:+, num1 , num2}, _from, %{conteo: conteo}) do
    state = %{conteo: conteo + 1}
    IO.inspect(state)
    {:reply, suma(num1, num2), state}
  end

  def handle_call({:-, num1 , num2}, _from, %{conteo: conteo}) do
    state = %{conteo: conteo + 1}
    IO.inspect(state)
    {:reply, resta(num1, num2), state}
  end

  def handle_call({:*, num1 , num2}, _from, state) do
    {:reply, multiplicacion(num1, num2), state}
  end

  def handle_call({:/, num1 , num2}, _from, state) do
    {:reply, division(num1, num2), state}
  end

  def handle_info(:saludo, state) do
    IO.puts("Este es un saludo por parte de la calculadora")
    IO.inspect(state)
    {:noreply, state}
  end

  def handle_info(msg, state) do
    IO.puts "la calculadora ha recibido el mensaje"
    IO.inspect(msg)
    {:noreply, state}
  end



  def suma(num1, num2), do: num1 + num2
  def resta(num1, num2), do: num1 - num2
  def multiplicacion(num1, num2), do: num1 * num2
  def division(num1, num2), do: num1 / num2

end
