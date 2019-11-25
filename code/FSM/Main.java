package com.company;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

public class Main {


    public static void main(String[] args) {
        Main main = new Main();
        String patStr = "ababaca";
        Map<Character, Map<Integer, Integer>> table = main.createStateTransitionTable(patStr);
        String str = "abababacaba";

        char[] chars = str.toCharArray();
        int position = 0;
        int state = 0;
        for (char c : chars) {

            state = table.get(c).get(state);
            if (state == patStr.length()) {
                main.say("found end in  " + position);
                break;
            }
            position++;
        }

    }


    /**
     * 创建状态转移表
     *
     * @param pat
     * @return
     */
    private Map<Character, Map<Integer, Integer>> createStateTransitionTable(String pat) {
        //创建状态转移表
        char[] pats = pat.toCharArray();
        Set<Character> patChars = new HashSet<>();
        //求出模式串不重复字符集合
        for (char p : pats) {
            patChars.add(p);
        }
        Map<Character, Map<Integer, Integer>> table = new HashMap<>();
        //相当于表格每一列，模式串字符集合的每个字符构成了列
        for (char item : patChars) {
            Map<Integer, Integer> colums = new HashMap<>();
            //表格每一列的不同行，以及对应的状态转移
            for (int i = 0; i < pats.length; i++) {
                //从第一行开始
                int state = findState(pat, item, i);
                colums.put(i, state);
            }
            table.put(item, colums);
        }
        return table;
    }

    /**
     * 获取转移状态
     *
     * @param pat
     * @param patChar
     * @param patCharPositonIndex
     * @return
     */
    private int findState(String pat, char patChar, int patCharPositonIndex) {

        //构造末尾为对应字符的字符串，求出最长前后缀
        StringBuilder finalStrBuilder = new StringBuilder();
        String subStr = pat.substring(0, patCharPositonIndex);
        finalStrBuilder.append(subStr);
        finalStrBuilder.append(patChar);
        String finalStr = finalStrBuilder.toString();
        //情况1，位置，字符相等，状态+1
        if (pat.charAt(patCharPositonIndex) == patChar) {
            return patCharPositonIndex + 1;
        }

        //求最长相同前后缀
        String longestSuffix = null;
        int finalStrLength = finalStr.length();
        for (int subLength = 1; subLength < finalStrLength; subLength++) {
            String headSubStr = finalStr.substring(0, subLength);
            String endSubStr = finalStr.substring(finalStrLength - subLength, finalStrLength);
            if (headSubStr.equals(endSubStr)) {
                longestSuffix = headSubStr;
            }
        }

        if (longestSuffix == null) {
            //情况2，没有相同前后子缀，状态归0
            return 0;
        } else {
            //既是最长缀长度，同时又代表了转移状态
            //情况3，发现相同子缀，设置状态
            return longestSuffix.length();
        }
    }

    private void say(String msg) {
        System.out.println(msg);
    }

}
