classdef TestReview < matlab.uitest.TestCase
    properties
        App;
        board;
    end
    % T1.4
    methods(TestMethodSetup)
        function launchAPP(testcase)
            testcase.board = Board;
        end
    end

    methods(Test)
        % T1.4.1
        function test_last_step(testcase)
            testcase.App = game_review(testcase.board, "records/20230520_150703.xlsx");
            testcase.press(testcase.App.next_layout);
            testcase.verifyEqual(string(testcase.App.last_layout.Enable), "on");
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.verifyEqual(string(testcase.App.next_layout.Enable), "off");

            testcase.press(testcase.App.last_layout);
            testcase.verifyEqual(string(testcase.App.next_layout.Enable), "on");
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.verifyEqual(string(testcase.App.last_layout.Enable), "off");
            delete(testcase.App);
        end

        % T1.4.2
        function test_next_step(testcase)
            testcase.App = game_review(testcase.board, "records/20230520_150703.xlsx");
            testcase.press(testcase.App.next_layout);
            testcase.verifyEqual(string(testcase.App.last_layout.Enable), "on");
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.press(testcase.App.next_layout);
            testcase.verifyEqual(string(testcase.App.next_layout.Enable), "off");

            testcase.press(testcase.App.last_layout);
            testcase.verifyEqual(string(testcase.App.next_layout.Enable), "on");
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.press(testcase.App.last_layout);
            testcase.verifyEqual(string(testcase.App.last_layout.Enable), "off");
            delete(testcase.App);
        end
    end
end