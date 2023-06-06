classdef ticket < handle
    %TICKET 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        ticket_list
        num_tickets
    end
    
    methods
        function obj = ticket()
            obj.num_tickets = 0;
            obj.ticket_list = {};
        end
        function register(obj,single_ticket)
            %TRAINDB 构造此类的实例
            %   此处显示详细说明
            list = obj.ticket_list;
            list{end+1} = single_ticket;
            obj.ticket_list = list;
            obj.num_tickets = obj.num_tickets +1;
        end
        function deleteticket(obj, s_ticket)
            % 查找要删除的 Ticket 在 TicketList 中的索引
            idx = find(cellfun(@(x) isequal(x, s_ticket), obj.ticket_list));
            
            % 如果找到了匹配的索引，则从 TicketList 中删除对应的 ticket
            if ~isempty(idx)
                obj.ticket_list(idx) = [];
                obj.num_tickets = obj.num_tickets - 1;
            else
                disp('Ticket not found in Ticketlist.');
            end
        end
        function closest_time_ticket = find_close(obj)
            %找到时间最早的票
            closest_time_ticket = obj.ticket_list{1};
            if obj.num_tickets == 1
                return
            end
            closest_time = datetime(obj.ticket_list{1}{3},'InputFormat','HH:mm');
            for i = 2 : obj.num_tickets
                if datetime(obj.ticket_list{i}{3},'InputFormat','HH:mm') < closest_time
                    closest_time_ticket = obj.ticket_list{i};
                end
            end
            return
        end
        function time_conflict_state = time_conflict_handle(obj,start_time,end_time)
            %处理某订单是否时间与已购买车票有冲突，如果有，返回True，否则返回False
            time_conflict_state = false;
            if obj.num_tickets == 0
                return
            end
            s_time = datetime(start_time,'InputFormat','HH:mm');
            e_time = datetime(end_time,'InputFormat','HH:mm');
            for i = 1 : obj.num_tickets
                if (s_time >= datetime(obj.ticket_list{i}{3},'InputFormat','HH:mm')) && (s_time <= datetime(obj.ticket_list{i}{4},'InputFormat','HH:mm'))
                    time_conflict_state = true;
                    return
                end
                if (e_time >= datetime(obj.ticket_list{i}{3},'InputFormat','HH:mm')) && (e_time <= datetime(obj.ticket_list{i}{4},'InputFormat','HH:mm'))
                    time_conflict_state = true;
                    return
                end                
            end
            return
        end
    end
end

