classdef user_backend < handle
    %UUSER 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        user_id
        ticket_list
        train_db
        Time_backend
        time %user内部时间函数
        Clock %user内时间
        checkUI
        UserTicketUI
        UserTicketUIstate %历史订单界面是否打开，打开为true
        QueryUI
        TrainUI
        Train_change_UI
        OrderUI
        user_state_ui
        user_state
        user_next_off_time
    end
    
    methods
        function obj = user_backend(user_id,train_db,time_backend)
            %UUSER 构造此类的实例
            %   此处显示详细说明
            obj.user_id = user_id;
            obj.ticket_list = ticket;
            obj.train_db = train_db;
            obj.checkUI = checkticket;
            obj.user_state = false;
            obj.user_state_ui = user_state;
            obj.user_state_ui.UIFigure.Name = strcat(obj.user_id,' Status UI');
            obj.UserTicketUIstate = false;
            obj.checkUI.UIFigure.Name = strcat(obj.user_id,' Get On UI');
            set(obj.checkUI.UIFigure, 'Visible', 'off');
            obj.Time_backend = time_backend;
            obj.time = timer;
            obj.time.TimerFcn = @obj.userTimerCallBackFunction;
            obj.time.ExecutionMod = 'fixedSpacing';
            obj.time.Period = 1.01;
            obj.Clock = obj.Time_backend.Clock;
            start(obj.time);
            queryUI = Query;
            queryUI.UIFigure.Name = strcat(obj.user_id,' Query Ticket UI');
            queryUI.traindb = obj.train_db;
            queryUI.backend = obj;
            obj.QueryUI = queryUI;
        end

        function userTimerCallBackFunction(obj, ~, ~)
            obj.Clock = obj.Time_backend.Clock;
            if(obj.user_state_ui.Image_2.Visible == 1)
                if(obj.Clock>=obj.user_next_off_time)
                    obj.user_state_ui.Image_2.Visible = 0;
                end
            end
            three_minutes = duration(00,03,00);
            if obj.ticket_list.num_tickets ~= 0 %写一个对所有票的循环
                closest_ticket = obj.ticket_list.find_close();
                if datetime(closest_ticket{3},'InputFormat','HH:mm') - obj.Clock <= three_minutes       
                    obj.checkUI.Label_6.Text = closest_ticket{1};
                    set(obj.checkUI.UIFigure, 'Visible', 'on');
                    if(obj.UserTicketUIstate)
                        obj.UserTicketUIstate = false;
                        close(obj.UserTicketUI.UIFigure);
                        queryUI = Query;
                        queryUI.UIFigure.Name = strcat(obj.user_id,' Query Ticket UI');
                        queryUI.traindb = obj.train_db;
                        queryUI.backend = obj;
                        obj.QueryUI = queryUI;
                    end

                    if datetime(closest_ticket{3},'InputFormat','HH:mm') - obj.Clock <= duration(00,01,30)
                        if obj.checkUI.Button.Value
                            obj.ticket_list.deleteticket(closest_ticket);
                            obj.user_state_ui.Image_2.Visible = 1;
                            obj.user_next_off_time = datetime(closest_ticket{4},'InputFormat','HH:mm');
                            set(obj.checkUI.UIFigure, 'Visible', 'off');
                            if ~strcmp('On',obj.checkUI.Switch.Value)
                                obj.checkUI.Button.Value = 0;
                            end
                        end
                    end
                    if datetime(closest_ticket{3},'InputFormat','HH:mm') <= obj.Clock
                        obj.table_manage_back(closest_ticket);
                        set(obj.checkUI.UIFigure, 'Visible', 'off');
                    end
                end
            end
         end

        function obj = table_manage(obj,single_plan)
            %table_manage 此函数处理购买车票后的座位问题
            %   此处显示详细说明
            if single_plan{7} == 0 %直达列车
                start_index = single_plan{9};
                end_index = single_plan{10};                
                single_plan{8}.table_manage(start_index,end_index);
                obj.ticket_list.register(single_plan);
            else
                intermediate_station = single_plan{2};
                start_index = single_plan{10}; %第一辆车的起始站
                intermediate_end_index = single_plan{8}.find_end(intermediate_station); %第一辆车的终点站
                intermediate_start_index = single_plan{9}.find_start(intermediate_station); %第二辆车的起始站
                end_index = single_plan{11}; %第二辆车的终点站
                single_plan{8}.table_manage(start_index,intermediate_end_index);
                single_plan{9}.table_manage(intermediate_start_index,end_index);
                first_train = single_plan{8};
                second_train = single_plan{9};
                price  = first_train.price * (intermediate_end_index - start_index);
                first_train_plan = {first_train.train_id %火车编号
                    '无'
                    first_train.stops{start_index,3}
                    first_train.stops{intermediate_end_index,2}
                    '0'
                    num2str(price)
                    0
                    first_train
                    start_index
                    intermediate_end_index
                    };
                price1  = second_train.price * (end_index - intermediate_start_index);
                second_train_plan = {second_train.train_id %火车编号
                    '无'
                    second_train.stops{intermediate_start_index,3}
                    second_train.stops{end_index,2}
                    '0'
                    num2str(price1)
                    0
                    second_train
                    intermediate_start_index
                    end_index
                    };
                obj.ticket_list.register(first_train_plan);
                obj.ticket_list.register(second_train_plan);
            end

            
        end
        function obj = table_manage_back(obj,single_plan)
            %table_manage 此函数处理退还车票后的座位问题
            %   此处显示详细说明
            if single_plan{7} == 0 %直达列车
                start_index = single_plan{9};
                end_index = single_plan{10};                
                single_plan{8}.table_manage_back(start_index,end_index); 

            else
                intermediate_station = single_plan{2};
                start_index = single_plan{10}; %第一辆车的起始站
                intermediate_end_index = single_plan{8}.find_end(intermediate_station); %第一辆车的终点站
                intermediate_start_index = single_plan{9}.find_start(intermediate_station); %第二辆车的起始站
                end_index = single_plan{11}; %第二辆车的终点站
                single_plan{8}.table_manage_back(start_index,intermediate_end_index);
                single_plan{9}.table_manage_back(intermediate_start_index,end_index);
            end
            obj.ticket_list.deleteticket(single_plan);
        end
    end
end

