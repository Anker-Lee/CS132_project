classdef Test_select_customize_2 < matlab.uitest.TestCase
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
        % T3.2
        function test_select_customize_mode(testcase)
            % t3.2.1
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(5);
            delete(testcase.board.customize);
        end
    end
end