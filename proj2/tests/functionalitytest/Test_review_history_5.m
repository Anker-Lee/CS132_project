classdef Test_review_history_5 < matlab.uitest.TestCase
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
        % T3.5
        function test_review_history(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.history);
            testcase.choose(testcase.board.history.ListBox, 3);
            testcase.press(testcase.board.history.review);

            testcase.press(testcase.board.review.next_layout);
            testcase.verifyEqual(string(testcase.board.review.last_layout.Enable), "on");
            for i = 1: 47
                testcase.press(testcase.board.review.next_layout);
            end
            testcase.verifyEqual(string(testcase.board.review.next_layout.Enable), "off");
            pause(2);

            testcase.press(testcase.board.review.last_layout);
            testcase.verifyEqual(string(testcase.board.review.next_layout.Enable), "on");
            for i = 1: 47
                testcase.press(testcase.board.review.last_layout);
            end
            pause(2);
            testcase.verifyEqual(string(testcase.board.review.last_layout.Enable), "off");

            testcase.press(testcase.board.review.home);
            pause(3);
            delete(testcase.board.home);
            clear;
        end
    end
end