package com.example.mergesort;

import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.RecursiveTask;

public class FibonacciComputation extends RecursiveTask<Integer> {

    private final int number;

    public FibonacciComputation(int number) {
        this.number = number;
    }

    @Override
    public Integer compute() {
        if (number <= 1) {
            return 1;
        }
        //f(n-1)
        FibonacciComputation f1 = new FibonacciComputation(number - 1);
        //f(n-2)
        FibonacciComputation f2 = new FibonacciComputation(number - 2);
        invokeAll(f1, f2);
        return f1.getRawResult() + f2.getRawResult();
    }
    public static int fibonacciSum(int length) {
        int poolSize = Runtime.getRuntime().availableProcessors();
        ForkJoinPool pool = new ForkJoinPool(poolSize);
        return pool.invoke(new FibonacciComputation(length));
    }
}