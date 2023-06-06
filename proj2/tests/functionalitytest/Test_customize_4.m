classdef Test_customize_4 < matlab.uitest.TestCase
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
        % T3.4
        function test_customize_chessboard(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(0.5);
            testcase.press(testcase.board.customize.home);pause(0.5);
            testcase.press(testcase.board.home.customize);pause(0.5);
            testcase.press(testcase.board.customize.b11);
            testcase.press(testcase.board.customize.b12);
            testcase.press(testcase.board.customize.b13);
            testcase.press(testcase.board.customize.b14);

            testcase.press(testcase.board.customize.b21);
            testcase.press(testcase.board.customize.b22);
            testcase.press(testcase.board.customize.b23);
            testcase.press(testcase.board.customize.b24);

            testcase.press(testcase.board.customize.b31);
            testcase.press(testcase.board.customize.b32);
            testcase.press(testcase.board.customize.b33);
            testcase.press(testcase.board.customize.b34);

            testcase.press(testcase.board.customize.b41);
            testcase.press(testcase.board.customize.b42);
            testcase.press(testcase.board.customize.b43);
            testcase.press(testcase.board.customize.b44);

            testcase.press(testcase.board.customize.b51);
            testcase.press(testcase.board.customize.b52);
            testcase.press(testcase.board.customize.b53);
            testcase.press(testcase.board.customize.b54);
            pause(0.5);
            testcase.press(testcase.board.customize.c_cc);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            testcase.press(testcase.board.customize.b24);
            testcase.press(testcase.board.customize.b34);
            testcase.press(testcase.board.customize.b44);
            testcase.press(testcase.board.customize.b54);
            testcase.press(testcase.board.customize.b51);
            testcase.press(testcase.board.customize.b52);
            testcase.press(testcase.board.customize.b53);
            pause(0.5);
            testcase.verifyEqual(testcase.board.customize.cc_num, 0);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.5);
            testcase.press(testcase.board.customize.b54);
            testcase.press(testcase.board.customize.b51);
            testcase.press(testcase.board.customize.b52);
            testcase.press(testcase.board.customize.b53);
            pause(0.5);
            testcase.verifyEqual(testcase.board.customize.general_num, 0);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.5);
            testcase.press(testcase.board.customize.b14);
            testcase.press(testcase.board.customize.b24);
            testcase.press(testcase.board.customize.b34);
            testcase.press(testcase.board.customize.b44);
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
            testcase.press(testcase.board.customize.cc);
            testcase.press(testcase.board.customize.zf);
            testcase.press(testcase.board.customize.gy);
            testcase.press(testcase.board.customize.hz);
            testcase.press(testcase.board.customize.zy);
            testcase.press(testcase.board.customize.mc);
            testcase.press(testcase.board.customize.s1);
            testcase.press(testcase.board.customize.s2);
            testcase.press(testcase.board.customize.s3);
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
            pause(3);
            delete(testcase.board.game);
        end
    end
end