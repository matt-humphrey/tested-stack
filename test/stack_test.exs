defmodule StackTest do
  use ExUnit.Case

  describe "start_link/1" do
    test "with no configuration" do
      Stack.start_link([])
    end
    test "with a default state" do
      Stack.start_link([1, 2, 3])
    end
  end

  describe "push/2" do
    test "an element onto an empty stack" do
      {:ok, pid} = Stack.start_link([])
      assert Stack.push(pid, :element) == [:element]
    end
    test "an element onto a stack with one element" do
      {:ok, pid} = Stack.start_link([])
      Stack.push(pid, 1)
      assert Stack.push(pid, 2) == [2, 1]
    end
    test "an element onto a stack with multiple elements" do
      {:ok, pid} = Stack.start_link([])
      Stack.push(pid, 1)
      Stack.push(pid, 2)
      assert Stack.push(pid, :a) == [:a, 2, 1]
    end
  end

  describe "pop/1" do
    test "an empty stack" do
      {:ok, pid} = Stack.start_link([])
      Stack.pop(pid)
    end
    test "a stack with one element" do
      {:ok, pid} = Stack.start_link([])
      Stack.push(pid, :a)
      assert Stack.pop(pid) == :a
    end
    test "a stack with multiple elements" do
      {:ok, pid} = Stack.start_link([])
      Stack.push(pid, :a)
      Stack.push(pid, :b)
      assert Stack.pop(pid) == :b
    end
  end
end
