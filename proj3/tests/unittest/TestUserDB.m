classdef TestUserDB < matlab.unittest.TestCase
    properties
        Userdb
    end
    
    methods(TestMethodSetup)
        function launchAPP(testcase)
            testcase.Userdb = userdb;
        end
    end

    methods(Test)
        % T1.1.1
        function test_add_user(testcase) 
            % branch cover
            % 创建用户对象
            user1 = User('user1', 'password1');
            % T1.1.1.1
            state = testcase.Userdb.addUser(user1);
            expect_output = true;
            testcase.verifyEqual(state, expect_output);
            % T1.1.1.2
            state = testcase.Userdb.addUser(user1);
            expect_output = false;
            testcase.verifyEqual(state, expect_output);
        end
        %T1.1.2
        function test_getUser(testcase) 
            % statement cover
            % 创建用户对象
            user1 = User('user1', 'password1');
            testcase.Userdb.addUser(user1);
            % T1.1.2.1
            output = testcase.Userdb.getUser('user1');
            expect_output = user1;
            testcase.verifyEqual(output, expect_output);
            % T1.1.2.2
            output = testcase.Userdb.getUser('user2');
            expect_output = [];
            testcase.verifyEqual(output, expect_output);
        end
        %T1.1.3
        function test_login(testcase) 
            % statement cover
            % 创建用户对象
            user1 = User('user1', 'password1');
            testcase.Userdb.addUser(user1);
            % T1.1.3.1
            user1.state = 1;
            output = testcase.Userdb.login('user1', 'password1');
            expect_output = true;
            testcase.verifyEqual(output, expect_output);
            % T1.1.3.2
            user1.state = 0;            
            output = testcase.Userdb.login('user1', 'password1');
            expect_output = false;
            testcase.verifyEqual(output, expect_output);
             % T1.1.3.3
            user1.state = 0;            
            output = testcase.Userdb.login('user2', 'password2');
            expect_output = false;
            testcase.verifyEqual(output, expect_output);           
        end
    end
end