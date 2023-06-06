classdef Test_play_the_game_3 < matlab.uitest.TestCase
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
        % T3.3
        function test_play_the_game(testcase)
            testcase.App = game_home(testcase.board);
            testcase.choose(testcase.App.DropDown, "连战连捷");
            testcase.press(testcase.App.start);

            testcase.press(testcase.board.game.cc);
            pause(0.5);
            testcase.press(testcase.board.game.left);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.right);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.down);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);

            testcase.press(testcase.board.game.zf);
            pause(0.5);
            testcase.press(testcase.board.game.left);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);

            testcase.press(testcase.board.game.mc);
            pause(0.5);
            testcase.press(testcase.board.game.down);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Column, 2);

            testcase.press(testcase.board.game.hz);
            pause(0.5);
            testcase.press(testcase.board.game.right);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s1);
            pause(0.5);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 1);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);

            testcase.press(testcase.board.game.hz);
            pause(0.5);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s4);
            pause(0.5);
            testcase.press(testcase.board.game.right);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 4);
            
            testcase.press(testcase.board.game.undo);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 3);
            pause(0.5);
            testcase.press(testcase.board.game.undo);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            pause(0.5);
            testcase.press(testcase.board.game.reset);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
            pause(0.5);

            testcase.press(testcase.board.game.next_level);
            testcase.press(testcase.board.game.next_level);
            testcase.verifyEqual(testcase.board.game.game_mode, 3);
            testcase.press(testcase.board.game.last_level);
            testcase.press(testcase.board.game.last_level);
            testcase.verifyEqual(testcase.board.game.game_mode, 1);

%             testcase.press(testcase.board.game.zf);pause(0.5);
%             testcase.press(testcase.board.game.left);pause(0.5);
%             testcase.press(testcase.board.game.up);pause(0.5);
%             testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
%             testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
%             testcase.press(testcase.board.game.mc);pause(0.5);
%             testcase.press(testcase.board.game.down);pause(0.5);
%             testcase.verifyEqual(testcase.board.game.mc.Layout.Row, [4 5]);
%             testcase.verifyEqual(testcase.board.game.mc.Layout.Column, 2);
%             testcase.press(testcase.board.game.hz);pause(0.5);
%             testcase.press(testcase.board.game.right);pause(0.5);
%             testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [4 5]);
%             testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.s1);pause(0.5);
            testcase.press(testcase.board.game.up);pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);
            testcase.press(testcase.board.game.up);pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 1);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);

            testcase.press(testcase.board.game.hz);pause(0.5);
            testcase.press(testcase.board.game.up);pause(0.5);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.up);pause(0.5);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s4);pause(0.5);
            testcase.press(testcase.board.game.right);pause(0.5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 4);
                        
            testcase.press(testcase.board.game.help);pause(3);
            testcase.press(testcase.board.game.home);
            testcase.choose(testcase.board.home.DropDown, 'win test');

            testcase.press(testcase.board.home.start);
            testcase.press(testcase.board.game.cc);pause(0.5);
            testcase.press(testcase.board.game.down);pause(0.5);
            testcase.press(testcase.board.win.home); pause(1);
            testcase.press(testcase.board.home.exit);
        end
    end
end