//
//  Node.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation
import GameplayKit
class Node:GKGraphNode{
    let x:Int
    let y:Int
    let dist:Int
    init(x:Int,y:Int,dist:Int=0) {
        self.x = x
        self.y = y
        self.dist = dist
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func addConnections(nodesArray: [GKGraphNode], bidirectional: Bool) {
        super.addConnections(to: nodesArray, bidirectional: bidirectional)
    }
    public func removeConnections(nodesArray: [GKGraphNode], bidirectional: Bool) {
        super.removeConnections(to: nodesArray, bidirectional: bidirectional)
    }
}
