classdef Board < handle
    properties (Access = public)
        occupy_matrix (:,:); % 棋盘矩阵
        initial_layout
        initial_matrix % 用于 -1 mode


        cc_row;
        cc_col;

        mc_row;
        mc_col;
        zf_row;
        zf_col;
        zy_row;
        zy_col;
        gy_row;
        gy_col;
        hz_row;
        hz_col

        s1_row;
        s1_col;
        s2_row;
        s2_col;
        s3_row;
        s3_col;
        s4_row;
        s4_col;

        game;
        customize;
        win;
        home;
        history;
        review;
    end

    methods (Access = public)
        function clear_board(obj)
            obj.occupy_matrix = [
                0 0 0 0;
                0 0 0 0;
                0 0 0 0;
                0 0 0 0;
                0 0 0 0];
        end
        function reset_layout(obj) % 重置 不能直接重置
            obj.occupy_matrix = obj.initial_matrix;
%             layout = obj.initial_layout;

%             obj.cc_row = layout.cc_row;
%             obj.cc_col = layout.cc_col;
% 
%             obj.mc_row = layout.mc_row;
%             obj.mc_col = layout.mc_col;
%             obj.zf_row = layout.zf_row;
%             obj.zf_col = layout.zf_col;
%             obj.zy_row = layout.zy_row;
%             obj.zy_col = layout.zy_col;
%             obj.gy_row = layout.gy_row;
%             obj.gy_col = layout.gy_col;
%             obj.hz_row = layout.hz_row;
%             obj.hz_col = layout.hz_col;
% 
%             obj.s1_row = layout.s1_row;
%             obj.s1_col = layout.s1_col;
%             obj.s2_row = layout.s2_row;
%             obj.s2_col = layout.s2_col;
%             obj.s3_row = layout.s3_row;
%             obj.s3_col = layout.s3_col;
%             obj.s4_row = layout.s4_row;
%             obj.s4_col = layout.s4_col;
            
        end
        function set_layout(obj, layout) % 初始化
            disp("setting layout...")
            obj.occupy_matrix = layout.occupy_matrix;
            obj.initial_matrix = layout.occupy_matrix;
            obj.initial_layout = layout;
            

            obj.cc_row = layout.cc_row;
            obj.cc_col = layout.cc_col;

            obj.mc_row = layout.mc_row;
            obj.mc_col = layout.mc_col;
            obj.zf_row = layout.zf_row;
            obj.zf_col = layout.zf_col;
            obj.zy_row = layout.zy_row;
            obj.zy_col = layout.zy_col;
            obj.gy_row = layout.gy_row;
            obj.gy_col = layout.gy_col;
            obj.hz_row = layout.hz_row;
            obj.hz_col = layout.hz_col;

            obj.s1_row = layout.s1_row;
            obj.s1_col = layout.s1_col;
            obj.s2_row = layout.s2_row;
            obj.s2_col = layout.s2_col;
            obj.s3_row = layout.s3_row;
            obj.s3_col = layout.s3_col;
            obj.s4_row = layout.s4_row;
            obj.s4_col = layout.s4_col;
        end
        function is_move = move_up(obj, row, column)
            is_move = false;
            if row(1)-1 >= 1
                if obj.occupy_matrix(row(1)-1, column) == zeros(1, length(column)) % branch tcover 1.1.3.1
                    obj.occupy_matrix(row(end), column) = zeros(1, length(column));
                    obj.occupy_matrix(row - 1, column) = ones(length(row), length(column));
                    is_move = true;
                end
            end
        end

        function is_move = move_down(obj,row,column)
            is_move = false;
            if row(end)+1 <= 5
                if obj.occupy_matrix(row(end)+1,column) == zeros(1,length(column)) % branch tcover 1.1.3.2
                    obj.occupy_matrix(row(1),column) = zeros(1,length(column));
                    obj.occupy_matrix(row + 1, column) = ones(length(row),length(column));
                    is_move = true;
                end
            end
        end

        function is_move = move_left(obj,row,column)
            is_move = false;
            if column(1)-1 >= 1 
                if obj.occupy_matrix(row,column(1)-1) == zeros(length(row), 1)  % branch tcover 1.1.3.3
                    obj.occupy_matrix(row,column(end)) = zeros(length(row), 1);
                    obj.occupy_matrix(row,column - 1) = ones(length(row), length(column));
                    is_move = true;
                end
            end
        end

        function is_move = move_right(obj,row,column)
            is_move = false;
            if column(end)+1 <= 4 
                if  obj.occupy_matrix(row,column(end)+1) == zeros(length(row),1) % branch tcover 1.1.3.4
                    obj.occupy_matrix(row,column(1)) = zeros(length(row),1);
                    obj.occupy_matrix(row,column + 1) = ones(length(row),length(column));
                    is_move = true;
                end 
            end
        end

    end
end