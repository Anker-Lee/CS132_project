classdef Test_functionality < matlab.uitest.TestCase
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
        % T3.1
        function test_select_standard_mode(testcase)
            % t3.1.1
            testcase.App = game_home(testcase.board);
            testcase.choose(testcase.App.DropDown, "连战连捷");
            pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '连战连捷');
            testcase.choose(testcase.App.DropDown, "身先士卒");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '身先士卒');
            testcase.choose(testcase.App.DropDown, "一夫当关");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '一夫当关');
            testcase.choose(testcase.App.DropDown, "烽火不熄");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '烽火不熄');
            testcase.choose(testcase.App.DropDown, "有勇有谋");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '有勇有谋');
            testcase.choose(testcase.App.DropDown, "整齐排行");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '整齐排行');
            testcase.choose(testcase.App.DropDown, "屯兵东路");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '屯兵东路');
            testcase.choose(testcase.App.DropDown, "大呼驰下");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '大呼驰下');
            testcase.choose(testcase.App.DropDown, "四面楚歌");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '四面楚歌');
            testcase.choose(testcase.App.DropDown, "一横布局");pause(0.3);
            testcase.verifyEqual(testcase.App.DropDown.Value, '一横布局');
            delete(testcase.App);
        end
        
        % T3.2
        function test_select_customize_mode(testcase)
            % t3.2.1
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(3);
            delete(testcase.board.customize);
        end
        
        % T3.3
        function test_play_the_game(testcase)
            testcase.App = game_home(testcase.board);
            testcase.choose(testcase.App.DropDown, "连战连捷");
            testcase.press(testcase.App.start);

            testcase.press(testcase.board.game.cc);
            pause(0.3);
            testcase.press(testcase.board.game.left);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.right);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);
            testcase.press(testcase.board.game.down);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.cc.Layout.Column, [1 2]);

            testcase.press(testcase.board.game.zf);
            pause(0.3);
            testcase.press(testcase.board.game.left);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);

            testcase.press(testcase.board.game.mc);
            pause(0.3);
            testcase.press(testcase.board.game.down);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Column, 2);

            testcase.press(testcase.board.game.hz);
            pause(0.3);
            testcase.press(testcase.board.game.right);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s1);
            pause(0.3);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 1);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);

            testcase.press(testcase.board.game.hz);
            pause(0.3);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s4);
            pause(0.3);
            testcase.press(testcase.board.game.right);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 4);
            
            testcase.press(testcase.board.game.undo);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 3);
            pause(0.3);
            testcase.press(testcase.board.game.undo);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            pause(0.3);
            testcase.press(testcase.board.game.reset);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
            pause(0.3);

            testcase.press(testcase.board.game.next_level);
            testcase.press(testcase.board.game.next_level);
            testcase.verifyEqual(testcase.board.game.game_mode, 3);
            testcase.press(testcase.board.game.last_level);
            testcase.press(testcase.board.game.last_level);
            testcase.verifyEqual(testcase.board.game.game_mode, 1);

            testcase.press(testcase.board.game.zf);
            testcase.press(testcase.board.game.left);
            testcase.press(testcase.board.game.up);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.board.game.zf.Layout.Column, 3);
            testcase.press(testcase.board.game.mc);
            testcase.press(testcase.board.game.down);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.mc.Layout.Column, 2);
            testcase.press(testcase.board.game.hz);
            testcase.press(testcase.board.game.right);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [4 5]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.s1);
            testcase.press(testcase.board.game.up);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 2);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 1);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 4);

            testcase.press(testcase.board.game.hz);
            testcase.press(testcase.board.game.up);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [3 4]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);
            testcase.press(testcase.board.game.up);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Row, [2 3]);
            testcase.verifyEqual(testcase.board.game.hz.Layout.Column, 4);

            testcase.press(testcase.board.game.s4);
            testcase.press(testcase.board.game.right);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s4.Layout.Column, 4);
            testcase.press(testcase.board.game.help);

            delete(testcase.board.game);
        end
        
        % T3.4
        function test_customize_chessboard(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(0.3);
            
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.press(testcase.board.customize.c_cc);
            pause(0.3);
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.verifyEqual(testcase.board.customize.cc_num, 0);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.3);
            testcase.press(testcase.board.customize.b54);
            pause(0.3);
            testcase.verifyEqual(testcase.board.customize.general_num, 0);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.3);
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.verifyEqual(testcase.board.customize.gy_num, 0);

            testcase.press(testcase.board.customize.c_cc);
            pause(0.3);
            testcase.press(testcase.board.customize.b32);
            pause(0.3);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.3);
            testcase.press(testcase.board.customize.b11);
            pause(0.3);
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.press(testcase.board.customize.b31);
            pause(0.3);
            testcase.press(testcase.board.customize.b34);
            pause(0.3);
            testcase.press(testcase.board.customize.clear);
            pause(0.3);


            testcase.press(testcase.board.customize.c_cc);
            pause(0.3);
            testcase.press(testcase.board.customize.b32);
            pause(0.3);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.3);
            testcase.press(testcase.board.customize.b11);
            pause(0.3);
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.press(testcase.board.customize.b31);
            pause(0.3);
            testcase.press(testcase.board.customize.b34);
            pause(0.3);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.3);
            testcase.press(testcase.board.customize.b12);
            pause(0.3);
            testcase.press(testcase.board.customize.c_s);
            pause(0.3);
            testcase.press(testcase.board.customize.b52);
            pause(0.3);
            testcase.press(testcase.board.customize.b53);
            pause(0.3);
            testcase.press(testcase.board.customize.b22);
            pause(0.3);
            testcase.press(testcase.board.customize.b23);
            pause(0.3);

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
            pause(4);
            delete(testcase.board.game);
        end
    
        % T3.5
        function test_review_history(testcase)
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
            delete(testcase.board.home);
        end
    
        % T3.6
        function test_declare_win(testcase)
            testcase.App = game_home(testcase.board);
            testcase.press(testcase.App.customize);
            pause(0.3);

            testcase.press(testcase.board.customize.c_cc);
            pause(0.3);
            testcase.press(testcase.board.customize.b32);
            pause(0.3);
            testcase.press(testcase.board.customize.c_general_v);
            pause(0.3);
            testcase.press(testcase.board.customize.b11);
            pause(0.3);
            testcase.press(testcase.board.customize.b14);
            pause(0.3);
            testcase.press(testcase.board.customize.b31);
            pause(0.3);
            testcase.press(testcase.board.customize.b34);
            pause(0.3);
            testcase.press(testcase.board.customize.c_general_h);
            pause(0.3);
            testcase.press(testcase.board.customize.b12);
            pause(0.3);
            testcase.press(testcase.board.customize.c_s);
            pause(0.3);
            testcase.press(testcase.board.customize.b52);
            pause(0.3);
            testcase.press(testcase.board.customize.b53);
            pause(0.3);
            testcase.press(testcase.board.customize.b22);
            pause(0.3);
            testcase.press(testcase.board.customize.b23);
            pause(0.3);

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
            pause(0.3);
            testcase.press(testcase.board.game.s1);
            pause(0.3);
            testcase.press(testcase.board.game.left);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 1);
            testcase.press(testcase.board.game.s2);
            pause(0.3);
            testcase.press(testcase.board.game.right);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Column, 4);
            testcase.press(testcase.board.game.cc);
            pause(0.3);
            testcase.press(testcase.board.game.down);
            pause(0.3);

            testcase.verifyEqual(testcase.board.win.step_label.Text, '步数: 3');
            testcase.press(testcase.board.win.restart_game);
            pause(0.3);

            testcase.press(testcase.board.game.s1);
            pause(0.3);
            testcase.press(testcase.board.game.left);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s1.Layout.Column, 1);
            testcase.press(testcase.board.game.s2);
            pause(0.3);
            testcase.press(testcase.board.game.right);
            pause(0.3);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Row, 5);
            testcase.verifyEqual(testcase.board.game.s2.Layout.Column, 4);
            testcase.press(testcase.board.game.cc);
            pause(0.3);
            testcase.press(testcase.board.game.down);
            pause(0.3);

            testcase.verifyEqual(testcase.board.win.step_label.Text, '步数: 3');
            testcase.press(testcase.board.win.home);
            pause(0.3);
            testcase.press(testcase.board.home.exit);
            pause(0.3);
        end
    end
end