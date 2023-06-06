classdef train < handle
    %TRAIN 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        train_id
        price
        from 
        to
        depart_at
        arrive_at
        stops cell
        %schedule
    end
    
    methods
        function obj = train(train_id,price,from,to,depart_at,arrive_at,stops)
            %TRAIN 构造此类的实例
            %   此处显示详细说明
            obj.train_id = train_id;
            obj.price = price;
            obj.depart_at = depart_at;
            obj.arrive_at = arrive_at;
            obj.from = from;
            obj.to = to;
            obj.stops = stops;
            %obj.schedule = schedule;
        end
        function result = has_start_City(obj, city)
            % 检查 stops 列表中是否包含特定的城市名
            for i = 1:size(obj.stops,1)-1
                if contains(obj.stops{i,1}, city)
                    result = true;
                    return;
                end
            end
            result = false;
        end
        function result = has_end_City(obj, city)
            % 检查 stops 列表中是否包含特定的城市名
%             if contains(obj.stops{2,1}, obj.to)
%                 if contains(obj.stops{2,1}, city)
%                     result = true;
%                     return;
%                 else
%                     result = false;
%                 end
%             else
%                 for i = 2:length(obj.stops)
%                     if contains(obj.stops{i,1}, city)
%                         result = true;
%                         return;
%                     end
%                 end
%             result = false;
%             end
            for i = 2:size(obj.stops,1)
                if contains(obj.stops{i,1}, city)
                    result = true;
                    return;
                end
            end
            result = false;            
        end
        function start_index = find_start(obj,city)
            for i = 1:size(obj.stops,1)-1
                if contains(obj.stops{i,1}, city)
                    start_index = i;
                    return
                end
            end
        end
        function end_index = find_end(obj,city)
            for i = 2:size(obj.stops,1)
                if contains(obj.stops{i,1}, city)
                    end_index = i;
                    return
                end
            end
        end
        function time = Find_depature_Time(obj,city)
            for i = 1:size(obj.stops,1)
                if contains(obj.stops{i,1}, city)
                    time = obj.stops{i,3};
                    return
                end
            end
        end
        function time = Find_arrive_Time(obj,city)
            for i = 1:size(obj.stops,1)
                if contains(obj.stops{i,1}, city)
                    time = obj.stops{i,2};
                    return
                end
            end
        end
        function NumAvailableTable = Find_num_table(obj,start,ending)
            NumAvailableTable = obj.stops{start,4};
            for i = start:ending-1
                if obj.stops{i,4} < NumAvailableTable
                    NumAvailableTable = obj.stops{i,4};
                end
            end
            return
        end
        function table_manage(obj,start_index,end_index)
            for i = start_index : end_index - 1
                obj.stops{i,4} = obj.stops{i,4} - 1;
            end
        end
        function table_manage_back(obj,start_index,end_index)
            for i = start_index : end_index - 1
                obj.stops{i,4} = obj.stops{i,4} + 1;
            end
        end
        function now_state = train_now_state(obj,now_clock)
            num_station = size(obj.stops,1);
            train_start_station = obj.stops{1,1};
            train_end_station = obj.stops{num_station,1};
            train_journey = strcat('火车从',train_start_station,'开往',train_end_station,',');
            start_time = datetime(obj.stops{1,3},'InputFormat','HH:mm');
            if now_clock <= start_time
                now_state = strcat(train_journey,'目前火车在',obj.stops{1,1},'站,车上还剩座位',num2str(obj.stops{1,4}),'个');
                return
            end
            end_time = datetime(obj.stops{num_station,2},'InputFormat','HH:mm');
            if now_clock >= end_time
                now_state = strcat(train_journey,'目前火车在',obj.stops{num_station,1},'站,车上还剩座位',num2str(obj.stops{num_station,4}),'个');
                return
            end
            if num_station == 2
                now_state = strcat(train_journey,'目前火车从',obj.stops{1,1},'站开往',obj.stops{2,1},'站,车上还剩座位',num2str(obj.stops{1,4}),'个');
                return                
            end
            for i = 2: num_station - 1
                % 两个站之间
                start_time = datetime(obj.stops{i-1,3},'InputFormat','HH:mm');
                end_time = datetime(obj.stops{i,2},'InputFormat','HH:mm');
                if (now_clock > start_time) && (now_clock < end_time)
                    now_state = strcat(train_journey,'目前火车从',obj.stops{i-1,1},'站开往',obj.stops{i,1},'站,车上还剩座位',num2str(obj.stops{i-1,4}),'个');
                    return
                end
                %一个站到达和出发之间
                start_time = datetime(obj.stops{i,2},'InputFormat','HH:mm');
                end_time = datetime(obj.stops{i,3},'InputFormat','HH:mm');
                if (now_clock >= start_time) && (now_clock <= end_time)
                    now_state = strcat(train_journey,'目前火车在',obj.stops{i,1},'站,车上还剩座位',num2str(obj.stops{i,4}),'个');
                    return
                end
            end
            %最后一种情况，在倒数第二个站和最后一个站之间
            now_state = strcat(train_journey,'目前火车从',obj.stops{num_station-1,1},'站开往',obj.stops{num_station,1},'站,车上还剩座位',num2str(obj.stops{num_station-1,4}),'个');
            return
        end
    end
end

