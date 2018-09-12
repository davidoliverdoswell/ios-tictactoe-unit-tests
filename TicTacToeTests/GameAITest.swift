//
//  GameAITest.swift
//  TicTacToeTests
//
//  Created by David Doswell on 9/12/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITest: XCTestCase {
    
    
    var board: GameBoard!
    
    override func setUp() {
        board = GameBoard()
    }
    
    func testWinCheckingVertical0() {
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .x, on: (0,2))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (1,1))

        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))

    }
    
    func testWinCheckingVertical1() {
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .x, on: (0,1))
        try! board.place(mark: .x, on: (1,0))
        try! board.place(mark: .x, on: (1,1))
        try! board.place(mark: .x, on: (1,2))
        
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
        
    }
    
    func testWinCheckingHorizontal0(){
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .x, on: (0, 2))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        XCTAssertTrue(game(board: board, isWonBy: .x))
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }
    func testWinCheckingHorizontal1(){
        try! board.place(mark: .x, on: (0, 0))
        try! board.place(mark: .x, on: (0, 1))
        try! board.place(mark: .o, on: (1, 0))
        try! board.place(mark: .o, on: (1, 1))
        try! board.place(mark: .o, on: (1, 2))
        XCTAssertTrue(game(board: board, isWonBy: .o))
        XCTAssertFalse(game(board: board, isWonBy: .x))
    }
}
