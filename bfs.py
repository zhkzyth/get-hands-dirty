# graph is in adjacent list representation
graph = {
        '1': ['2', '3', '4'],
        '2': ['5', '6'],
        '5': ['9', '10'],
        '4': ['7', '8'],
        '7': ['11', '12']
        }

def bfs(graph, start, end):
    # maintain a queue of paths
    queue = []
    # push the first path into the queue
    queue.append([start])
    while queue:
        # get the first path from the queue
        path = queue.pop(0)
        # get the last node from the path
        node = path[-1]
        # path found
        if node == end:
            return path
        # enumerate all adjacent nodes, construct a new path and push it into the queue
        for adjacent in graph.get(node, []):
            new_path = list(path)
            new_path.append(adjacent)
            queue.append(new_path)

print bfs(graph, '1', '11')


# a testing graph
graph={
    1: [2],
    2:[1,3,4,5],
    3:[2,6],
    4:[2,12],
    5:[2,7],
    6:[3,7,11,12],
    7:[5,6,10],
    10:[7,11,12],
    11:[10],
    12:[4,6]}

#draw a graph:
import pygraphviz as pgv

def graph_as_png(graph=graph):
    G = pgv.AGraph()
    for nodes in graph:
        G.add_node(nodes)
    for nodes in graph:
        for ch_nodes in graph[nodes]:
            G.add_edge(nodes, ch_nodes)
    G.layout(prog='dot')
    G.draw('graph-pic.png')
