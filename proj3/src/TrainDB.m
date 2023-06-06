classdef TrainDB < handle
    %TRAINDB 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        TrainList
    end
    
    methods
        function register(obj,Train)
            %TRAINDB 构造此类的实例
            %   此处显示详细说明
            obj.TrainList = [obj.TrainList;Train];
        end
        function deleteTrain(obj, Train)
            % 查找要删除的 Train 在 TrainList 中的索引
            idx = find(obj.TrainList == Train);
            
            % 如果找到了匹配的索引，则从 TrainList 中删除对应的 Train
            if ~isempty(idx)
                obj.TrainList(idx) = [];
            else
                disp('Train not found in TrainDB.');
            end
        end
    end
end

