//
//  GameViewModel.swift
//  QueensPuzzle
//
//  Created by Gheorghe Stegaru on 11/26/25.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    
    let size: Int
    
    init(size: Int) {
        self.size = size
    }
        
    func reset() {}
}
