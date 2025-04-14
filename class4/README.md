### Dependencies

- docker
- Elixr & Erlang
- [caddy](https://caddyserver.com/docs/install#static-binaries)
  brew install caddy
  sudo apt install caddy
  choco install caddy

### Agenda

- distributed nodes
- horde
- libcluster
- phoenix live view

### Distributed nodes

To start up distrubuted node we have to set a node name using `-sname/-name`.
Nodes have to have the same cookie value.

#### Exmaple commands:

##### To start a new node:

```
iex --sname node1@localhost
```

and in separate terminal
```
iex --sname node2@localhost
```

##### To connect a node:

run on node2
```
iex(1)> Node.connect(:node1@localhost)
true
```

##### To send a message to different node:

```
# send({name, node}, msg)
iex(1)>  send({PhoenixHello.Receiver, :node1}, "hello")
"hello"
```

##### To register process globally
```
iex(1)> pid=spawn(fn -> receive do msg -> IO.inspect(msg, label: "got msg ###########") end end)
iex(2)> :global.register_name(:hello, pid)
:yes
```


##### To send a message to different node:

```
iex(1)> pid=:global.whereis_name(:hello)
iex(2)> send(pid, "msg from node2")
"hello"
```

##### To list connected nodes:

```
iex(1)> Node.list()
[]
```

##### To print node name:

```
iex(1)> Node.self()
:nonode@nohost
```

##### To get node cookie:

```
iex(1)> Node.get_cookie()
:FNAUFTWDKWYLXSUSHDBV
```

##### Exercise 1

- cd class4/phoenix_hello
- Run two nodes - `:node1` and `:node2`
  - PORT=4005 iex --sname node1@localhost -S mix phx.server
  - PORT=4006 iex --sname node2@localhost -S mix phx.server
- Connect those nodes
- Start `Receiver.start_link()` on node1
- Start `Receiver.start_link()` on node2
- Implement `send_msg` function in `phoenix_hello/receiver.ex` file
- Run test `PhoenixHello.Receiver.send_msg("hello")` on both nodes
- explain results

##### Exercise 2

- Run two nodes - `:node1` and `:node2`
- Connect those nodes
- Start `Receiver.start_link()` on node1
- Start `Receiver.start_link()` on node2
- Implement `send_msg_to_all_nodes` function in `phoenix_hello/receiver.ex` file
- explain results

##### Exercise 3

- Register Receiver Genserver [globally](https://hexdocs.pm/elixir/1.18.2/GenServer.html#module-name-registration)
- Run two nodes - `:node1` and `:node2`
- Connect those nodes
- fix functions send_msg & send_msg_to_all_nodes
    - hint: use :global.whereis_name
- Start `Receiver.start_link()` on node1
- Start `Receiver.start_link()` on node2
- Run `send_msg` `send_msg_to_all_nodes`
- explain results


##### Exercise 4

- Run three nodes - `:node1`, `:node2` & `:node3`
    - iex --sname node1@localhost
    - iex --sname node2@localhost
    - iex --sname node3@localhost
- Connect node1 to node2
    - check Node.list()
- Connect node3 to node1
    - check Node.list()
- explain results


##### Exercise 5

- Run two nodes with cookies
    - iex --cookie 111 --sname node1@localhost
    - iex --cookie 222 node2@localhost
- Connect node1 to node2
    - check Node.list()
- explain results

### Horde

[Horde](https://github.com/derekkraan/horde) is a library providing distributed registry and supervisor.
Horde ensures that processes will keep working when nodes or connection fail.

##### Exercise 6

- kill nodes
- uncomment Horde.Registry & PhoenixHello.ManagerSupervisor in `phoenix_hello/application.ex`
- Run two nodes - `:node1` and `:node2`
- Connect those nodes
- start 1000 random processes `PhoenixHello.ManagerSupervisor.start_random(1000)`
  - what happend & why?
- kill one node
  - what happend & why?
- start killed node and connect to cluster
  - what happend & why?

### Libcluster

Automatically forming clusters of Erlang nodes

##### Exercise 7

- setup libcluster configuration in `phoenix_hello/application.ex`
- run two nodes and check if there are connected automatically `Node.list()`

### Loadbalancing & Horde

##### Exercise 8


- install [caddy](https://caddyserver.com/docs/install#static-binaries)
- run caddy `caddy run` in `phoenix_hello` dir
- start 2 nodes on ports 4005, 4006
- open https://localhost:8080/hello
- caddy problem: localhost:4005/hello   /   localhost:4006/hello
- spawn managers
- kill node which your user uses
- check if list of managers disappeard
- fix it using distributed supervisor in `PhoenixHello.ManagerSupervisor` module

### minimum number of nodes?

### LiveView

##### Exercise 9

- Add CounterLive to Router moduel
- Implement CounterLive by adding a button which increases counter by one and diplay a counter value


#### [Last task](https://docs.google.com/forms/d/e/1FAIpQLScC7H7rlYuvaNd-xmnVzba7Kw3Sn56e5Ang0fCXspaUKG6EGw/viewform?usp=sharing)

#### Email

klemens.lukaszczyk@erlang-solutions.com

#### References

- [PhoenixLiveView](https://pragprog.com/titles/liveview/programming-phoenix-liveview/) book
- [Elixir in Action 3rd Edition](https://www.amazon.com/Elixir-Action-Third-Sa%C5%A1a-Juric-ebook/dp/B0CVHVWP9M?ref_=ast_author_dp)


