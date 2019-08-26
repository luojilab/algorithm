#include<iostream>
using namespace std;

//定义B树的节点结构
class BTreeNode
{
    int *keys;  //存储key的数组
    int t;      //允许存储的最多key数目，即阶数
    BTreeNode **C; //存储孩子数组指针
    int n;     //存储当前key的数目
    bool leaf; //判断此节点是否为叶子节点
    
public:
    
    BTreeNode(int _t, bool _leaf);   // 构造函数
    
    //遍历树
    void traverse();
    
    //查找键值为k的节点，若查找失败返回空
    BTreeNode *search(int k);
    
    //查找键值为k的索引位置
    int findKey(int k);
    
    //插入
    void insertNonFull(int k);
    
    //分裂
    void splitChild(int i, BTreeNode *y);
    
    //删除键值为k的数据
    void remove(int k);
    
    //删除叶子节点
    void removeFromLeaf(int idx);
    
    //删除非叶子节点
    void removeFromNonLeaf(int idx);
    
    //获取前驱节点
    int getPred(int idx);
    
    //获取后继节点
    int getSucc(int idx);
    
    //填充节点
    void fill(int idx);
    
    //向父节点借用key
    void borrowFromPrev(int idx);
    
    // 从C[idx+1]-th节点借用一个key，并将其放在C[idx]第th节点中
    void borrowFromNext(int idx);
    
    //节点合并
    void merge(int idx);
    
    friend class BTree;
};

//定义树结构
class BTree
{
    BTreeNode *root; //根节点指针
    int t;
public:
    
    // 构造函数
    BTree(int _t)
    {
        root = NULL;
        t = _t;
    }
    
    //遍历
    void traverse()
    {
        if (root != NULL) root->traverse();
    }
    //查找
    BTreeNode* search(int k)
    {
        return (root == NULL)? NULL : root->search(k);
    }
    //插入
    void insert(int k);
    
    //删除
    void remove(int k);
    
};

//构造函数
BTreeNode::BTreeNode(int t1, bool leaf1)
{
    //定义树的阶
    t = t1;
    leaf = leaf1;
    
    //根据树的阶数，分配数据空间
    keys = new int[2*t-1];
    C = new BTreeNode *[2*t];
    //当前key数目为0
    n = 0;
}

//查找键值为key的节点
int BTreeNode::findKey(int k)
{
    int idx=0;
    while (idx < n && keys[idx] < k)
        ++idx;
    return idx;
}

//删除键值为k节点
void BTreeNode::remove(int k)
{
    //首先执行查找过程
    int idx = findKey(k);
    
    //查找到节点
    if (idx < n && keys[idx] == k)
    {
        if (leaf)//如果是叶子节点，调用删除叶子节点的方法
            removeFromLeaf(idx);
        
        else //如果不是叶子节点，则调用非叶子节点的删除方法
            removeFromNonLeaf(idx);
    }
    else
    {
        
        //如果查找结束位置为叶子节点，则查找失败
        if (leaf)
        {
            cout << "待删除的key =  "<< k <<"不存在\n";
            return;
        }
        
        //标记此节点，如果此节点位于
        bool flag = ( (idx==n)? true : false );
        
        //如果该键存在的子节点的t键更少，则填充该子节点
        if (C[idx]->n < t)
            fill(idx);
        
        //如果最后一个子节点已经合并，那么它必须与前一个子节点合并，
        //因此我们对(idx-1)第1个子节点进行递归。否则，我们递归到第(idx)个子节点上
        if (flag && idx > n)
            C[idx-1]->remove(k);
        else
            C[idx]->remove(k);
    }
    return;
}

//删除叶子节点
void BTreeNode::removeFromLeaf (int idx)
{
    
    //将idx-th之后的所有键向后移动一个位置
    for (int i=idx+1; i<n; ++i)
        keys[i-1] = keys[i];
    
    //减少key的数目
    n--;
    
    return;
}

//删除非叶子节点
void BTreeNode::removeFromNonLeaf(int idx)
{
    
    int k = keys[idx];
    
    //如果k (C[idx])之前的子元素至少有t个键，那么在位于C[idx]的子树中找到k的前驱节点
    //用前驱代替k。在递归删除前驱节点
    if (C[idx]->n >= t)
    {
        int pred = getPred(idx);
        keys[idx] = pred;
        C[idx]->remove(pred);
    }
    
    //如果子C[idx]的键值数目小于t，则检查C[idx+1]。如果C[idx+1]中至少有t个键，则查找k的后继节点
    //使用后继节点替换k，递归删除后继节点
    else if  (C[idx+1]->n >= t)
    {
        int succ = getSucc(idx);
        keys[idx] = succ;
        C[idx+1]->remove(succ);
    }
    
    // 如果C[idx]和C[idx+1]键值数目均少于t，则合并k和C[idx+1]至C[idx]
    // 合并后C[idx]包含2t-1个key，删除C[idx+1]，然后在C[idx]中递归删除后继节点
    else
    {
        merge(idx);
        C[idx]->remove(k);
    }
    return;
}

