# Software Diagrams and Visualization

## Student Activities

- Read the documentation for Mermaid
- Read the documentation for PlantUML
- Produce any 3 diagrams from both documentation by adapting the examples.
- Using both PlantUML and Mermaid
    - Create a mindmap of the subject thus far
    - Create a Class diagram of the CLI program you wrote in the previous tutorial
    - Write a program that automates the production of a graph using `fzf` to wrap around Mermaid like so:
        ```python
        letters = []
        graph = MermaidString()
        loop:
            letters.append(input("Enter a letter: ")[0])
            try:
                link = subprocess.run(["fzf"], input="\n".join(letters), shell=True, text=True).stdout
            except:
                link = None
            graph.add_node(letters[-1], link)
        ```

