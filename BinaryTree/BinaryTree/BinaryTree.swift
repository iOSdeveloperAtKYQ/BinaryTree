//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Mac123 on 2020/7/23.
//  Copyright © 2020 K. All rights reserved.
//

import UIKit

class BinaryTree: NSObject {
    var value: Int?
    var leftNode: BinaryTree?
    var rightNode: BinaryTree?
    
    /// 创建二叉查找树
    /// - Parameter values: 值
    /// - Returns: 二叉查找树
    class func creatBinaryTree(values: Array<Int>) -> BinaryTree {
        var binaryTree: BinaryTree?
        for value in values {
            binaryTree = self.addTreeNode(binaryTree: &binaryTree, value: value)
        }
        return binaryTree!
    }
    
    /// 向二叉查找树添加一个节点
    /// - Parameters:
    ///   - binaryTree: 二叉查找树
    ///   - value: 值
    /// - Returns: 二叉查找树
    class func addTreeNode(binaryTree: inout BinaryTree?, value: Int) -> BinaryTree {
        if binaryTree == nil  {
            //根节点不存在
            binaryTree = BinaryTree.init()
            binaryTree?.value = value
        }else if value < binaryTree!.value! {
            //值比节点的值小，插入左子树
            binaryTree?.leftNode = self.addTreeNode(binaryTree: &binaryTree!.leftNode, value: value)
        }else {
            //值比节点的值大，插入右子树
            binaryTree?.rightNode = self.addTreeNode(binaryTree: &binaryTree!.rightNode, value: value)
        }
        return binaryTree!
    }
    
    /// 从二叉查找树中查找一个节点
    /// - Parameters:
    ///   - binaryTree: 二叉查找树
    ///   - value: 值
    /// - Returns: 二叉查找树
    class func search(binaryTree: inout BinaryTree?, value: Int) -> BinaryTree? {
        if binaryTree == nil {
            return nil
        }else {
            if value < binaryTree!.value! {
                //要查找的值小于节点的值，从左子树继续查找
                return search(binaryTree: &binaryTree!.leftNode, value: value)
            }else if value > binaryTree!.value! {
                //要查找的值大于节点的值，从右子树继续查找
                return search(binaryTree: &binaryTree!.rightNode, value: value)
            }else {
                //要查找的值等于节点的值
                return binaryTree
            }
        }
        
    }
    
    /// 前序遍历二叉树
    /// - Parameters:
    ///   - binaryTree: 二叉树
    ///   - handler: 返回遍历的节点
    class func firstErgodic(binaryTree: BinaryTree?, handler: (_ node: BinaryTree) -> ()) {
        if binaryTree != nil {
            handler(binaryTree!)
            self.firstErgodic(binaryTree: binaryTree?.leftNode, handler: handler)
            self.firstErgodic(binaryTree: binaryTree?.rightNode, handler: handler)
        }
    }
    
    /// 中序遍历二叉树
    /// - Parameters:
    ///   - binaryTree: 二叉树
    ///   - handler: 返回遍历的节点
    class func middleErgodic(binaryTree: BinaryTree?, handler: (_ node: BinaryTree) -> ()) {
        if binaryTree != nil {
            self.middleErgodic(binaryTree: binaryTree?.leftNode, handler: handler)
            handler(binaryTree!)
            self.middleErgodic(binaryTree: binaryTree?.rightNode, handler: handler)
        }
    }
    
    /// 后序遍历二叉树
    /// - Parameters:
    ///   - binaryTree: 二叉树
    ///   - handler: 返回遍历的节点
    class func lastErgodic(binaryTree: BinaryTree?, handler: (_ node: BinaryTree) -> ()) {
        if binaryTree != nil {
            self.lastErgodic(binaryTree: binaryTree?.leftNode, handler: handler)
            self.lastErgodic(binaryTree: binaryTree?.rightNode, handler: handler)
            handler(binaryTree!)
        }
    }
    
    
    /// 层次遍历（广度优先）
    /// - Parameters:
    ///   - binaryTree: 二叉树
    ///   - handler: 返回遍历的节点
    class func levelErgodic(binaryTree: BinaryTree?, handler: (_ node: BinaryTree) -> ()) {
        if binaryTree == nil {
            return
        }
        
        var array = Array<BinaryTree>.init()
        array.append(binaryTree!)
        while array.count > 0 {
            let node = array.first
            handler(node!)
            //删除第一个节点
            array.removeFirst()
            if node?.leftNode != nil {
                array.append(node!.leftNode!)
            }
            
            if node?.rightNode != nil {
                array.append(node!.rightNode!)
            }
        }
    }
    
    
    /// 二叉树的深度，深度从0开始
    /// - Parameter binaryTree: 二叉树
    /// - Returns: 二叉树的深度
    class func depth(binaryTree: BinaryTree?) -> Int {
        if binaryTree == nil {
            return 0
        }
        
        if binaryTree?.leftNode == nil && binaryTree?.rightNode == nil {
            //如果节点的左右节点都为空，深度为0
            return 0
        }
        
        //左子树深度
        let leftDepth = self.depth(binaryTree: binaryTree?.leftNode)
        //右子树深度
        let rightDepth = self.depth(binaryTree: binaryTree?.rightNode)
        
        //二叉树的深度=max（左子树的深度，右子树的深度）+ 1
        return max(leftDepth, rightDepth) + 1
    }
    
    /// 二叉树的宽度
    /// - Parameter binaryTree: 二叉树
    /// - Returns: 二叉树的宽度
    class func width(binaryTree: BinaryTree?) -> Int {
        if binaryTree == nil {
            return 0
        }
        
        var array = Array<BinaryTree>.init()
        array.append(binaryTree!)
        //最大宽度，初始化为1（因为已经有根节点）
        var maxWidth = 1
        //当前宽度
        var curWidth = 1
        
        while array.count > 0 {
            curWidth = array.count
            for _ in 0 ..< curWidth {
                let node = array.first
                array.removeFirst()
                if node?.leftNode != nil {
                    array.append(node!.leftNode!)
                }
                
                if node?.rightNode != nil {
                    array.append(node!.rightNode!)
                }
            }
            maxWidth = max(maxWidth, array.count)
        }
        
        return maxWidth
    }
    
}
