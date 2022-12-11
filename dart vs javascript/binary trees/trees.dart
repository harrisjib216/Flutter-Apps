class Node {
  int value;
  Node? left;
  Node? right;

  Node(this.value, this.left, this.right);
}

void main() {
  List<Node> nodes = [];

  for (int i = 0; i < 100000; i++) {
    nodes.add(Node(i, null, null));
  }

  final head = nodes[0];

  for (int i = 0; i < 100000; i++) {
    if (i * 2 + 1 < 100000) {
      nodes[i].left = nodes[i * 2 + 1];
    }

    if (i * 2 + 2 < 100000) {
      nodes[i].right = nodes[i * 2 + 2];
    }
  }

  Node? curr = head;
  while (curr != null) {
    curr = curr.right;
  }
}
