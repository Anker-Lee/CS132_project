classdef Test_home_customize_game_win < matlab.uitest.TestCase
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
        function test_customize_play_win(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(0.5);
            
            testcase.press(testcase.board.customize.b14);
            pause(0.5);
            testcase.press(testcase.board.customize.c_cc);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            pause(0.5);
            testcase.verifyEqual(testcase.board.customize.cc_num, 0);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.5);
            testcase.press(testcase.board.customize.b54);
            pause(0.5);
            testcase.verifyEqual(testcase.board.customize.general_num, 0);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            pause(0.5);
            testcase.verifyEqual(testcase.board.customize.gy_num, 0);

            testcase.press(testcase.board.customize.c_cc);
            pause(0.5);
            testcase.press(testcase.board.customize.b32);
            pause(0.5);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.5);
            testcase.press(testcase.board.customize.b11);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            pause(0.5);
            testcase.press(testcase.board.customize.b31);
            pause(0.5);
            testcase.press(testcase.board.customize.b34);
            pause(0.5);
            testcase.press(testcase.board.customize.clear);
            pause(0.5);


            testcase.press(testcase.board.customize.c_cc);
            pause(0.5);
            testcase.press(testcase.board.customize.b32);
            pause(0.5);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.5);
            testcase.press(testcase.board.customize.b11);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            pause(0.5);
            testcase.press(testcase.board.customize.b31);
            pause(0.5);
            testcase.press(testcase.board.customize.b34);
            pause(0.5);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.5);
            testcase.press(testcase.board.customize.b12);
            pause(0.5);
            testcase.press(testcase.board.customize.c_s);
            pause(0.5);
            testcase.press(testcase.board.customize.b52);
            pause(0.5);
            testcase.press(testcase.board.customize.b53);
            pause(0.5);
            testcase.press(testcase.board.customize.b22);
            pause(0.5);
            testcase.press(testcase.board.customize.b23);
            pause(0.5);

            testcase.verifyEqual(testcase.board.customize.cc.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.customize.cc.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.board.customize.mc.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.customize.mc.Layout.Column, 1);

            testcase.verifyEqual(testcase.board.customize.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.customize.zf.Layout.Column, 4);

            testcase.verifyEqual(testcase.board.customize.zy.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.customize.zy.Layout.Column, 1);

            testcase.verifyEqual(testcase.board.customize.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.customize.hz.Layout.Column, 4);

            testcase.verifyEqual(testcase.board.customize.gy.Layout.Row, 1);
            testcase.verifyEqual(testcase.board.customize.gy.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.board.customize.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.customize.s1.Layout.Column, 2);

            testcase.verifyEqual(testcase.board.customize.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.customize.s2.Layout.Column, 3);

            testcase.verifyEqual(testcase.board.customize.s3.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.customize.s3.Layout.Column, 2);

            testcase.verifyEqual(testcase.board.customize.s4.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.customize.s4.Layout.Column, 3);
            testcase.verifyEqual(string(testcase.board.customize.begin.Enable), "on");

            for r = 1 : 1 : 5
                for l = 1 : 1: 4
                    testcase.verifyEqual(string(testcase.board.customize.(sprintf('b%d%d', r, l)).Visible), "off");
                end
            end

            testcase.press(testcase.board.customize.begin);
            pause(0.5);
            testcase.press(testcase.board.game.s1);
            pause(0.5);
            testcase.press(testcase.board.game.left);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 1);
            testcase.press(testcase.board.game.s2);
            pause(0.5);
            testcase.press(testcase.board.game.right);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Column, 4);
            testcase.press(testcase.board.game.cc);
            pause(0.5);
            testcase.press(testcase.board.game.down);
            pause(0.5);

            testcase.verifyEqual(testcase.board.win.step_label.Text, '步数: 3');
            testcase.press(testcase.board.win.restart_game);
            pause(0.5);

            testcase.press(testcase.board.game.s1);
            pause(0.5);
            testcase.press(testcase.board.game.left);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 1);
            testcase.press(testcase.board.game.s2);
            pause(0.5);
            testcase.press(testcase.board.game.right);
            pause(0.5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Column, 4);
            testcase.press(testcase.board.game.cc);
            pause(0.5);
            testcase.press(testcase.board.game.down);
            pause(0.5);

            testcase.verifyEqual(testcase.board.win.step_label.Text, '步数: 3');
            testcase.press(testcase.board.win.home);
            pause(0.5);
            testcase.press(testcase.board.home.exit);
            pause(0.5);
        end
    end
end