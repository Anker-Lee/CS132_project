classdef TestBoard < matlab.unittest.TestCase
    properties
        board
    end
    
    methods(TestMethodSetup)
        function launchAPP(testcase)
            testcase.board = Board;
        end
    end

    methods(Test)
        % T1.1.1
        function test_clear_board(testcase) 
            % statement cover
            testcase.board.clear_board();
            cleared = [
                0 0 0 0;
                0 0 0 0;
                0 0 0 0;
                0 0 0 0;
                0 0 0 0];
            testcase.verifyEqual(testcase.board.occupy_matrix, cleared);
        end

        % T1.1.4
        function test_reset_layout(testcase)
            % s
            testcase.board.reset_layout();
            testcase.verifyEqual(testcase.board.occupy_matrix, testcase.board.initial_matrix);
        end
    
        % T1.1.2
        function test_set_layout(testcase)
            % s
            % layout_0 test_win layout
            layout = struct('occupy_matrix', [1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 0, 0, 1], ...
            'cc_row', [3 4], ... %A
            'cc_col', [2 3], ...
            'mc_row', [1 2], ... %1
            'mc_col', 1, ...
            'zf_row', [1 2], ... %2
            'zf_col', 4, ...
            'zy_row', [3 4], ... %3
            'zy_col', 1, ...
            'gy_row', 2, ...     %4
            'gy_col', [2 3], ...
            'hz_row', [3 4], ... %5
            'hz_col', 4, ...
            's1_row', 1, ... %6
            's1_col', 2, ...
            's2_row', 1, ... %7
            's2_col', 3, ...
            's3_row', 5, ... %8
            's3_col', 1, ...
            's4_row', 5, ... %9
            's4_col', 4);
            testcase.board.set_layout(layout);
            testcase.verifyEqual(testcase.board.occupy_matrix, layout.occupy_matrix);
            testcase.verifyEqual(testcase.board.initial_matrix, layout.occupy_matrix);
            testcase.verifyEqual(testcase.board.initial_layout, layout);
            testcase.verifyEqual(testcase.board.cc_row, layout.cc_row);
            testcase.verifyEqual(testcase.board.cc_col, layout.cc_col);
            testcase.verifyEqual(testcase.board.mc_row, layout.mc_row);
            testcase.verifyEqual(testcase.board.mc_col, layout.mc_col);
            testcase.verifyEqual(testcase.board.zf_row, layout.zf_row);
            testcase.verifyEqual(testcase.board.zf_col, layout.zf_col);
            testcase.verifyEqual(testcase.board.zy_row, layout.zy_row);
            testcase.verifyEqual(testcase.board.zy_col, layout.zy_col);
            testcase.verifyEqual(testcase.board.gy_row, layout.gy_row);
            testcase.verifyEqual(testcase.board.gy_col, layout.gy_col);
            testcase.verifyEqual(testcase.board.hz_row, layout.hz_row);
            testcase.verifyEqual(testcase.board.hz_col, layout.hz_col);
            testcase.verifyEqual(testcase.board.s1_row, layout.s1_row);
            testcase.verifyEqual(testcase.board.s1_col, layout.s1_col);
            testcase.verifyEqual(testcase.board.s2_row, layout.s2_row);
            testcase.verifyEqual(testcase.board.s2_col, layout.s2_col);
            testcase.verifyEqual(testcase.board.s3_row, layout.s3_row);
            testcase.verifyEqual(testcase.board.s3_col, layout.s3_col);
            testcase.verifyEqual(testcase.board.s4_row, layout.s4_row);
            testcase.verifyEqual(testcase.board.s4_col, layout.s4_col);
        end
        
        % T1.1.3
        function test_move(testcase)
            % layout_0 test_win layout
            layout = struct('occupy_matrix', [1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 1, 1, 1; ...
            1, 0, 0, 1], ...
            'cc_row', [3 4], ... %A
            'cc_col', [2 3], ...
            'mc_row', [1 2], ... %1
            'mc_col', 1, ...
            'zf_row', [1 2], ... %2
            'zf_col', 4, ...
            'zy_row', [3 4], ... %3
            'zy_col', 1, ...
            'gy_row', 2, ...     %4
            'gy_col', [2 3], ...
            'hz_row', [3 4], ... %5
            'hz_col', 4, ...
            's1_row', 1, ... %6
            's1_col', 2, ...
            's2_row', 1, ... %7
            's2_col', 3, ...
            's3_row', 5, ... %8
            's3_col', 1, ...
            's4_row', 5, ... %9
            's4_col', 4);
            testcase.board.set_layout(layout);
            % T1.1.3.1.1 非法移动
            is_move = testcase.board.move_up(1,1);
            testcase.verifyEqual(is_move, false);
            testcase.verifyEqual(testcase.board.occupy_matrix(1, 1), 1);

            % T1.1.3.2.1
            is_move = testcase.board.move_down(1,1);
            testcase.verifyEqual(is_move, false);
            testcase.verifyEqual(testcase.board.occupy_matrix(1, 1), 1);

            % T1.1.3.3.1
            is_move = testcase.board.move_left(1,1);
            testcase.verifyEqual(is_move, false);
            testcase.verifyEqual(testcase.board.occupy_matrix(1, 1), 1);

            % T1.1.3.4.1
            is_move = testcase.board.move_right(1,1);
            testcase.verifyEqual(is_move, false);
            testcase.verifyEqual(testcase.board.occupy_matrix(1, 1), 1);
            
            % T1.1.3.2.2 合法移动
            is_move = testcase.board.move_down([3 4],[2 3]);
            testcase.verifyEqual(is_move, true);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,2), 1);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,3), 1);

            testcase.verifyEqual(testcase.board.occupy_matrix(3,2), 0);
            testcase.verifyEqual(testcase.board.occupy_matrix(3,3), 0);

            % T1.1.3.1.2 合法移动
            is_move = testcase.board.move_up([4 5],[2 3]);
            testcase.verifyEqual(is_move, true);
            testcase.verifyEqual(testcase.board.occupy_matrix(3,2), 1);
            testcase.verifyEqual(testcase.board.occupy_matrix(3,3), 1);

            testcase.verifyEqual(testcase.board.occupy_matrix(5,2), 0);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,3), 0);

            % T1.1.3.3.2
            is_move = testcase.board.move_left(5,4);
            testcase.verifyEqual(is_move, true);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,3), 1);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,4), 0);

            % T1.1.3.4.2
            is_move = testcase.board.move_right(5,1);
            testcase.verifyEqual(is_move, true);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,2), 1);
            testcase.verifyEqual(testcase.board.occupy_matrix(5,1), 0);
        end
    end
end