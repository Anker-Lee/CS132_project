classdef userdb < handle
    properties
        Users
    end
    
    methods
        function obj = userdb()
            obj.Users = containers.Map();
        end
        
        function state = addUser(obj, user)
            if ~obj.Users.isKey(user.Account)
                obj.Users(user.Account) = user;
                state = true;
            else
                disp('用户已存在，无法添加。');
                state = false;
            end
        end
        
        function user = getUser(obj, account)
            if obj.Users.isKey(account)
                user = obj.Users(account);
            else
                user = [];
            end
        end
        
        function state = login(obj, account, password)
            user = obj.getUser(account);
            if ~isempty(user) && strcmp(user.Password, password)
                if user.state
                    user.state = false;
                    state = true;
                else
                    state = false;
                end
            else
                state = false;
            end
        end
    end
end


