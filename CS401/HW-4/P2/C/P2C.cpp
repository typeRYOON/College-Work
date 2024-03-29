// g++ -std=c++23 -O2 -Wall P2C.cpp -o P2C.exe
#include <unordered_map>
#include <algorithm>
#include <iostream>
#include <cstdint>
#include <vector>

struct TreeNode
{
    TreeNode(int32_t w) : weight(w) {}
    std::vector<TreeNode*> children;
    int32_t weight;
};

void setIncludeExclude(
    std::unordered_map<TreeNode*, int32_t>& include,
    std::unordered_map<TreeNode*, int32_t>& exclude,
    TreeNode* node)
{   // Base cases:
    include[node] = node->weight;
    exclude[node] = 0;

    // Dynamically create node's include/exclude values:
    for (TreeNode* child : node->children)
    {   // Get children values first:
        setIncludeExclude(include, exclude, child);  

        // include = exclude layer below it
        include[node] += exclude[child];
        // exclude = max(include[c], exclude[c]) (either or)
        exclude[node] += std::max(include[child], exclude[child]);
    }
}

void construct(
    std::unordered_map<TreeNode*, int32_t>& include,
    std::unordered_map<TreeNode*, int32_t>& exclude,
    std::vector<TreeNode*>& independentSet,
    TreeNode* node)
{
    if (include[node] >= exclude[node]) {
        independentSet.push_back(node);
    } 
    for (TreeNode* child : node->children) {
        construct(include, exclude, independentSet, child);
    }
}


std::vector<TreeNode*> ProblemTwoC(TreeNode* root)
{
    std::unordered_map<TreeNode*, int32_t> include, exclude;
    
    // Dynamically get the include and exclude values:
    setIncludeExclude(include, exclude, root);

    // Construct maximum weight independent set:
    std::vector<TreeNode*> independentSet;
    construct(include, exclude, independentSet, root);

    return independentSet;
}
int main()
{
    TreeNode* root  = new TreeNode(1111);
    TreeNode* node1 = new TreeNode(-10);
    TreeNode* node2 = new TreeNode(1535);
    TreeNode* node3 = new TreeNode(69);
    TreeNode* node4 = new TreeNode(420);
    
    root->children  = {node1, node2};
    node1->children = {node3, node4};

    std::vector<TreeNode*> result = ProblemTwoC(root);
    int32_t count = 0;
    std::cout << "Nodes in the maximum weight independent set:" << std::endl;
    for (TreeNode* node : result) {
        std::cout << node->weight << " ";
        count += node->weight;
    }
    std::cout << "\nMax weight: " << count << '\n';
    return 0;
}