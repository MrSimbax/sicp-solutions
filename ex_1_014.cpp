#include <iostream>
#include <format>

// Generates a DOT file for Graphviz containing the recursion tree

static int node_count = 0;

void make_node(int id, int amount, int n, std::string color = "black", bool bold = false)
{
    std::cout << std::format("node{} [label = \"CC({},{})\", color = \"{}\", style = \"{}\"]",
        id, amount, n, color, bold ? "bold" : "solid") << std::endl;
    node_count += 1;
}

void make_edge(int from, int to)
{
    std::cout << std::format("node{} -> node{}", from, to) << std::endl;
}

int parent(int node)
{
    return node / 2;
}

int left(int node)
{
    return node * 2;
}

int right(int node)
{
    return node * 2 + 1;
}

int first_value(int n)
{
    switch (n)
    {
        case 5: return 50;
        case 4: return 25;
        case 3: return 10;
        case 2: return 5;
        case 1: return 1;
        default: throw std::runtime_error{"bad coin"};
    }
}

int coin_change(int amount, int n = 5, int node = 1)
{
    if (parent(node))
    {
        make_edge(parent(node), node);
    }

    if (amount < 0 or n == 0)
    {
        make_node(node, amount, n, "red", true);
        return 0;
    }

    if (amount == 0)
    {
        make_node(node, amount, n, "green", true);
        return 1;
    }

    if (n == 2)
    {
        make_node(node, amount, n, "magenta", true);
    }
    else if (n == 3)
    {
        make_node(node, amount, n, "blue", true);
    }
    else
    {
        make_node(node, amount, n);
    }

    int x = coin_change(amount, n - 1, left(node));
    int y = coin_change(amount - first_value(n), n, right(node));

    return x + y;
}

int main()
{
    std::cout << "strict digraph coin_change {" << std::endl;
    int cc = coin_change(11, 3);
    std::cout << "}" << std::endl;
    std::cout << "// node_count = " << node_count << std::endl; 
    return 0;
}
