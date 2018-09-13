//
//  GameTest.swift
//  TicTacToeTests
//
//  Created by David Doswell on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameTests: XCTestCase {
    
    func testGameMakeMarkOnBoard() {
        var game = Game(board: GameBoard(), activePlayer: .o)
        
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (0, 1))
        try! game.makeMark(at: (0, 2))
        XCTAssertEqual(.o, game.board[(0, 0)])
        XCTAssertEqual(.x, game.board[(0, 1)])
        XCTAssertEqual(.o, game.board[(0, 2)])
    }
    
    func testGameRestartWillResetBoard() {
        /*
         Create new game with active player .o
         Place mark at (0, 0) with .o
         Restart the game
         Place mark at (0, 0) with .x
         */
        
        var game = Game(board: GameBoard(), activePlayer: .o)
        
        try! game.makeMark(at: (0, 0))
        XCTAssertEqual(.o, game.board[(0, 0)])
        
        game.restart()
        try! game.makeMark(at: (0, 0))
        
        XCTAssertNotEqual(.o, game.board[(0, 0)])
        XCTAssertEqual(.x, game.board[(0, 0)])
        XCTAssertFalse(game.gameIsOver)
        XCTAssertNil(game.winningPlayer)
    }
    
    func testGameCanHaveWinnerAndBeFinished() {
        var game = Game(board: GameBoard(), activePlayer: .x)
        
        try! game.makeMark(at: (0, 2))
        try! game.makeMark(at: (0, 0))
        try! game.makeMark(at: (1, 2))
        try! game.makeMark(at: (1, 1))
        try! game.makeMark(at: (2, 2))
        
        XCTAssertEqual(game.winningPlayer, .x)
        XCTAssertTrue(game.gameIsOver)
    }
}
