classdef Test_select_mode_1 < matlab.uitest.TestCase
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
            testcase.choose(testcase.App.DropDown, 'win test');
            pause(1);
            testcase.choose(testcase.App.DropDown, "连战连捷");
            pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '连战连捷');
            testcase.choose(testcase.App.DropDown, "身先士卒");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '身先士卒');
            testcase.choose(testcase.App.DropDown, "一夫当关");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '一夫当关');
            testcase.choose(testcase.App.DropDown, "烽火不熄");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '烽火不熄');
            testcase.choose(testcase.App.DropDown, "有勇有谋");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '有勇有谋');
            testcase.choose(testcase.App.DropDown, "整齐排行");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '整齐排行');
            testcase.choose(testcase.App.DropDown, "屯兵东路");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '屯兵东路');
            testcase.choose(testcase.App.DropDown, "大呼驰下");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '大呼驰下');
            testcase.choose(testcase.App.DropDown, "四面楚歌");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '四面楚歌');
            testcase.choose(testcase.App.DropDown, "一横布局");pause(1);
            testcase.verifyEqual(testcase.App.DropDown.Value, '一横布局');
            pause(1);
            testcase.choose(testcase.App.DropDown, '随机关卡')
            testcase.verifyEqual(testcase.App.DropDown.Value, '随机关卡');
            pause(1);
            delete(testcase.App);
        end
    end
end