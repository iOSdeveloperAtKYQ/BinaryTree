//
//  ViewController.swift
//  BinaryTree
//
//  Created by Mac123 on 2020/7/23.
//  Copyright © 2020 K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - 创建二叉查找树
        let values = [10,20,5]
        var tree: BinaryTree? = BinaryTree.creatBinaryTree(values: values)
        
        //MARK: - 向二叉查找树添加一个节点
        tree = BinaryTree.addTreeNode(binaryTree: &tree, value: 7)
        tree = BinaryTree.addTreeNode(binaryTree: &tree, value: 2)
        tree = BinaryTree.addTreeNode(binaryTree: &tree, value: 12)
        tree = BinaryTree.addTreeNode(binaryTree: &tree, value: 22)
        
        //MARK: - 从二叉查找树中查找一个节点
        tree = BinaryTree.search(binaryTree: &tree, value: 6)
        
        
        //MARK: - 前序遍历
        BinaryTree.firstErgodic(binaryTree: tree) { (node) in
            print(node.value as Any)
        }
        
        //MARK: - 中序遍历
        BinaryTree.middleErgodic(binaryTree: tree) { (node) in
            print(node.value as Any)
        }
        
        //MARK: - 后序遍历
        BinaryTree.lastErgodic(binaryTree: tree) { (node) in
            print(node.value as Any)
        }
        
        //MARK: - 层次遍历
        BinaryTree.levelErgodic(binaryTree: tree) { (node) in
            print(node.value as Any)
        }
        
        //MARK: - 二叉树的深度，深度从0开始
        let depth = BinaryTree.depth(binaryTree: tree)
        print("深度=\(depth)")
        
        //MARK: - 二叉树的宽度
        let width = BinaryTree.width(binaryTree: tree)
        print("宽度=\(width)")
    }


}

