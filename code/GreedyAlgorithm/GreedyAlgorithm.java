package GreedyAlgorithm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.PriorityQueue;
import java.util.Queue;

public class GreedyAlgorithm {

    private static int N = 100;
    private static int[] resutl = new int[N];

    private static ArrayList<Cow> cowsList = new ArrayList<>();
    private static Queue<Stall> priStallQue = new PriorityQueue<>();

    public static class Cow implements Comparable<Cow> {
        int id;
        int begin;
        int end;

        public Cow(int id, int beg, int en) {
            this.id = id;
            begin = beg;
            end = en;
        }

        //开始时间升序排序
        public int compareTo(Cow obj) {
            if (this.begin > obj.begin) {
                return 1;
            } else if (this.begin < obj.begin) {
                return -1;
            } else {
                return 0;
            }
        }

    }

    public static class Stall implements Comparable<Stall> {
        int index;
        int end;

        public Stall() {
        }

        public Stall(int index, int end) {
            this.index = index;
            this.end = end;
        }

        public int compareTo(Stall obj) {
            if (this.end > obj.end) {
                return 1;
            } else if (this.end < obj.end) {
                return -1;
            } else {
                return 0;
            }
        }
    }


    public static void main(String[] args) {
        cowsList.add(new Cow(1, 1, 10));
        cowsList.add(new Cow(2, 2, 4));
        cowsList.add(new Cow(3, 3, 6));
        cowsList.add(new Cow(4, 5, 8));
        cowsList.add(new Cow(5, 4, 7));
        Collections.sort(cowsList);

        for (int i = 0; i < cowsList.size(); i++) {
            GreedyOperaterCow(i);
        }
        System.out.println("min = " + priStallQue.size());
        for (int i = 1; i <= cowsList.size(); i++) {
            System.out.println(i + "号奶牛栏编号为" + resutl[i]);
        }
    }

    private static void GreedyOperaterCow(int index) {
        Stall stall = new Stall();
        boolean isNeedNewStall;
        if (index == 0) {
            isNeedNewStall = true;
        } else {
            //通过牛的区间终点和牛栏的最后产奶时间比较,确定是否需要新建牛栏
            isNeedNewStall = cowsList.get(index).begin <= priStallQue.peek().end;
        }

        if (isNeedNewStall) {
            //新增一个牛栏 ,牛栏编号为现有牛栏数加1
            stall.index = priStallQue.size() + 1;
        } else {
            //不需要新增牛栏,队列首牛栏可以放下当前奶牛,牛栏编号为队列首元素的编号,取出重新修改
            stall.index = priStallQue.poll().index;
        }
        //确定牛栏后,牛栏的最后产奶时间即为当前奶牛的产奶区间B点
        stall.end = cowsList.get(index).end;
        priStallQue.add(stall);
        //当前奶牛的所在牛栏,就是当前牛栏
        resutl[cowsList.get(index).id] = stall.index;
    }
}
