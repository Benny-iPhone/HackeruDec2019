import UIKit

class Node {
    var value : Int = 0
    //leftChild will be created when invoked
    lazy var leftChild : Node = Node()
    lazy var rightChild : Node = Node()
    
}

let n = Node()

n.leftChild.leftChild.rightChild