//获取前驱节点
int BTreeNode::getPred(int idx)
{
    //一直向最右子树移动，直到到达叶子节点
    BTreeNode *cur=C[idx];
    while (!cur->leaf)
        cur = cur->C[cur->n];
    
    //返回前驱节点
    return cur->keys[cur->n-1];
}
//获取后继节点
int BTreeNode::getSucc(int idx)
{
    
    //一直向最左的子树移动，直至到达叶子节点
    BTreeNode *cur = C[idx+1];
    while (!cur->leaf)
        cur = cur->C[0];
    
    //返回后继节点
    return cur->keys[0];
}

//一个用来填充子C[idx]的函数，它的键值小于t-1
void BTreeNode::fill(int idx)
{
    
    //如果前一个子节点(C[idx-1])具有多于t-1的键，则从该子节点借用一个键
    if (idx!=0 && C[idx-1]->n>=t)
        borrowFromPrev(idx);
    
    //如果下一个子节点(C[idx+1])的键数大于t-1，则从该子节点借用一个键
    else if (idx!=n && C[idx+1]->n>=t)
        borrowFromNext(idx);
    
    //如果C[idx]是最后一个子元素，则将它与前一个子元素合并，否则将它与下一个子元素合并
    else
    {
        if (idx != n)
            merge(idx);
        else
            merge(idx-1);
    }
    return;
}

//从前一个子节点(C[idx-1])借用一个键
void BTreeNode::borrowFromPrev(int idx)
{
    
    BTreeNode *child=C[idx];
    BTreeNode *sibling=C[idx-1];
    
    //C[idx-1]中的最后一个键向上到达父键，并将父键[idx-1]作为C[idx]中的第一个键插入。
    //将C[idx]中的所有键向前移动一步
    for (int i=child->n-1; i>=0; --i)
        child->keys[i+1] = child->keys[i];
    
    //如果C[idx]不是叶子节点，则将其所有子指针向前移动一步
    if (!child->leaf)
    {
        for(int i=child->n; i>=0; --i)
            child->C[i+1] = child->C[i];
    }
    
    //将子节点的第一个键设置为当前节点的键[idx-1]
    child->keys[0] = keys[idx-1];
    
    //将兄弟节点的最后一个孩子移动为C[idx]的第一个孩子
    if (!leaf)
        child->C[0] = sibling->C[sibling->n];
    
    //将键从同级键移到父级键，这会减少同级键的数量
    keys[idx-1] = sibling->keys[sibling->n-1];
    
    child->n += 1;
    sibling->n -= 1;
    
    return;
}

//从后继节点借用一个键
void BTreeNode::borrowFromNext(int idx)
{
    
    BTreeNode *child=C[idx];
    BTreeNode *sibling=C[idx+1];
    
    //键[idx]作为C[idx]中的最后一个键插入
    child->keys[(child->n)] = keys[idx];
    
    //将兄弟节点的第一个子元素作为最后一个子元素插入到C[idx]中
    if (!(child->leaf))
        child->C[(child->n)+1] = sibling->C[0];
    
    //将兄弟节点中的第一个键插入至[idx]
    keys[idx] = sibling->keys[0];
    
    //将兄弟节点中的所有键向后移动一步
    for (int i=1; i<sibling->n; ++i)
        sibling->keys[i-1] = sibling->keys[i];
    
    //将子指针向后移动一步
    if (!sibling->leaf)
    {
        for(int i=1; i<=sibling->n; ++i)
            sibling->C[i-1] = sibling->C[i];
    }
    
    child->n += 1;
    sibling->n -= 1;
    
    return;
}

//合并
void BTreeNode::merge(int idx)
{
    BTreeNode *child = C[idx];
    BTreeNode *sibling = C[idx+1];
    
    //从当前节点中取出出一个key，插入到C[idx]的(t-1)位置
    child->keys[t-1] = keys[idx];
    
    //将key从C[idx+1]复制到最后的C[idx]
    for (int i=0; i<sibling->n; ++i)
        child->keys[i+t] = sibling->keys[i];
    
    //将孩子指针从C[idx+1]复制到C[idx]
    if (!child->leaf)
    {
        for(int i=0; i<=sibling->n; ++i)
            child->C[i+t] = sibling->C[i];
    }
    
    //将当前节点中的所有键在idx之后移动一步，以填补将键[idx]移动到C[idx]所造成的空白。
    for (i = idx+1; i<n; ++i)
        keys[i-1] = keys[i];
    
    //将子指针移动到当前节点(idx+1)的后面
    for (i=idx+2; i<=n; ++i)
        C[i-1] = C[i];
    
    // 更新数据值
    child->n += sibling->n+1;
    n--;
    
    //删除兄弟节点
    delete(sibling);
    return;
}

