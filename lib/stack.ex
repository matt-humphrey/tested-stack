defmodule Stack do
  @moduledoc """
  Documentation for `Stack`.
  """
  use GenServer

  # Client functions

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts)
  end

  def push(pid, element) do
    GenServer.call(pid, {:push, element})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server callback functions

  def init(init_arg) do
    {:ok, init_arg}
  end

  def handle_call({:push, element}, _from, state) do
    new_state = [element | state]
    {:reply, new_state, new_state}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

end
