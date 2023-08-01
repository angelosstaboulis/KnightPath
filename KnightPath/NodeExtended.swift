//
//  NodeExtended.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation
class NodeExtended{
    let previousCell: NodeExtended?
    let numberOfMovesMade: Int
    let cell: Node
    var path : [NodeExtended] = []
    init(previousCell cell : NodeExtended?, x xPosition : Int, y yPosition : Int, numberOfMovesMade num : Int,cells celllist: [NodeExtended]) {
        self.previousCell = cell
        self.numberOfMovesMade = num
        self.cell = Node(x: xPosition, y: yPosition)
        self.path = celllist
    }
    func getPath() -> Node{
        var cellVisitedList : [Node] = []
        
        var currentCell : NodeExtended? = self
        
        for _ in 1...numberOfMovesMade + 1{
            cellVisitedList.append(currentCell!.cell)
            currentCell = currentCell!.previousCell
        }
        return  Node(x: 0, y: 0, path: cellVisitedList)
    }

}
