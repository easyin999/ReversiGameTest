//
//  ReversiBoardTests.m
//  ReversiGame
//
//  Created by EasyinWan on 7/5/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "ReversiBoard.h"

@interface ReversiBoardTests : XCTestCase
{
    ReversiBoard *_board;
}
@end

@implementation ReversiBoardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _board = [[ReversiBoard alloc] init];

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

- (void)test_makeMove_inPreGameState_nothingHappens
{
    [_board setToPreGameState];
    
    XCTAssertNoThrowSpecificNamed([_board makeMoveToColumn:3
                                                   andRow:3],
                                   NSException,
                                   NSRangeException,
                                   @"make a move in pre game state should do nothing");
}

- (void)test_clearBoard_wholeBoardEmpty
{
    [_board setToPreGameState];
    
    [_board setCellState:BoardCellStateWhitePiece
               forColumn:1
                  andRow:2];
    [_board setCellState:BoardCellStateBlackPiece
               forColumn:2
                  andRow:3];
    
    [_board clearBoard];
    
    XCTAssertTrue([_board cellStateAtColumn:1
                                     andRow:2] == BoardCellStateEmpty && [_board cellStateAtColumn:2 andRow:3] == BoardCellStateEmpty,
                  @"the whole board is not empty");
}

- (void)test_checkCount
{
    [_board setToPreGameState];
    
    [_board setCellState:BoardCellStateWhitePiece
               forColumn:1
                  andRow:2];
    [_board setCellState:BoardCellStateBlackPiece
               forColumn:2
                  andRow:3];
    
    XCTAssertTrue([_board countCellsWithState:BoardCellStateBlackPiece] == 1,
                  @"the count of black is error");
    XCTAssertTrue([_board countCellsWithState:BoardCellStateWhitePiece] == 1,
                  @"the count of white is error");
    XCTAssertTrue([_board countCellsWithState:BoardCellStateEmpty] == 62,
                  @"the count of empty is error");
}

@end
