# Software Diagrams and Visualization


## Mindmaps

```mermaid
mindmap
Root
    A
      B
      C
```

See Also:

- https://github.com/blitzarx1/egui_graphs
- https://pyvis.readthedocs.io/en/latest/
- [Vis-Network.js](https://github.com/visjs/vis-network)

## Use Case Diagrams

##

## Visualizing use case diagrams


```mermaid
sequenceDiagram
    actor Alice
    actor Bob
    Alice->>Bob: Hi Bob
    Bob->>Alice: Hi Alice
```
```mermaid
flowchart TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
```

```mermaid

flowchart TD
    A[Start] --> B{Is it?}
    B -->|Yes| C[OK]
    C --> D[Rethink]
    D --> B
    B ---->|No| E[End]
```

```mermaid
graph LR
A[Member] -- Borrow Book --> B(( ))
A -- Return Book --> C(( ))
A -- Pay Fine --> D(( ))
E[Librarian] -- Add Book --> F(( ))
E -- Borrow Book --> B
E -- Return Book --> C
E -- Pay Fine --> D
```






## Class Diagrams

## Entity Relationships and Domain Modelling

## Sequence Diagrams

## Flowchart Diagrams
