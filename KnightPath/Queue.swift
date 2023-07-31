//
//  Queue.swift
//  SwiftBFSExample
//
//  Created by Angelos Staboulis on 31/7/23.
//

import Foundation
class Queue{
    
    var list:[NodeExtended] = []
    
    init(list:[NodeExtended]){
        self.list = list
    }
    
    func push(data:NodeExtended){
        list.append(data)
    }
    func peek() -> NodeExtended {
        guard let topElement = list.first else { fatalError("This queue is empty.") }
        return topElement
    }
    func isEmpty() -> Bool{
        return list.count == 0
    }
    func pop() {
        list.removeFirst()
    }
    func count() -> Int{
        return self.list.count
    }
}
