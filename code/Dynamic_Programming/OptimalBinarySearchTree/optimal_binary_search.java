import java.util.Random;

public class optimal_binary_search { 
	
	public static void ConstructOptimalBST(int[][] root, int lowerKey,int higherKey,int numberOfKeys){
		int parent = root[lowerKey][higherKey];
		
		if(higherKey == numberOfKeys && lowerKey == 1){
			System.out.println("K"+parent+" is the root.");
		}
		if(lowerKey<=parent-1){
			System.out.println("K"+root[lowerKey][parent-1]+" is the left child of K"+parent );
			ConstructOptimalBST(root, lowerKey, parent-1, numberOfKeys);
		}else{
			System.out.println("D"+ (parent-1) +" is the left child of K"+parent );
		}
		if(higherKey >=parent+1){
			System.out.println("K"+root[parent+1][higherKey]+" is the right child of K"+parent );
			ConstructOptimalBST(root, parent+1, higherKey, numberOfKeys);
		}else{
			System.out.println("D"+ parent +" is the right child of K"+parent );
		}
	}
	
	public static int[][] OptimalBST(int[] p,int q[],int numberOfKeys,int[][] cost){
		int n = numberOfKeys;
		int[][] w = new int[n+1+1][n+1];
		int[][] root = new int[n+1][n+1];
		
		for(int i=0;i<=n;i++){
			cost[i+1][i] = q[i];
		}
		for(int i=0;i<=n;i++){
			w[i+1][i] = q[i];
		}
		
		for(int k=1;k<=n;k++){
			for(int i=1;i<=n-k+1;i++){
				int j = i+k-1;
				cost[i][j] = Integer.MAX_VALUE;
				w[i][j] = w[i][j-1] + p[j] + q[j];
				for(int r=i;r<=j;r++){
					int t = cost[i][r-1] + cost[r+1][j] + w[i][j];
					if(t < cost[i][j]){
						cost[i][j] = t;
						root[i][j] = r;
					}
				}
			}
		}
		return root;
	}
	
	
	public static void main(String[] args) {
		int[] p = new int[]{-1,15,10,5,10,20};
		int[] q = new int[]{5,10,5,5,5,10};
		
		
		int numberOfKeys = 5;
		
		int[][] cost = new int[numberOfKeys+1+1][numberOfKeys+1];
		
		int[][] root = OptimalBST(p, q, numberOfKeys,cost);
		
		System.out.println("A search cost of this optimal BST is " + (double)cost[1][numberOfKeys]/100 + "\n");
		
		ConstructOptimalBST(root, 1, numberOfKeys, numberOfKeys);
		System.out.println();
	}

} 

