//
//  GameBoardTests.m
//  ReversiGame
//
//  Created by EasyinWan on 7/5/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "GameBoard.h"

@interface GameBoardTests : XCTestCase
{
    GameBoard *_board;
}
@end

@implementation GameBoardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _board = [[GameBoard alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)test_setAndGetCellState_setValidCell_cellStateChanged
{
    [_board setCellState:BoardCellStateWhitePiece
               forColumn:4
                  andRow:5];
    BoardCellState state = [_board cellStateAtColumn:4
                                              andRow:5];
    XCTAssertEqual(BoardCellStateWhitePiece, state, @"cell should be white");

}

- (void)test_setCellState_withInvalidCoords_exceptionThrown
{
    
    XCTAssertThrowsSpecificNamed([_board setCellState:BoardCellStateWhitePiece
                                            forColumn:8
                                               andRow:12],
                                 NSException,
                                 NSRangeException,
                                 @"row or column out of bounds");
    
}


@end
