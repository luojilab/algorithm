## 红黑树

> 红黑树，一种二叉查找树，但在每个结点上增加一个存储位表示结点的颜色，可以是Red或Black。
通过对任何一条从根到叶子的路径上各个结点着色方式的限制，红黑树确保没有一条路径会比其他路径长出俩倍，因而是接近平衡的，红黑树，作为一棵二叉查找树，满足二叉查找树的一般性质，任意一个节点所包含的键值，大于等于左孩子的键值，小于等于右孩子的键值。

### 红黑树的特性
1、 每个节点或者是黑色，或者是红色。         
2、根节点是黑色。     
3、每个叶子节点是黑色。 [注意：这里叶子节点，是指为空的叶子节点！]         
4、 如果一个节点是红色的，则它的子节点必须是黑色的。         
5、从一个节点到该节点的子孙节点的所有路径上包含相同数目的黑节点。             

红黑树示意图如下：
![Tree](../../../res/Tree/RBTree/rbTree_demo.jpg)


### 红黑树的基本实现

>红黑树的基本操作是添加、删除和旋转。在对红黑树进行添加或删除后，会用到旋转方法。为什么呢？道理很简单，添加或删除红黑树中的节点之后，红黑树就发生了变化，可能不满足红黑树的5条性质，也就不再是一颗红黑树了，而是一颗普通的树。而通过旋转，可以使这颗树重新成为红黑树。简单点说，旋转的目的是让树保持红黑树的特性。
旋转包括两种：左旋 和 右旋。下面分别对旋转(左旋和右旋)、添加、删除进行介绍。

### 红黑树的基本操作(一) 左旋和右旋

>仔细观察下面"左旋"和"右旋"的示意图。我们能清晰的发现，它们是对称的。无论是左旋还是右旋，被旋转的树，在旋转前是二叉查找树，并且旋转之后仍然是一颗二叉查找树。

![Tree](../../../res/Tree/RBTree/left_right.jpg)

对x进行左旋，意味着，将“x的右孩子”设为“x的父亲节点”；即，将 x变成了一个左节点(x成了为y的左孩子)！。 因此，左旋中的“左”，意味着“被旋转的节点将变成一个左节点”。

对y进行右旋，意味着，将“y的左孩子”设为“y的父亲节点”；即，将 y变成了一个右节点(y成了为x的右孩子)！ 因此，右旋中的“右”，意味着“被旋转的节点将变成一个右节点”。

### 红黑树的基本操作(二) 插入

将一个节点插入到红黑树中，需要执行哪些步骤呢？首先，将红黑树当作一颗二叉查找树，将节点插入；然后，将节点着色为红色；最后，通过旋转和重新着色等方法来修正该树，使之重新成为一颗红黑树。详细描述如下：

#### 第一步: 将红黑树当作一颗二叉查找树，将节点插入。
#### 第二步：将插入的节点着色为"红色"
#### 第三步: 通过一系列的旋转或着色等操作，使之重新成为一颗红黑树

### 红黑数插入的几种情况

1、被插入的节点是根节点。        
处理方法：直接把此节点涂为黑色。  
2、 被插入的节点的父节点是黑色。        
处理方法：什么也不需要做。节点被插入后，仍然是红黑树。         
3、被插入的节点的父节点是红色。                 
处理方法：那么，该情况与红黑树的“特性(5)”相冲突。这种情况下，被插入节点是一定存在非空祖父节点的；进一步的讲，被插入节点也一定存在叔叔节点(即使叔叔节点为空，我们也视之为存在，空节点本身就是黑色节点)。理解这点之后，我们依据"叔叔节点的情况"，将这种情况进一步划分为3种情况(Case)。 

#### Case 1    当前节点的父节点是红色，且当前节点的祖父节点的另一个子节点（叔叔节点）也是红色。    
(01) 将“父节点”设为黑色。  
(02) 将“叔叔节点”设为黑色。  
(03) 将“祖父节点”设为“红色”。  
(04) 将“祖父节点”设为“当前节点”(红色节点)；即，之后继续对“当前节点”进行操作。  

示意图：
![Tree](../../../res/Tree/RBTree/insert_case1.jpg)

#### Case 2    当前节点的父节点是红色，叔叔节点是黑色，且当前节点是其父节点的右孩子    
(01) 将“父节点”作为“新的当前节点”。          
(02) 以“新的当前节点”为支点进行左旋。            

示意图：
![Tree](../../../res/Tree/RBTree/insert_case2.jpg)

#### Case 3    当前节点的父节点是红色，叔叔节点是黑色，且当前节点是其父节点的左孩子    
(01) 将“父节点”设为“黑色”。              
(02) 将“祖父节点”设为“红色”。             
(03) 以“祖父节点”为支点进行右旋。          

示意图：
![Tree](../../../res/Tree/RBTree/insert_case3.jpg)

#### 再来看一下下面的这组图

![Tree](../../../res/Tree/RBTree/case2_left.png)                              ![Tree](../../../res/Tree/RBTree/case2_right.png)   

![Tree](../../../res/Tree/RBTree/case3_left.png)                              ![Tree](../../../res/Tree/RBTree/case3_right.png)   

这里需要特别注意的是图1和图2都是属于Case2的情况，图3和图4都是属于Case3的情况

