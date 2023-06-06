classdef TestCustomize < matlab.uitest.TestCase
    % T1.3
    properties
        App;
        board;
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            testcase.board = Board;
        end
    end

    methods(Test)
        %T1.3.1
        function test_place_piece(testcase)
            testcase.App = customize_game(testcase.board);
            testcase.press(testcase.App.b14);
            testcase.press(testcase.App.c_cc);
            testcase.press(testcase.App.b14);
            testcase.verifyEqual(testcase.App.cc_num, 0);
            testcase.press(testcase.App.c_general_v);
            testcase.press(testcase.App.b54);
            testcase.verifyEqual(testcase.App.general_num, 0);
            testcase.press(testcase.App.c_general_h);
            testcase.press(testcase.App.b14);
            testcase.verifyEqual(testcase.App.gy_num, 0);

            testcase.press(testcase.App.c_cc);
            testcase.press(testcase.App.b12);
            testcase.press(testcase.App.c_general_v);
            testcase.press(testcase.App.b11);
            testcase.press(testcase.App.b14);
            testcase.press(testcase.App.b31);
            testcase.press(testcase.App.b34);
            testcase.press(testcase.App.c_general_h);
            testcase.press(testcase.App.b32);
            testcase.press(testcase.App.c_s);
            testcase.press(testcase.App.b51);
            testcase.press(testcase.App.b54);
            testcase.press(testcase.App.b42);
            testcase.press(testcase.App.b43);

            testcase.verifyEqual(testcase.App.cc.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.cc.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.App.mc.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.mc.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.zf.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.zy.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.App.zy.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.App.hz.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.gy.Layout.Row, 3);
            testcase.verifyEqual(testcase.App.gy.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.App.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.App.s1.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.App.s2.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.s3.Layout.Row, 4);
            testcase.verifyEqual(testcase.App.s3.Layout.Column, 2);

            testcase.verifyEqual(testcase.App.s4.Layout.Row, 4);
            testcase.verifyEqual(testcase.App.s4.Layout.Column, 3);
            testcase.verifyEqual(string(testcase.App.begin.Enable), "on");

            for r = 1 : 1 : 5
                for l = 1 : 1: 4
                    testcase.verifyEqual(string(testcase.App.(sprintf('b%d%d', r, l)).Visible), "off");
                end
            end

            delete(testcase.App);
        end
        
        %T1.3.2
        function test_reset_all(testcase)
            testcase.App = customize_game(testcase.board);
            testcase.press(testcase.App.c_cc);
            testcase.press(testcase.App.b12);
            testcase.press(testcase.App.c_general_v);
            testcase.press(testcase.App.b11);
            testcase.press(testcase.App.b14);
            testcase.press(testcase.App.b31);
            testcase.press(testcase.App.b34);
            testcase.press(testcase.App.c_general_h);
            testcase.press(testcase.App.b32);
            testcase.press(testcase.App.c_s);
            testcase.press(testcase.App.b51);
            testcase.press(testcase.App.b54);
            testcase.press(testcase.App.b42);
            testcase.press(testcase.App.b43);

            testcase.verifyEqual(testcase.App.cc.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.cc.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.App.mc.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.mc.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.zf.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.zy.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.App.zy.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.App.hz.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.gy.Layout.Row, 3);
            testcase.verifyEqual(testcase.App.gy.Layout.Column, [2 3]);

            testcase.verifyEqual(testcase.App.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.App.s1.Layout.Column, 1);

            testcase.verifyEqual(testcase.App.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.App.s2.Layout.Column, 4);

            testcase.verifyEqual(testcase.App.s3.Layout.Row, 4);
            testcase.verifyEqual(testcase.App.s3.Layout.Column, 2);

            testcase.verifyEqual(testcase.App.s4.Layout.Row, 4);
            testcase.verifyEqual(testcase.App.s4.Layout.Column, 3);
            testcase.verifyEqual(string(testcase.App.begin.Enable), "on");

            for r = 1 : 1 : 5
                for l = 1 : 1: 4
                    testcase.verifyEqual(string(testcase.App.(sprintf('b%d%d', r, l)).Visible), "off");
                end
            end

            testcase.press(testcase.App.clear);
            for r = 1 : 1 : 5
                for l = 1 : 1 : 4
                    testcase.verifyEqual(string(testcase.App.(sprintf('b%d%d', r, l)).Visible), "on");
                end
            end
            testcase.verifyEqual(string(testcase.App.begin.Enable), "off");
            testcase.verifyEqual(string(testcase.App.c_cc.Enable), "on");
            testcase.verifyEqual(string(testcase.App.c_s.Enable), "on");
            testcase.verifyEqual(string(testcase.App.c_general_h.Enable), "on");
            testcase.verifyEqual(string(testcase.App.c_general_v.Enable), "on");

            testcase.verifyEqual(testcase.App.cc_num, 0);
            testcase.verifyEqual(testcase.App.general_num, 0);
            testcase.verifyEqual(testcase.App.soldier_num, 0);
            testcase.verifyEqual(testcase.App.piece_type, 0);
            testcase.verifyEqual(testcase.App.gy_num, 0);
            delete(testcase.App);
        end
    end
end