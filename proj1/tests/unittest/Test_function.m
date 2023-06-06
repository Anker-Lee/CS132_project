classdef Test_function < matlab.uitest.TestCase
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
        function test_open(testCase)
            %T3.1.1.1
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;

            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.openButton);
            pause(1);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)

            testCase.press(testCase.inUI_2.openButton);
            pause(4);
            ret = 0;
            if strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)
        end

        function test_reachPlace(testCase)
            %T3.1.1.2
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;

            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.outUI_2.upButton);
            pause(3);
            ret = 0;
            if strcmp(testCase.outUI_2.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_close(testCase)
            %T3.2.1.1
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;

            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.openButton);
            testCase.press(testCase.inUI_2.openButton);
            pause(1);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png')
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
            testCase.press(testCase.inUI_1.closeButton);
            testCase.press(testCase.inUI_2.closeButton);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png')
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)

            %T3.2.1.2
            testCase.press(testCase.inUI_1.openButton);
            testCase.press(testCase.inUI_2.openButton);

            testCase.press(testCase.inUI_1.closeButton);
            testCase.press(testCase.inUI_2.closeButton);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)
        end

        function test_reachPlace2(testCase)
            %T3.2.2
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;

            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.outUI_2.upButton);
            ret = 0;
            if strcmp(testCase.outUI_2.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)
        end

        function test_Alarm(testCase)
            %T3.3.1.1
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.AlarmButton);
            testCase.press(testCase.inUI_2.AlarmButton);
            testCase.press(testCase.inUI_1.closeButton);
            testCase.press(testCase.inUI_2.closeButton);

            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_human(testCase)
            %T3.3.1.2
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;
    
            testCase.press(testCase.inUI_1.openButton);
            testCase.press(testCase.inUI_2.openButton);
            pause(2);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
            testCase.press(testCase.inUI_1.HumanEnterSensorButton);
            testCase.press(testCase.inUI_2.HumanEnterSensorButton);
            pause(2);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_Overweight(testCase)
            %T3.3.1.3
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.OverWeightSensorButton);
            testCase.press(testCase.inUI_2.OverWeightSensorButton);

            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)
        end

        function test_reachAlarm(testCase)
            %T3.3.1.1
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_2.Elevator.height = 0;
            testCase.inUI_2.Elevator.position = 0;

            testCase.press(testCase.inUI_1.AlarmButton);
            testCase.press(testCase.inUI_2.AlarmButton);
            testCase.press(testCase.outUI_3.downButton);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)

            pause(3);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_reachhuman(testCase)
            %T3.3.1.2
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;
    
            testCase.press(testCase.outUI_2.upButton);
            testCase.press(testCase.inUI_1.HumanEnterSensorButton);
            testCase.press(testCase.inUI_2.HumanEnterSensorButton);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 0)
        end

        function test_reachOverweight(testCase)
            %T3.3.1.3
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_1.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.openButton);
            testCase.press(testCase.inUI_2.openButton);
            pause(1);
            testCase.press(testCase.inUI_1.OverWeightSensorButton);
            testCase.press(testCase.inUI_2.OverWeightSensorButton);
            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
            testCase.press(testCase.inUI_1.closeButton);
            testCase.press(testCase.inUI_2.closeButton);

            ret = 0;
            if strcmp(testCase.inUI_1.doorImage.ImageSource, 'open_e.png') == 1 && strcmp(testCase.inUI_2.doorImage.ImageSource, 'open_e.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_FloorInside(testCase)
            %T3.4.1
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_1.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.Button_2);
            testCase.press(testCase.inUI_2.Button_1);
            pause(4);

            ret = 0;
            if strcmp(testCase.outUI_1.door2Image.ImageSource, 'open_f.png') == 1 && strcmp(testCase.outUI_2.door1Image.ImageSource, 'open_f.png') == 1
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_MultipleFloor(testCase)
            %T3.4.2
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_1.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.Button_2);
            testCase.press(testCase.inUI_1.Button_3);

            pause(2);
            ret = 0;
            if strcmp(testCase.outUI_2.door1Image.ImageSource, 'open_f.png') == 1 
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)

            pause(3);
            ret = 0;
            if strcmp(testCase.outUI_3.door1Image.ImageSource, 'open_f.png') == 1 
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end

        function test_CurrentFloor(testCase)
            testCase.inUI_1.Elevator.height = 0;
            testCase.inUI_1.Elevator.position = 0;
            testCase.inUI_1.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.Alarm = 0;
            testCase.inUI_2.Elevator.height = 6;
            testCase.inUI_2.Elevator.position = 2;

            testCase.press(testCase.inUI_1.Button_1);
            pause(1);
            ret = 0;
            if strcmp(testCase.outUI_1.door1Image.ImageSource, 'open_f.png') == 1 
                ret = 1;
            end
            testCase.verifyEqual(ret, 1)
        end
    end
end

