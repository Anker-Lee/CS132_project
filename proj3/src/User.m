classdef User < handle
    %USER 此处显示有关此类的摘要
    %   此处显示详细说明
    
    properties
        Account
        Password
        state
    end
    
    methods
        function obj = User(id,password)
            %USER 构造此类的实例
            %   此处显示详细说明
            obj.Account = id;
            obj.Password = password;
            obj.state = true;
        end
    end
end

