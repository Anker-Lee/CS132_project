classdef TestCheckTicket < matlab.uitest.TestCase
    properties
        UI;
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            testcase.UI = checkticket;
        end
    end

    methods(Test)
        %t1.9.1
        function test_SwitchValueChanged(testcase)
            % T1.9.1.1
            testcase.verifyEqual(testcase.UI.Button.Value,true);
            testcase.choose(testcase.UI.Switch,'Off');
            testcase.verifyEqual(testcase.UI.Button.Value,false);
            testcase.choose(testcase.UI.Switch,'On');
            testcase.verifyEqual(testcase.UI.Button.Value,true);    
            delete(testcase.UI);
        end
    end
end