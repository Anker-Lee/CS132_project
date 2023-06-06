classdef Test_func_Login < matlab.uitest.TestCase
    properties
        UI;
        train_state_UI
        time
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
            testcase.train_state_UI = train_state;
            %创建时间
            testcase.time = back(train_db,testcase.train_state_UI);
            testcase.UI = Login;
            testcase.UI.userDB = userDB;
            testcase.UI.train_db = train_db;
            testcase.UI.time_backend = testcase.time;
       
        end
    end

    methods(Test)
        %t3.2
        function test_Login(testcase)
            %t3.2.1
            testcase.type(testcase.UI.TextArea,'user1');
            testcase.type(testcase.UI.TextArea_2,'password1');
            testcase.press(testcase.UI.Button);
            pause(1);
            %t3.2.2
            testcase.press(testcase.UI.Button);
            pause(2);
            %t3.2.3
            testcase.type(testcase.UI.TextArea,'user2');
            pause(0.3);
            testcase.type(testcase.UI.TextArea_2,'password1');
            testcase.press(testcase.UI.Button);
            delete(testcase.UI);
            delete(testcase.train_state_UI);
            delete(testcase.time.UI);
        end
    end
end