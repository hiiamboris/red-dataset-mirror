----
**TL;DR - the proposal is [at the end](#implementation-options), the rest is introduction.**

Let's construct a graph in Red.

What data is required:
- a set of nodes (vertices); possibly unordered
- nodes are connected with arrows (edges)
- both nodes and arrows can hold a payload

# Naive model

## Naive tree (of arbitrary branching factor) example:

`[ "payload" [arrows] ]`
more expanded:
```
[
  "node payload"
  [
    "arrow payload"
    [
      "node payload"
      [more arrows]
    ]
    "arrow payload"
    [
      "node payload"
      [more arrows]
    ]
  ]
]
```
and so on... `[arrows]` is either empty or contains arrows pointing at descendant nodes.

How do we for example **move a node** from one place to the other?
We need to remove arrows pointing at it (there can be more than one!). Alas, our node has no info on incoming arrows, so we have to traverse the whole tree to do this step up. But how do we know, while traversing, that we're in the same place where a removal is requested? This same node can appear anywhere. Wow, bad luck.

## Okay, let's make this tree **more advanced**. It now has the info on ascending nodes:
```
root: [ 
  arrows-into-root: []      ;) as it's a root node - it has no ascendants
  "root node payload"
  arrows-from-root: [
    root
    "arrow payload"
    node1: [
      arrows-from-root
      "node1 payload"
      [more arrows]
    ]

    root
    "arrow payload"
    node2: [
      arrows-from-root
      "node2 payload"
      [more arrows]
    ]
  ]
]
```

So, now we still want to **move** a node. We check the arrows pointing at it and remove them all as

`forskip arrows 3 [if same? node third arrows [remove/part arrows 3]]`

Now we want to insert this node (branch) somewhere else, into `node-x` as

`repend node-x [node-x "payload" node]`

Oh noes! We forgot something! Our `node` contains `arrows-from-root`. Let's fix it:

`change/only node third node-x`

That was easy, since we moved the node completely. If we wanted to **copy** the node, we would have to append new arrows to the old ones.

But here's a **trick**. We may not know that my node has only one ascendant. Perhaps it's incoming arrows come from different nodes?
Then we'll have to traverse all the arrows and remove selectively.

Now what if we want to **find** a node with a certain **payload**? Uh-oh.. we need to traverse the whole tree:
```
look-in: func [node] [
  set [in-arrows payload out-arrows] node
  unless payload = what-I'm-looking-for [
    foreach [_ _ node] out-arrows [look-in node]       ;) recursive traversal
  ]
]
```

Okay, **scratch that**. It was just to show that simplest things become real ugly real fast.


## Note **shortcomings**:
1. **Exposed internal** structure. Exposed means:
- it's **fixed** - any change in it makes all previous code obsolete and in need of rewrite and bug hunt
- it's hard to work with - a lot of work is required to maintain the **integrity** of this structure
- everyone has to **reinvent** the wheels
- requires **numeric indexing** instead of the more readable, portable and extendable named path accessors (like /in, /out, /value)
2. Very **limited** functionality.
3. Painfully **slow**.

We can **remedy (1)** by providing a context full of functions to work with this structure and abstract from implementation.


**Optimizing lookups** by payload (3).

We can have a `map! of [payload -> [nodes with this payload]]`. And even better:
`map! of [payload -> [ [nodes with this payload] [arrows with this payload] ]]`. This will enable both arrow and node lookup.
Or even better, two **separate maps**, since it's likely we're looking either for a node or for an arrow but not for both.
Or we can use `hash! with [payload [node] payload [node] ...]` and another for arrows. Slower though.
Of course these structures will have to be constantly **kept in sync** with the tree itself.

But here is more...

How would e.g. **`foreach` know** that our node is not a flat list, and how would it know the structure of it? We'll have to have our **own iterator** functions.
Actions on series are not going to abstract the model, so we will also have to have our **own actions**.
**Think** all the boring stuff from **OOP**.

## Let's take another approach.

Starting with operations that a graph **should support**:
- add a `[src "payload" tgt]` arrow (possibly duplicating the same arrow multiple times...)
- list outbound arrows of `src` node: by mask `[src ... ...]`
- list  inbound arrows of `tgt` node: by mask `[... ... tgt]`
- remove a specific `[src "payload" tgt]` arrow only (once or multiple times)
- remove all `[src ... ...]` arrows
- remove all `[... ... tgt]` arrows
- remove all `[node ... ...]` and `[... ... node]` arrows at once - effectively removing the given node from graph
- read or change node's payload
- read or change arrow's payload
- list all nodes by payload
- list all arrows by payload
- list or visit all nodes, unordered, once (like `foreach` on maps)
- list or visit all nodes, ordered, without cycle prevention (e.g. for tree branches)
- list or visit all nodes, ordered, once (when it's known a graph can be cyclic, e.g. reactivity graph)
- reverse an arrow, in place or as a new arrow

Possibly also:
- list arrows by two attributes at once: `[src payload ...]`, `[src ... tgt]`, `[... payload tgt]`
- populate graph with nodes, then connect those with arrows... (unconnected nodes will then be known to the graph)

What should likely be done **separately**, on top of the graph functionality (if required):
- pathfinding algorithms
- select/extract a subgraph, compute inverse graph, or other fancy permutations


Also, we know that a **node** can have many arrows. We want it as a **reference** then, so it's not repeated. An object or a block would do.
An **arrow** on the other hand, can only be mentioned in two nodes, so making it an object/block is **not necessary**.
Moreover, we want to be able to **filter arrows** by their components - be it start node, end node, or payload.

Thus naturally emerges a **`hash!` of arrows**:
```
arrows: hash! [
  src-node "payload" tgt-node
  src-node "payload" tgt-node
  ...
]
```
where each node can be an `object! [value: "payload" out: [outbound arrows] in: [inbound arrows]]`.
We can select & return a sublist of arrows in the same format, filtered by some criteria.
We got **somewhat fast** lookups, although to build a filtered list of arrows (i.e. to get all those with given payload)
we still need to do multiple lookups and build a **new block of them each time**.

**Separate maps** can be added to **speed up** lookups:

`map! ["payload" -> [nodes with this payload]]` - where each node is an object (or block)

`map! ["payload" -> [arrows with this payload]]` - where each arrow is the `arrows` `hash!` `at` given arrow start
This last map can replace the `arrows` `hash!` if we dedicate a separate 3-item block for each arrow.

Note that although the naive tree structure has it's shortcomings, internally it still the same as long as nodes are blocks or objects.
E.g. in this new model, the root node object **mirrors the initial naive design**.

And though, here we can remove `out` and `in` fields from the node and still be able to get that list by parsing the `arrows` `hash!`,
by doing so we will sacrifice the speed at which we obtain a list of nodes's in/outbound arrows, which is likely unwanted.

What we did with this model is simply **compiled a few references** (a hash and 2 maps) for fast and convenient access.

Okay, we're happy with the internal structure now.

## Moving on to interface with other code...

The API may look roughly like this:
- `graph/nodes` - all nodes known - list of objects/blocks
- `graph/arrows` - all arrows known - just returns/copies the `arrows` `hash!`

Filtered (either using a map or constructing result blocks on the fly):
- `graph/arrows/from node` - only outbound arrows of node in format `[node "payload" ...]`
- `graph/arrows/into node` - only inbound arrows of node in format `[... "payload" node]`
- `graph/arrows/only src tgt` - only arrows of `[src ... tgt]` pattern
- `graph/arrows/with-value value` - only arrows of `[... value ...]` pattern
- `graph/nodes/with-value value` - only nodes of `[... value ...]` pattern

Modification:
- `graph/arrows/add src tgt value` - arrow is not an object, can be duplicated
- `graph/arrows/del src tgt value` - deletes first arrow found; can be done multiple times
- `graph/nodes/del node` - removes all arrows of `[node ... ...]` and `[... ... node]` patterns

Since these return lists of known 1- or 3- item format, shallow iteration is simple:
- `foreach node graph/nodes [...]`
- `foreach [src tgt val] graph/arrows [...]`

To put it another way, `graph` object provides **2 functions with refinements** that work on global hash and map structures.
Question of deep iteration remains unsolved so far.

It should also be said that graph functions should **act differently** based on graph type.
Graph can support various **options**:
- allow multiple equal (non-unique) arrows or not?
- allow nodes with the same/equal payload to coexist?
- allow arrows to have payload? (more RAM)
- treat arrows as directional or not?
- how many in- or out-bound arrows a node can have? (to put a limit; or if hundreds of arrows per node - use hashes to store them)
- permit cycles or not?
- permit self-referencing nodes (arrows from a node into itself) or not?
- type of payload (hashable or not) - can affect efficient indexing strategy
- if it's a tree, should it balance itself automatically? using what algorithm?
- what is the optimization target - fast node lookup? fast arrow lookup? removal? addition?

Based on these options, graph can contain **different code** and use different internal **model**.

Using **iteration** as an example:
- DAG nodes may be visited in their linear order
- tree may allow multiple visits to a shared branch, and not care about cycles
- cyclic graph may provide a guarantee that each node is visited only once (with some extra overhead)


## Actions?

How can we apply actions to this graph, and do we need to modify them in R/S or use ports?

Actions seemingly do **not really fit** the **non-linear** and/or unordered data model:
It makes sense to write `put graph node inner-node` to attach an `inner-node`.
Or `remove/key graph node` to remove all inbound arrows pointing at `node`.

But `get`, `append`, `insert`, `remove`, `move`, `change`, `clear` are positional.
They should accept not graph as a whole, but graph at some position, to be of use.

And `pick`, `find`, `select`, `at` - what these should return?

This brings us to a requirement for **self-similarity**: every position in a graph is a graph.
And this brings us to `node!` datatype. But the requirement for it to be a new datatype will be shown later.

## Automatic reflection

If arrow lists are returned as blocks, we need **changes** on those blocks to be **reflected** properly **on the graph**, so that it's **integrity** is ensured.
We can hold the arrows and nodes structures in an object with custom **`on-deep-change*`** function that will synchronously take care of that.
(or can we use `modify` to transfer ownership of those structures to the object, without actually putting them into it?)
We can not use deep-reactors for that, as those can be executed asynchronously and leave the graph in an invalid state.


## Node ID

A remark should be made on **why** an **object or block** is proposed to serve as **node unique identifier**.

Node ID has generally **to be unique** else we won't be able tell nodes apart.
A graph where every node's payload is unique can have the payload as node ID. But this is a big limitation.

But not just it has to be unique at certain point T in time.
It has to be **unique until the program finishes**, otherwise it's ID may remain somewhere,
and if we delete a node, then reassign it's ID to another node,
we'll certainly get an undefined behavior once we access this new node by this ID, thinking it's an old one.
We can produce IDs incrementally as integers, but Red has only 32-bit integers and it's easy to run out of 32-bit space like this.
The only datatype that can hold 48bit or larger integer is `tuple!`, which isn't suitable or convenient for the task.

**Object/blocks provide an easy way out:** they are represented by their memory address.
GC ensures that no references to such node remain when that address is allocated for new data. So, it is always unique.

Hashtables lookups use as keys:
- objects memory address directly
- hash of block address & block index

So it's a **fast O(1) lookup** as long as `find/same` is used.
**Maps could** provide the same kind of lookups, but currently do not allow their keys to be objects or blocks.
This is a point that can be improved, but not a showstopper.


## Now all looks fine, until we consider the RAM requirements.

Here are some empirical stats for Red containers of given length:

| type | length | bytes |
| ---  | ---    | --- |
| vector | 5 items  | \~84 |
| block | 1  items | \~56 |
| block | 3  items | \~88 |
| block | 6  items | \~136 |
| block | 10 items  | \~200 |
| block | huge N | 16*N |
| object | 0-4 words | \~450 |
| object | 5+ words | \~750 |
| hash | 2  items | \~350 |
| hash | 8  items | \~500 |
| hash | huge N | 29*N |
| reactor | 8 items | \~4000 |

So if we were to construct just **1M nodes** (think an AST of a \~1MB file) as objects, without considering their in/out arrow lists or maps or hashtables, **only nodes** will occupy **450MB!**

We can use **blocks** with accessors instead: `[value: [wrapped payload] in: [arrows] out: [arrows]]` - that's \~140 bytes.
We have to wrap payload, to be able to type `node/out` or `node/in` even if payload is an `'in` or `'out` word - that's another 32 => to a total of **172MB** per 1M nodes.

We can shrink our blocks to just 3 items, using **numeric accessors** instead of `/in` `/out` and `/value` - an acceptable **90** bytes per node, but with the ugly interface.
We can provide friendly accessors as functions: `inbound-of node`, `payload-of node`... But this will likely be ugly as well. Plus an unnecessary slowdown (function call overhead) of the most often used operations.


## Let's return to the `node!` datatype. How can it be implemented and it's benefits.

**Observe the commonality** between these data layouts:

- `[source payload target]` - general graph arrow
- `[[inbound arrows] payload [outbound arrows]]` - general bidirectional graph node

- `[previous value next]` - doubly linked list entry

- `[left payload right]` - binary tree node
- `[parent face! [pane]]` - possible View faces tree node

- `[inputs relation outputs]` - one way to model reactivity: where relation is a node
- `[source-relation obj/path target-relation]` - an arrow in this reactivity model
- `[source-relation [obj/path event-stream] target-relation]` - event-stream or actor+message based reactivity arrow

- `[[source relations] obj/path [target relations]]` - another way
- `[input/path relation output/path]` - an arrow in this model

- `[sender message receiver]` - general message

- `[input weight output]` - artificial neuron connection

- `[left-expression op right-expression]` - parse tree (AST) infix operator (one of the exprs = none if it's unary)
- `[function 'func-apply [arguments list]]` - function application

- `[subject predicate object]` - Semantic triple: the core of RDF and associative databases.

- `[precondition command postcondition]` - Hoare's triple.

We can model data flow, electronic cicruits, bloodline tree, whatever... only imagination is the limit.
All these tasks can be represented using this **single building block tiny in size** compared to all Red-level solutions.

---

**2024 update: instead of a teaser here's a realistic node data model**

## Implementation options

As using a hash table for node quering is rather heavy, both in complexity and RAM requirements, and often is not going to be used anyway, I propose that graph itself is **optimized** only for **incremental traversal**. A separate hash table may optionally be built and maintained with the graph data, when filtered queries are needed.

All models below only provide node connectivity and hierarchy.

### Model 1: node has an arbitrary number of in- and out-arrows

Given that Red cell is of fixed size, and we generally want each node and arrow to have a cell-sized payload, there's **no way that node or arrow** themselves **can fit into a cell**. So, like series, objects and functions, they will be split between a cell and outside buffer.

Also, we can't move part of the data from the outside buffer into the value cell, because our 32-bit R/S node references can only uniquely identify the outside buffer, which has no reference to the value cell (and that cell may not even exist, or exist in multiple places).

This means, similarly to objects and series, node will be **accessed by reference** and will **have to be manually copied** when needed.

Since arrows will have a payload, nodes cannot refer directly to other nodes, but only to arrows. So I assume we'll want both `node!` and `edge!` (or `arrow!`) datatypes. Thus, we arrive to the following cell structures:
```
red-node!: red-edge!: alias struct! [
	header   [integer!]
	padding1 [integer!]
	node     [node!]			;) reference to an R/S node which keeps the reference to the outside buffer
	padding2 [integer!]
]
```

With the following outside data each:

For `node!`:
- `data` (a full cell, 128)
- `in-arrows` (a vector of `edge!` references, implicitly contains own length, 32 + series buffer)
- `out-arrows` (a vector of `edge!` references, implicitly contains own length, 32 + series buffer)

For `edge!`:
- `data` (a full cell, 128)
- `source` (a `node!` reference, 32)
- `target` (a `node!` reference, 32)

An arrow's directionality may simply be ignored in unordered graphs. In this case one of the vectors doesn't have to be allocated.

**References** are going to be **32-bit addresses** each. `node!`'s **outside buffer has variable size**, and I suppose we could just internally use current `vector!`s implementation for that for now.

Since not all graphs are concerned with arrows, we may add **conveneince accessors** to the `node!` interface:
- `sources` (follows all `in-arrows` and lists their unique `source` nodes)
- `targets` (follows all `out-arrows` and lists their unique `target` nodes)
- `neighbors` (unique unification of `sources` and `targets`)

For any **tree graph** we can agree to have arrows pointing from the parent into all of its children, then e.g. for View:
- `sources/1` will act as current `/parent` (and could be aliased as `/parent`)
- `targets` will act as current `/pane` (and could be aliased as `/children`)

**Memory** requirements (bits) of this memory model:
- `red-node!`: value cell (128), data cell (128), N node references (Nx32), 2 series buffers (2x160), 2 series nodes (2x32), 1 node for the structure itself (32) = total 672 + Nx32 bits (**84 + Nx4 bytes**)

  Though from the series buffer we only require length and node, so at the cost of more complexity it could probably be reduced down to 2x64, totalling at 480 + Nx32 bits (60 + Nx4 bytes)
  
- `red-edge!`: value cell (128), data cell (128), 2 node references (2x32), 1 node for the structure itself (32) = total 320 bits (**40 bytes**)
- e.g. for 5 nodes and 10 edges that's **860 bytes**


### Model 2: node has an arbitrary number of in- and out-arrows baked into itself

We modify the first model by putting arrows into the node's outside data directly, and instead of 32-bit vectors of arrow references we'll have a vector of 192-bit structures:
```
	data   [cell! value]		;) data payload of the arrow itself
	source [node!]				;) reference to the source graph node
	target [node!]				;) reference to the target graph node
```

In such case we *cannot* have a `red-edge!` structure with the data cell in it (because there's no unique R/S node allocated for it), so **arrows may not have a payload**. We could still declare arrows with no payload as a single cell:
```
red-edge!: alias struct! [
	header  [integer!]
	padding [integer!]
	source  [node!]				;) reference to an R/S node with the reference to the correspondng red-node!'s outside buffer
	target  [node!]				;) ditto
]
```
Such arrow will occupy only a cell, and will always be copied during all operations, which breaks its symmetry with the node.

**Memory** requirements of this model will be:
- `red-node!`: value cell (128), data cell (128), N arrows (Nx192), 2 series buffers (2x160), 2 series nodes (2x32), 1 node for the structure itself (32) = total 672 + Nx192 bits (**84 + Nx24 bytes**)
- `red-edge!`: value cell (128) = total 128 bits (**16 bytes**), but will not be allocated for graphs that do not work with arrows
- e.g. for 5 nodes and 10 edges that's **660 bytes**

I don't think the benefit of avoiding an arrow allocation is worth the drawback of not having a payload on the arrow, but just listing this model for review.


### Model 3: node is a triplet (source, payload, target)

To represent **multiple** incoming or outgoing **edges**, this model uses doubly **linked lists**.
*Double* linkage is required to be able to remove links in the middle of it, and still being able to reconnect the adjacent links together.

For the equivalance between arrow and payload changes, again, all data is held within the outside buffer, and needs an explicit copy before modification:
```
red-node!: alias struct! [
	header   [integer!]
	padding1 [integer!]
	node     [node!]			;) reference to an R/S node which keeps the reference to the outside buffer
	padding2 [integer!]
]
```
Node's outside data is of the following 224-bit layout:
```
	data   [cell! value]		;) cell-sized payload
	type   [integer!]			;) type as a symbol (word) - index in the symbol table
	source [node!]				;) reference to other node's outside data
	target [node!]				;) ditto
```

To describe the hierarchy and discern nodes from edges, left/right relations from source/target (or parent/child) we add a `type` to the model:

- `link` (one to one) type:
  
  When used to model general doubly linked lists (list is a chain of links):
  - `source` links to previous list's item (type `link`), otherwise it's a head node
  - `target` - to next list's item (type `link`), otherwise it's a tail node
  - `data` contains the actual list item
  
  When used to model graph edges:
  - `source` links to the source node (type `nexus`), or empty
  - `target` - to the target node (type `nexus`), or empty
  - `data` in this case contains custom payload attached to the graph edge

- `fork` (one to many) type, used to model tree nodes:
  - `source` links to the parent (type `fork`)
  - `target` - to the first linked list item (node of type `link`) containing child nodes
  - `data` contains custom payload (e.g. a face object)
  
  This first item in the `target` list must link back to the original `fork` node as its `source`, so if it is removed from the list, we can still reconnect the tree with the second list node. Payload in each linked list item contains a single child (as `red-node!`).
  
- `nexus` (many to many) type, used to model general graphs:
  - `source` links to the first linked list item containing inbound nodes of type `link`
  - `target` - same, outbound links
  - `data` contains custom payload
  
  Similarly, source and target lists first items must have the nexus node as their source. For traversal optimization, last lists items may also have nexus node as their target.
  
  **Each `link`** in the linked lists **contains another link** in its `data`. That `link` is the graph's edge: source and target are nexus nodes, payload is custom data.

**Memory** requirement for this model: 
- node of all types: value cell (128), outside data (224), node for the data (32) = total 384 bits (**48 bytes**)
- e.g. for 5 nodes and 10 edges that's **1040 bytes** (because edges are doubled: a node for list link and another for an edge)


### Model 4: node is a quintet with four connections

Four node connections allow to **describe the hierarchy directly** (a 256-bit structure):
```
	data   [cell! value]		;) cell-sized payload
	before [node!]				;) reference to other node's outside data
	after  [node!]				;) ditto
	above  [node!]				;) ditto
	below  [node!]				;) ditto
```

In this model:
- doubly linked list node has:
  - `before` as previous list node
  - `after` as next list node
  - `above` and `below` are often empty
  - `data` as list item (any value)
- tree node has:
  - `above` as parent node
  - `below` as first linked list node with children
  - `before` and `after` are empty
  - `data` as custom value attached to the node (e.g. a face object)

  Reason for this layout (vs putting children into `before` and `after`) is that when we change list's parent, we want to change it once rather than for every item.

- general graph node has:
  - `above` as *last* linked list node with incoming edges
  - `below` as *first* linked list node with outgoing edges
  - `before` and `after` are empty
  - `data` as custom payload

  Reason for this layout is to align it with the tree layout: order goes from `above` node into this and then into `below` node (even though such "hierarchy" may be cyclic). The choice of pointing onto the *last* and *first* edges is to ease forward and backward iteration.

  If graph is not directional, `above` and `below` may refer to the same list.

- general graph edge has:
  - `above` as its source graph node
  - `below` as its target graph node
  - `before` as previous graph edge in the same list (of incoming or outgoing edges)
  - `after` as next graph edge in the same list (of incoming or outgoing edges)
  - `data` as custom payload

  Adjacent edges have either the same `above` (source), or `below` (target). It's a doubly linked list with `above` and `below` nodes attached. A bit of care will be required to ensure that nodes in the same list keep pointing to the same target or from the same source, else they must belong to another list. Or alternatively only the first outgoing node will have an `above` field, and only the last incoming node will have a `below` field.

In other words, **`before` and `after`** connect nodes on the **same level**, while **`above` and `below`** connect nodes in **hierarchical** relationship.

It's possible and desirable to add a flag to this model to distinguish nodes from edges, if we reserve 1 bit in the `data` cell's header for that. This cannot be done in the `red-node!` header, as traversal algorithms will only have references to the outside data of a node, not to its cell.

It's also possible to avoid the need for explicit `copy` of nodes if we copy all data (256 bits) on every write, which may have its benefits and drawbacks.

**Memory** requirement for this model: 
- both node and edge: value cell (128), outside data (256), node for the data (32) = total 416 bits (**52 bytes**)
- e.g. for 5 nodes and 10 edges that's **780 bytes** (though value cell is not always required - one cell per graph is enough as long as it is connected, then it's only 556 bytes)

## Iteration

For an acyclic graph of 4 nodes (A, B, C, D) and 4 edges (arrows):
```
	A → B
	↓   ↓
	C → D
```
iteration order can be defined as (see also [illustrations](https://www.geeksforgeeks.org/difference-between-bfs-and-dfs/?ref=next_article)):
- `below` (depth-first right search) from A: `ABDC` (last D deduplicated); forward tabbing order
- reversed `below` from D: `DCAB` (last A deduplicated); backward tabbing order
- reversed `above` (depth-first left search) from A: `ACDB` (last D deduplicated)
- `above` from D: `DBAC` (last A deduplicated); most useful to reach top in a tree
- `after` (breadth-first right search) from A: `ABCD` (last D deduplicated); order of file system globbing
- reversed `after` from D: `DCBA` (last A deduplicated)
- `before` (breadth-first left search) from A: `ACBD` (last D deduplicated)
- reversed `before` from D: `DBCA` (last A deduplicated)


## Copying

Proposed node implementations allow **linking any** node in the system **to any other** node. There's no structure imposed. However we will have sets of nodes forming **separate graphs as logical structures**, e.g. a linked list, or a tree of faces, or a reaction table.

So we will **want to copy** some sets of nodes that we perceive as logically separated. Copying a linked list will likely be most common. 

However, `copy` of a node is like copy of an object: if we copy a set of nodes, they will **still link to the old** (uncopied) nodes. To create a real copy, we **have to reconnect** newly created nodes with each other, but keep as is links to nodes outside the copied set.

How to achieve this copying behavior conveniently for us?

We could **organize** related nodes into a **`graph!`**, and let `copy` of that graph automatically reconnect all its nodes into the new graph. Under the hood such `graph!` could be no more than a `hash!` set of `node!` values. We `append` nodes to it, then `copy` it. It could even keep its nodes in a single array if that makes sense as an optimization (e.g. for CPU cache locality or RAM defragmentation). 

But it doesn't look like nearly enough reason to invent a new datatype. Just a `clone-graph` **routine** should be enough (or more general **`clone` or `replicate`** - there are sometimes use cases for isolating sets of interlinked Red values, most known being Redbin serialization). Unless we find other uses for a `graph!` and justify its existence? 


## Conclusion

**Advantages** of having node datatype as I see them are:
- tree **structure is separated** from the data and **standardized**, allowing us to write **general-purpose iterators** on it (foreach, map-each, and much more), and freeing relevant words from face or space objects
- **user-provided iterators** could be written to traverse graphs in non-standard ways
- **lower RAM** footprint - circa 50 bytes per node (compared to 450 byte object)
- can support multiple **aliased accessor** names (`/in` = `/above`, `/left` = `/prev` = `/before`...)
- some models retain symmetry between graph node and edge (likely to reduce code complexity)
- possible hashing layer for fast node lookups can be built separately, similar to how `hash!` builds upon a `block!`
- we get a **linked list** automatically
- some **natives** (`next`, `back`, `find`, `select`, `remove`, `take`, all `*each` via iterators) could accept nodes in the lists


