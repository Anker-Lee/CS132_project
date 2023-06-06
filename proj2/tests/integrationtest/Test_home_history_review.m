classdef Test_home_history_review < matlab.uitest.TestCase
    properties
        App;
        board;
    end
    methods(TestMethodSetup)
        function launchAPP(testcase)
            testcase.board = Board;
        end
    end

    methods(Test)
        function test_history_review(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.history);
            testcase.choose(testcase.board.history.ListBox, 1);
            testcase.press(testcase.board.history.review);

            testcase.press(testcase.board.review.next_layout);
            testcase.verifyEqual(string(testcase.board.review.last_layout.Enable), "on");
            testcase.press(testcase.board.review.next_layout);
            testcase.press(testcase.board.review.next_layout);
            testcase.press(testcase.board.review.next_layout);
            testcase.press(testcase.board.review.next_layout);
            testcase.press(testcase.board.review.next_layout);
            testcase.press(testcase.board.review.next_layout);
            testcase.verifyEqual(string(testcase.board.review.next_layout.Enable), "off");

            testcase.press(testcase.board.review.last_layout);
            testcase.verifyEqual(string(testcase.board.review.next_layout.Enable), "on");
            testcase.press(testcase.board.review.last_layout);
            testcase.press(testcase.board.review.last_layout);
            testcase.press(testcase.board.review.last_layout);
            testcase.press(testcase.board.review.last_layout);
            testcase.press(testcase.board.review.last_layout);
            testcase.press(testcase.board.review.last_layout);
            testcase.verifyEqual(string(testcase.board.review.last_layout.Enable), "off");

            testcase.press(testcase.board.review.home);
            testcase.addTeardown(@delete, testcase.board.home);
        end
    end
end