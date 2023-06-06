classdef Test_Login_Query < matlab.uitest.TestCase
    properties
        UI;
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            % 创建用户对象
            user1 = User('user1', 'password1');
            user2 = User('user2', 'password2');
            % 创建用户数据库对象
            userDB = userdb();
            % 添加用户到数据库
            userDB.addUser(user1); 
            userDB.addUser(user2);
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
        %t2.1
        function test_Login(testcase)
            testcase.type(testcase.UI.TextArea,'user1');
            testcase.type(testcase.UI.TextArea_2,'password1');
            testcase.press(testcase.UI.Button);
            testcase.press(testcase.UI.Button);
            testcase.type(testcase.UI.TextArea,'user2');
            testcase.type(testcase.UI.TextArea_2,'password1');
            testcase.press(testcase.UI.Button);
        end
    end
end