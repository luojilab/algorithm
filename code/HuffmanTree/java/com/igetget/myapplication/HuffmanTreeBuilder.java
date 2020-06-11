package com.igetget.myapplication;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HuffmanTreeBuilder {

    /**
     * 构造哈夫曼树
     *
     * @param nodes 结点集合
     * @return 构造出来的树的根结点
     */
    public static Node build(List<Node> nodes) {
        nodes = new ArrayList<>(nodes);
        sortList(nodes);
        while (nodes.size() > 1) {
            createAndReplace(nodes);
        }
        return nodes.get(0);
    }

    /**
     * 组合两个权值最小节点，并在节点列表中用它们的父节点替换它们
     *
     * @param nodes 节点集合
     */
    private static void createAndReplace(List<Node> nodes) {
        Node left = nodes.get(0);
        Node right = nodes.get(1);
        Node parent = new Node(left.getValue() + right.getValue());
        parent.setLeftChild(left);
        parent.setRightChild(right);
        nodes.remove(0);
        nodes.remove(0);
        nodes.add(parent);
        sortList(nodes);
    }

    /**
     * 将节点集合由大到小排序
     */
    private static void sortList(List<Node> nodes) {
        Collections.sort(nodes);
    }
}
