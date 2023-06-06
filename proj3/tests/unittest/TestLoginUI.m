classdef TestLoginUI < matlab.uitest.TestCase
    properties
        UI;
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            % 创建用户对象
            user1 = User('user1', 'password1');
            % 创建用户数据库对象
            userDB = userdb();
            % 添加用户到数据库
            userDB.addUser(user1); 
            train_db = TrainDB;
            %火车状态后端显示
            train_state_UI = train_state;
            %创建时间
            time = back(train_db,train_state_UI);
            testcase.UI = Login;
            testcase.UI.userDB = userDB;
            testcase.UI.train_db = train_db;
            testcase.UI.time_backend = time;
       
        end
    end

    methods(Test)
        %t1.3.1
        function test_ButtonMinusPushed(testcase)
            % T1.3.1.1
            testcase.UI.TextArea.Value = 'user1';
            testcase.UI.TextArea_2.Value = 'password1';
            testcase.press(testcase.UI.Button);
            % T1.3.1.2
            testcase.UI.TextArea.Value = 'user2';
            testcase.UI.TextArea_2.Value = 'password1';
            testcase.press(testcase.UI.Button);            
        end
    end
end