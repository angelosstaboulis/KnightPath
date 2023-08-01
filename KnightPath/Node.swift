//
//  Node.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation
import GameplayKit
class Node{
    let x:Int
    let y:Int
    let path:[Node]
    init(x:Int,y:Int,path:[Node]=[]) {
        self.x = x
        self.y = y
        self.path = path
    }
    var algebraicNotation : String{
        get{
            var fullPathNotation = ""
            for cell in path{
                var letters = ""
                letters += ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P"][cell.x]
                letters += "\(cell.y + 1)"
                fullPathNotation += " \(letters) <- "
            }
            return String(fullPathNotation.dropLast(3))
        }
    }
    
}
