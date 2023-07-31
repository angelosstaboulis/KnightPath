//
//  PathGame.swift
//  KnightPath
//
//  Created by Angelos Staboulis on 1/8/23.
//

import Foundation
class PathGame{
    let path : [Node]
    var algebraicNotation : String{
        get{
            var fullPathNotation = ""
            
            for cell in path{
                var move = ""
                move += ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"][cell.x]
                move += "\(cell.y + 1)"
                
                fullPathNotation += " \(move) <- "
            }
            return String(fullPathNotation.dropLast(3))
        }
    }
    
    init(cells celllist: [Node]) {
        self.path = celllist
    }
}
