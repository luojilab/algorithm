package com.igetget.myapplication;

import android.os.Bundle;

import androidx.appcompat.app.AppCompatActivity;

import java.util.Arrays;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        List<Node> nodes = Arrays.asList(
                new Node(7),
                new Node(5),
                new Node(2),
                new Node(4)
        );
        Node node = HuffmanTreeBuilder.build(nodes);
        printTree(node);
    }

    /**
     * 打印树结构，显示的格式是node(left,right)
     * <p>
     * System.out
     */
    public static void printTree(Node node) {
        Node left = null;
        Node right = null;
        if (node != null) {
            System.out.print("NoteValue=" + node.getValue() + " ");
            left = node.getLeftChild();
            right = node.getRightChild();
            String leftValue = left != null ? left.getValue() + "" : "empty";
            String rightValue = right != null ? right.getValue() + "" : "empty";
            System.out.println("(" + leftValue + "," + rightValue + ")");
        }
        //left
        if (left != null) {
            printTree(left);
        }
        //right
        if (right != null) {
            printTree(right);
        }
    }
}
