class Node {
  constructor(value, left, right) {
    this.value = value;
    this.left = left;
    this.right = right;
  };
};

let nodes = [];

for (let i = 0; i < 10000; i++) {
  nodes.push(new Node(i));
};

const head = nodes[0];

for (let i = 0; i < 20000; i++) {
  if (i * 2 + 1 < 20000) {
    nodes[i].left = nodes[i * 2 + 1];
  }

  if (i * 2 + 2 < 20000) {
    nodes[i].right = nodes[i * 2 + 2];
  }
};

let curr = head;
while (curr) {
  curr = curr.right;
}