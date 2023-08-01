//
//  ChessGame.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation
class ChessGame{
    var row : [Int] = [-2, -2, -2, -2, -2, -2, 2, 2]
    var col : [Int] = [1, 1, 1, 1, 1, 1, 1, 1]
    func getValidMoves(knight:Node) -> [Node] {
        var validMovesList : [Node] = []
        
        let curX = knight.x
        
        let curY = knight.y
        
        for item in 0..<row.count{
            validMovesList.append(Node(x: curX + col[item], y: curY + row[item]))
        }
        
        
        return validMovesList
    }
    func createFirstRuleCriteria(currentCell:NodeExtended,targetCell:Node)->Bool{
        return (currentCell.numberOfMovesMade < 3) ? true : false
    }
    func createSecondRuleCriteria(currentCell:NodeExtended,targetCell:Node)->Bool{
        return ((currentCell.cell.x == targetCell.x) && (currentCell.cell.y == targetCell.y)) ? true : false
    }
    func makeBFS1(src:Node,targetCell:Node) -> [NodeExtended]{
        var newCells : [NodeExtended] = []
        let startingCell = NodeExtended(previousCell: nil,
                                        x: src.x,
                                        y: src.y,
                                        numberOfMovesMade: 0)

        var knight = Node(x: src.x, y: src.y)


        let data = Queue(list: [])
        data.push(data: startingCell)


        while !data.isEmpty(){
            let topcell = data.peek()

            if !createFirstRuleCriteria(currentCell: topcell, targetCell: targetCell){
                if createSecondRuleCriteria(currentCell: topcell, targetCell: targetCell){
                    newCells.append(topcell)
                }
                    data.pop()
                    continue
            }
            knight = topcell.cell

            let validMoves = getValidMoves(knight: knight)

            var cells : [NodeExtended] = []
            for cell in validMoves {
                cells.append(NodeExtended(previousCell: topcell, x: cell.x, y: cell.y, numberOfMovesMade: topcell.numberOfMovesMade + 1 ))
            }

            data.pop()

            for cell in cells {
                data.push(data: cell)
            }
        }
        return newCells
  }
    func makeBFS(src:Node,dest:Node) -> [NodeExtended]{
        var newCells : [NodeExtended] = []
        let startingCell = NodeExtended(previousCell: nil,
                                                x: src.x,
                                                y: src.y,
                                                numberOfMovesMade: 0)
        let queue = Queue(list: [])
        queue.push(data: startingCell)
        while !queue.isEmpty(){
            let node = queue.peek()
            if !createFirstRuleCriteria(currentCell: node, targetCell:dest) {
                if createSecondRuleCriteria(currentCell: node, targetCell: dest){
                    newCells.append(node)
                }
                
                queue.pop()
                continue
            }
            var arrayMoves : [NodeExtended] = []
            for cell in getValidMoves(knight: node.cell) {
                arrayMoves.append(NodeExtended(previousCell: node, x: cell.x, y: cell.y, numberOfMovesMade: node.numberOfMovesMade + 1 ))
            }

            queue.pop()

            for cell in arrayMoves {
                queue.push(data: cell)
            }
            
        }
       
        return newCells
    }
    func findAllPaths() -> [PathGame]{
        var pathFoundList : [PathGame] = []
        let knight = Node(x: 1, y: 1)
        let targetCell = Node(x: 4, y: 3)
        let cellList = makeBFS(src: knight, dest: targetCell)
        for curMetaCell in cellList{
            pathFoundList.append(curMetaCell.getPath())
        }
        
        return pathFoundList
    }
}