//插入
void BTree::insert(int k)
{
    //树为空
    if (root == NULL)
    {
        //直接作为根节点插入
        root = new BTreeNode(t, true);
        root->keys[0] = k;
        root->n = 1;
    }
    else //树不为空
    {
        //判断树是否已满
        if (root->n == 2*t-1)
        {
            //树已满则重新创建根节点
            BTreeNode *s = new BTreeNode(t, false);
            
            //将原树根节点作为新树子节点
            s->C[0] = root;
            
            //分裂子节点
            s->splitChild(0, root);
            
            // 新的根节点有两个孩子
            int i = 0;
            if (s->keys[0] < k)
                i++;
            s->C[i]->insertNonFull(k);
            
            //改变根节点
            root = s;
        }
        else  //树不为空，插入k
            root->insertNonFull(k);
    }
}

//插入k
void BTreeNode::insertNonFull(int k)
{
    int i = n-1;
    
    // 插入位置为叶子节点
    if (leaf == true)
    {
        //查找要插入的新键的位置，将所有较大的键移动到前面的一个位置
        while (i >= 0 && keys[i] > k)
        {
            keys[i+1] = keys[i];
            i--;
        }
        
        //插入数据
        keys[i+1] = k;
        n = n+1;//更新key的数目
    }
    else //插入位置部位叶子节点
    {
        // 查找插入位置
        while (i >= 0 && keys[i] > k)
            i--;
        
        // 插入位置的节点是否已满
        if (C[i+1]->n == 2*t-1)
        {
            //如果已满，则执行分裂
            splitChild(i+1, C[i+1]);
            
            //分裂后在决定那个孩子插入此key
            if (keys[i+1] < k)
                i++;
        }
        //递归调用插入k
        C[i+1]->insertNonFull(k);
    }
}

//子节点分裂
void BTreeNode::splitChild(int i, BTreeNode *y)
{
    //创建新的父节点
    BTreeNode *z = new BTreeNode(y->t, y->leaf);
    //新节点的key数目为t-1
    z->n = t - 1;
    
    //将y中的后(t-1)key复制到z
    for (int j = 0; j < t-1; j++)
        z->keys[j] = y->keys[j+t];
    
    // Copy the last t children of y to z
    if (y->leaf == false)
    {
        for (j = 0; j < t; j++)
            z->C[j] = y->C[j+t];
    }
    
    //减少y中键的数量
    y->n = t - 1;
    
    //创建新子节点的空间
    for ( j = n; j >= i+1; j--)
        C[j+1] = C[j];
    
    // 将新子节点链接到此节点
    C[i+1] = z;
    
    //重新查找key位置
    for ( j = n-1; j >= i; j--)
        keys[j+1] = keys[j];
    
    // 将y的中间键值复制到此节点
    keys[i] = y->keys[t-1];
    
    // 增加节点数目
    n = n + 1;
}

//遍历树
void BTreeNode::traverse()
{
    
    int i;
    for (i = 0; i < n; i++)
    {
        if (leaf == false)
            C[i]->traverse();
        cout << " " << keys[i];
    }
    if (leaf == false)
        C[i]->traverse();
}

//查找
BTreeNode *BTreeNode::search(int k)
{
    // 找到第一个大于等于k的键
    int i = 0;
    while (i < n && k > keys[i])
        i++;
    
    // 查找成功
    if (keys[i] == k)
        return this;
    
    // 到达叶子节点，查找失败
    if (leaf == true)
        return NULL;
    
    // 递归
    return C[i]->search(k);
}

//删除
void BTree::remove(int k)
{
    if (!root)
    {
        cout << "The tree is empty\n";
        return;
    }
    
    root->remove(k);
    
    if (root->n==0)
    {
        BTreeNode *tmp = root;
        if (root->leaf)
            root = NULL;
        else
            root = root->C[0];
        
        //释放节点空间
        delete tmp;
    }
    return;
}

//测试程序
int main()
{
    BTree t(3); //创建阶为4的B树，最多允许有3个key
    
    t.insert(1);
    t.insert(3);
    t.insert(7);
    t.insert(10);
    t.insert(11);
    t.insert(13);
    t.insert(14);
    t.insert(17);
    t.insert(18);
    t.insert(16);
    t.insert(19);
    t.insert(24);
    t.insert(25);
    t.insert(29);
    t.insert(21);
    t.insert(4);
    t.insert(5);
    t.insert(20);
    t.insert(22);
    t.insert(2);
    t.insert(17);
    t.insert(12);
    t.insert(6);
    
    cout << "Traversal of tree constructed is\n";
    t.traverse();
    cout << endl;
    
    t.remove(6);
    cout << "Traversal of tree after removing 6\n";
    t.traverse();
    cout << endl;
    
    t.remove(13);
    cout << "Traversal of tree after removing 13\n";
    t.traverse();
    cout << endl;
    
    t.remove(7);
    cout << "Traversal of tree after removing 7\n";
    t.traverse();
    cout << endl;
    
    t.remove(4);
    cout << "Traversal of tree after removing 4\n";
    t.traverse();
    cout << endl;
    
    t.remove(2);
    cout << "Traversal of tree after removing 2\n";
    t.traverse();
    cout << endl;
    
    t.remove(16);
    cout << "Traversal of tree after removing 16\n";
    t.traverse();
    cout << endl;
    
    return 0;
}
