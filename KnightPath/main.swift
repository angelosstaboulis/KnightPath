//
//  main.swift
//  KnightPath
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation

let nodeSrc = Node(x: 1, y: 1)
let nodeDest = Node(x: 4, y: 3)
let game = ChessGame()
let paths = game.findAllPaths()
for path in paths{
    debugPrint("path=",path.algebraicNotation)
}
