//
//  Game.swift
//  TicTacToe
//
//  Created by David Doswell on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

struct Game {
    init(board: GameBoard,
         activePlayer: GameBoard.Mark,
         winningPlayer: GameBoard.Mark? = nil,
         gameIsOver: Bool = false) {
        self.board = board
        self.activePlayer = activePlayer
        self.winningPlayer = winningPlayer
        self.gameIsOver = gameIsOver
    }
    
    mutating func restart() {
        board = GameBoard()
        activePlayer = .x
        gameIsOver = false
        winningPlayer = nil
    }
    
    mutating func makeMark(at coordinate: Coordinate) throws {
        do {
            try board.place(mark: activePlayer, on: coordinate)
            
            if game(board: board, isWonBy: activePlayer) {
                winningPlayer = activePlayer
                gameIsOver = true
            } else if board.isFull {
                gameIsOver = true
            }
            
            if activePlayer == .x {
                self.activePlayer = .o
            } else {
                self.activePlayer = .x
            }
        } catch {
            NSLog("Illegal move")
        }
    }
    
    private(set) var board: GameBoard
    private(set) var activePlayer: GameBoard.Mark
    private(set) var winningPlayer: GameBoard.Mark?
    private(set) var gameIsOver: Bool
}
