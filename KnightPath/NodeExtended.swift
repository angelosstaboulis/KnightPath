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
    
    init(previousCell cell : NodeExtended?, x xPosition : Int, y yPosition : Int, numberOfMovesMade num : Int) {
        self.previousCell = cell
        self.numberOfMovesMade = num
        self.cell = Node(x: xPosition, y: yPosition)
    }
 
    func getPath() -> PathGame{
        var cellVisitedList : [Node] = []
        
        var currentCell : NodeExtended? = self
        
        for _ in 1...numberOfMovesMade + 1{
            
            cellVisitedList.append(currentCell!.cell)
            
            currentCell = currentCell!.previousCell
        }
        
        return PathGame(cells: cellVisitedList)
    }
}
