classdef TestUI < matlab.uitest.TestCase
    properties
        inUI_1
        inUI_2
        outUI_1
        outUI_2
        outUI_3
    end
    
    methods (TestMethodSetup)
        function launchApp(testCase)
            f = 3;
            t = 0.5;
            openTime = 3;
            ele_1 = Elevator(1);
            ele_2 = Elevator(2);
            control = ElevatorController(f, openTime);
            
            testCase.inUI_1 = ElevatorUI(control, ele_1, 1);
            testCase.inUI_2 = ElevatorUI(control, ele_2, 2);
            
            testCase.outUI_1 = Floor1UI;
            testCase.outUI_2 = Floor2UI;
            testCase.outUI_3 = Floor3UI;
            
            control.elevator_1 = ele_1;
            control.elevator_2 = ele_2;
            control.elevatorInUI_1 = testCase.inUI_1;
            control.elevatorInUI_2 = testCase.inUI_2;
            control.elevatorOutUI_1 = testCase.outUI_1;
            control.elevatorOutUI_2 = testCase.outUI_2;
            control.elevatorOutUI_3 = testCase.outUI_3;
            
            testCase.outUI_1.control = control;
            testCase.outUI_2.control = control;
            testCase.outUI_3.control = control;

            control.Timer = timer('ExecutionMode', 'fixedRate', ...    
                'Period', t, ... 
                'TimerFcn', @control.timerFcn);
        end
    end
    
    methods (Test)
        function testOpenDoorButton(testCase)
            % T3.1.1: Operation of door
            testCase.press(testCase.inUI_1.openButton);
            ret = 0;
            if testCase.inUI_1.doorImage.ImageSource == 'open_e.png'
             ret = 1;
            end
            pause(3);
            testCase.verifyEqual(ret, 1);

            testCase.press(testCase.inUI_2.openButton);
            ret = 0;
            if testCase.inUI_2.doorImage.ImageSource == 'open_e.png'
                ret = 1;
            end
            pause(3);
            testCase.verifyEqual(ret, 1);
        end

        function test_elevator(testcase)
            % T3.1.2: elevator move
            testcase.press(testcase.inUI_1.Button_2);
            pause(3)
            ret = 0;
            if strcmp(testcase.outUI_2.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);


            testcase.press(testcase.inUI_1.Button_1);
            pause(5)
            ret = 0;
            if strcmp(testcase.outUI_1.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);

            testcase.press(testcase.inUI_2.Button_2);
            pause(3)
            ret = 0;
            if strcmp(testcase.outUI_2.door2Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);

            testcase.press(testcase.outUI_3.downButton);
            pause(5)
            ret = 0;
            if strcmp(testcase.outUI_3.door2Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);
        end

        function test_Alarm(testcase)
            % T3.1.3: test special button
            testcase.press(testcase.inUI_1.AlarmButton);
            pause(2)
            ret = 0;
            if strcmp(testcase.outUI_1.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);
        end
    end
       
end

