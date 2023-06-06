classdef TestGame < matlab.uitest.TestCase
    properties
        App;
        board;
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            testcase.board = Board;
%             testcase.App = game(0, testcase.board);
%             testcase.addTeardown(@delete. testcase.App);
        end
    end

    methods(Test)
        %t1.2.1
        function test_startupFcn(testcase)
            % T1.2.1.1
            testcase.App = game(0, testcase.board);
            % expected layout
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
            testcase.verifyEqual(string(testcase.App.next_level.Enable), "off");
            testcase.verifyEqual(string(testcase.App.last_level.Enable), "off");
            delete(testcase.App);
%             testcase.addTeardown(@delete. testcase.App);

            %T1.2.1.2
            testcase.App = game(1, testcase.board);
            testcase.verifyEqual(string(testcase.App.next_level.Enable), "on");
            testcase.verifyEqual(string(testcase.App.last_level.Enable), "off");
            delete(testcase.App);
            %T1.2.1.3
            testcase.App = game(10, testcase.board);
            testcase.verifyEqual(string(testcase.App.next_level.Enable), "off");
            testcase.verifyEqual(string(testcase.App.last_level.Enable), "on");
            delete(testcase.App);
            %T1.2.1.4
            testcase.App = game(2, testcase.board);
            testcase.verifyEqual(string(testcase.App.next_level.Enable), "on");
            testcase.verifyEqual(string(testcase.App.last_level.Enable), "on");
            delete(testcase.App);
        end

        %t1.2.2
        function test_init_game(testcase) 
            testcase.App = game(0, testcase.board);

            fields = {'cc', 's1', 's2', 's3', 's4', 'gy', 'zf', 'zy', 'hz', 'mc'};
            num_pieces = length(fields);
            for i = 1:num_pieces
                field = fields{i};
                row_field = strcat(field, '_row');
                col_field = strcat(field, '_col');

                testcase.verifyEqual(testcase.App.game_board.occupy_matrix, testcase.App.game_board.initial_matrix);         
                testcase.verifyEqual(testcase.App.(field).Layout.Row, testcase.App.game_board.(row_field));
                testcase.verifyEqual(testcase.App.(field).Layout.Column, testcase.App.game_board.(col_field));
            end
            delete(testcase.App);
        end
    
        %t1.2.3
        function test_reset_game(testcase)
            testcase.App = game(0, testcase.board);
            testcase.press(testcase.App.s4);
            testcase.press(testcase.App.left);
            testcase.press(testcase.App.reset);
            
            fields = {'cc', 's1', 's2', 's3', 's4', 'gy', 'zf', 'zy', 'hz', 'mc'};
            for i = 1:length(fields)
                field = fields{i};
                row_field = strcat(field, '_row');
                col_field = strcat(field, '_col');

                testcase.verifyEqual(testcase.App.(field).Layout.Row, testcase.App.game_board.(row_field));
                testcase.verifyEqual(testcase.App.(field).Layout.Column, testcase.App.game_board.(col_field));
            end

            testcase.verifyEqual(testcase.App.seleted_piece, 0);
            testcase.verifyEqual(testcase.App.history_list, struct('selected_piece', {}, 'dir', {}));
            testcase.verifyEqual(string(testcase.App.undo.Enable), "off");
            delete(testcase.App);
        end

        %t1.2.4
        function test_undo(testcase)
            %t1.2.4.1
            testcase.App = game(1, testcase.board);
            testcase.verifyEqual(string(testcase.App.undo.Enable), "off");

            %t1.2.4.2
            testcase.press(testcase.App.zf);
            testcase.press(testcase.App.right);
            testcase.press(testcase.App.left);
            testcase.press(testcase.App.s1);
            testcase.press(testcase.App.up);
            testcase.press(testcase.App.down);
            testcase.press(testcase.App.undo);
            testcase.press(testcase.App.undo);
            testcase.press(testcase.App.undo);
            testcase.press(testcase.App.undo);
            testcase.verifyEqual(testcase.App.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.zf.Layout.Column, 3);
            testcase.verifyEqual(testcase.App.s1.Layout.Row, 3);
            testcase.verifyEqual(testcase.App.s1.Layout.Column, 4);
            delete(testcase.App);
        end
        
        % t1.2.5
        function test_move_piece(testcase)
            % t1.2.5.1
            testcase.App = game(1, testcase.board);
            testcase.press(testcase.App.right);
            testcase.press(testcase.App.zf);
            testcase.press(testcase.App.right);
            testcase.verifyEqual(testcase.App.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.zf.Layout.Column, 4);
            testcase.press(testcase.App.left);
            testcase.verifyEqual(testcase.App.zf.Layout.Row, [1 2]);
            testcase.verifyEqual(testcase.App.zf.Layout.Column, 3);
            testcase.press(testcase.App.s1);
            testcase.press(testcase.App.up);
            testcase.verifyEqual(testcase.App.s1.Layout.Row, 2);
            testcase.verifyEqual(testcase.App.s1.Layout.Column, 4);
            testcase.press(testcase.App.down);
            testcase.verifyEqual(testcase.App.s1.Layout.Row, 3);
            testcase.verifyEqual(testcase.App.s1.Layout.Column, 4);
            delete(testcase.App);
        end
  
        
        % t1.2.6
        function test_record_move(testcase)
            testcase.App = game(1, testcase.board);
            testcase.press(testcase.App.zf);
            testcase.press(testcase.App.right);
            testcase.verifyEqual(testcase.App.history_list(1).selected_piece.Text, '张飞');
            testcase.verifyEqual(testcase.App.history_list(1).dir, 'r');
            testcase.press(testcase.App.left);
            testcase.verifyEqual(testcase.App.history_list(2).selected_piece.Text, '张飞');
            testcase.verifyEqual(testcase.App.history_list(2).dir, 'l');
            delete(testcase.App);
        end

        % t1.2.7
        function test_record_layout(testcase)
            testcase.App = game(1, testcase.board);
            testcase.press(testcase.App.zf);
            testcase.press(testcase.App.right);
            testcase.verifyEqual(testcase.App.layout_list(2, 16), 1);
            testcase.verifyEqual(testcase.App.layout_list(2, 17), 2);
            testcase.verifyEqual(testcase.App.layout_list(2, 18), 4);
            delete(testcase.App);
        end
        
        % t1.2.8
%         function test_check_win(testcase)
%             testcase.App = game(0, testcase.board);
%             testcase.verifyEqual(testcase.App.iswin, 0);
%             testcase.press(testcase.App.cc);
%             testcase.press(testcase.App.down);
%             testcase.verifyEqual(testcase.App.iswin, 1);
%         end
    end
end