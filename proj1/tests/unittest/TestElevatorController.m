classdef TestElevatorController < matlab.unittest.TestCase
    properties
        elevatorController
    end
    
    methods(TestMethodSetup)
        function launchAPP(testcase)
            f = 3;
            t = 0.5;
            openTime = 3;
            ele_1 = Elevator(1);
            ele_2 = Elevator(2);
            control = ElevatorController(f, openTime);
            
            inUI_1 = ElevatorUI(control, ele_1, 1);
            inUI_2 = ElevatorUI(control, ele_2, 2);
            
            outUI_1 = Floor1UI;
            outUI_2 = Floor2UI;
            outUI_3 = Floor3UI;
            
            control.elevator_1 = ele_1;
            control.elevator_2 = ele_2;
            control.elevatorInUI_1 = inUI_1;
            control.elevatorInUI_2 = inUI_2;
            control.elevatorOutUI_1 = outUI_1;
            control.elevatorOutUI_2 = outUI_2;
            control.elevatorOutUI_3 = outUI_3;
            
            outUI_1.control = control;
            outUI_2.control = control;
            outUI_3.control = control;
            control.Timer = timer('ExecutionMode', 'fixedRate', ...    
                'Period', t, ... 
                'TimerFcn', @control.timerFcn);
            testcase.elevatorController = control;
        end
    end

    methods (Test)
        function test_dis(testcase)
            %T1.2.1.1
            testcase.elevatorController.elevator_1.position = 0;
            dis = testcase.elevatorController.dis(1, 1);
            testcase.verifyEqual(dis, 1);
            %T1.2.1.2
            testcase.elevatorController.elevator_1.position = 2;
            dis = testcase.elevatorController.dis(1, 1);
            testcase.verifyEqual(dis, 1);
            %T1.2.1.3
            testcase.elevatorController.elevator_1.position = 0;
            dis = testcase.elevatorController.dis(2, 1);
            testcase.verifyEqual(dis, 1);
            %T1.2.1.4
            testcase.elevatorController.elevator_1.position = 2;
            dis = testcase.elevatorController.dis(2, 1);
            testcase.verifyEqual(dis, 1);
        end

        function test_goto(testcase)
            %T1.2.2.1
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            ret = testcase.elevatorController.goto(0, 0);
            testcase.verifyEqual(ret, 1);

            %T1.2.2.2
            testcase.elevatorController.elevator_1.position = 1;
            testcase.elevatorController.elevator_1.height = 3;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            ret = testcase.elevatorController.goto(0, 0);
            testcase.verifyEqual(ret, 1);
    
            %T1.2.2.3
            testcase.elevatorController.elevator_1.position = 1;
            testcase.elevatorController.elevator_1.height = 3;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            ret = testcase.elevatorController.goto(0, 2);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.4
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_2.position = 1;
            testcase.elevatorController.elevator_2.height = 3;
            testcase.elevatorController.elevator_2.Alarm = 0;
            ret = testcase.elevatorController.goto(0, 2);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.5
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            testcase.elevatorController.elevator_2.direction = 'up';
            ret = testcase.elevatorController.goto(0, 2);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.6
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            testcase.elevatorController.elevator_2.direction = 'idle';
            ret = testcase.elevatorController.goto(1, 0);
            testcase.verifyEqual(ret, 1);

            %T1.2.2.7
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            ret = testcase.elevatorController.goto(1, 1);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.8
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            ret = testcase.elevatorController.goto(1, 1);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.9
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            testcase.elevatorController.elevator_2.direction = 'idle';
            ret = testcase.elevatorController.goto(2, 0);
            testcase.verifyEqual(ret, 1);

            %T1.2.2.10
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            ret = testcase.elevatorController.goto(2, 1);
            testcase.verifyEqual(ret, 0);

            %T1.2.2.11
            testcase.elevatorController.elevator_2.position = 0;
            testcase.elevatorController.elevator_2.height = 0;
            testcase.elevatorController.elevator_2.Alarm = 0;
            testcase.elevatorController.elevator_2.direction = 'up';
            ret = testcase.elevatorController.goto(2, 1);
            testcase.verifyEqual(ret, 0);
        end

        function test_getAlarmValue(testcase)
            %T1.2.3.1
            ret = testcase.elevatorController.getAlarmValue(1);
            testcase.verifyEqual(ret, 0);
        
            %T1.2.3.2
            ret = testcase.elevatorController.getAlarmValue(2);
            testcase.verifyEqual(ret, 0);
        end

        function test_openDoorAtFloor(testcase)
            %T1.2.4.1
            testcase.elevatorController.openDoorAtFloor(1, 0);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_1.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1);

            %T1.2.4.2
            testcase.elevatorController.openDoorAtFloor(1, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1);

            %T1.2.4.3
            testcase.elevatorController.openDoorAtFloor(2, 2);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_3.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1);
        end

        function test_pushOpenDoorAtFloor(testcase)
            %T1.2.5.1
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            testcase.elevatorController.pushOpenDoorAtFloor(1, 0);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_1.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.2
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 1;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            testcase.elevatorController.pushOpenDoorAtFloor(1, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.3
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 2;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.task(3) = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            testcase.elevatorController.pushOpenDoorAtFloor(1, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.4
            testcase.elevatorController.elevator_1.position = 2;
            testcase.elevatorController.elevator_1.height = 2;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'down';
            testcase.elevatorController.pushOpenDoorAtFloor(1, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.5
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 1;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.task(2) = 0;
            testcase.elevatorController.elevator_1.direction = 'down';
            testcase.elevatorController.pushOpenDoorAtFloor(1, 2);
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_3.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.6
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 0;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            testcase.elevatorController.pushOpenDoorAtFloor(2, 0);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_1.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.7
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 1;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            testcase.elevatorController.pushOpenDoorAtFloor(2, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.8
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 2;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.task(3) = 0;
            testcase.elevatorController.elevator_1.direction = 'up';
            testcase.elevatorController.pushOpenDoorAtFloor(2, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.9
            testcase.elevatorController.elevator_1.position = 2;
            testcase.elevatorController.elevator_1.height = 2;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.direction = 'down';
            testcase.elevatorController.pushOpenDoorAtFloor(2, 1);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.5.10
            testcase.elevatorController.elevator_1.position = 0;
            testcase.elevatorController.elevator_1.height = 1;
            testcase.elevatorController.elevator_1.Alarm = 0;
            testcase.elevatorController.elevator_1.task(2) = 0;
            testcase.elevatorController.elevator_1.direction = 'down';
            testcase.elevatorController.pushOpenDoorAtFloor(2, 2);
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'open_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_3.door1Image.ImageSource, 'open_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)
        end

        function test_closeDoorAtFloor(testcase)
            %T1.2.6.1
            testcase.elevatorController.closeDoorAtFloor(1, 0)
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'close_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_1.door1Image.ImageSource, 'close_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.6.2
            testcase.elevatorController.closeDoorAtFloor(1, 1)
            if strcmp(testcase.elevatorController.elevatorInUI_1.doorImage.ImageSource, 'close_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_2.door1Image.ImageSource, 'close_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.6.3
            testcase.elevatorController.closeDoorAtFloor(2, 2)
            if strcmp(testcase.elevatorController.elevatorInUI_2.doorImage.ImageSource, 'close_e.png')
                ret1 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            if strcmp(testcase.elevatorController.elevatorOutUI_3.door1Image.ImageSource, 'close_f.png')
                ret2 = 1;
            end
            testcase.verifyEqual(ret2, 1)

            %T1.2.6.4
            testcase.elevatorController.closeDoorAtFloor(3, 3);
        end

        function test_getUIDirect(testcase)
            %T1.2.7.1
            ret = testcase.elevatorController.getUIDirect('up');
            testcase.verifyEqual(ret, '↑');

            %T1.2.7.2
            ret = testcase.elevatorController.getUIDirect('down');
            testcase.verifyEqual(ret, '↓');

            %T1.2.7.3
            ret = testcase.elevatorController.getUIDirect('idle');
            testcase.verifyEqual(ret, ' ');
        end

        function test_updateOutButton(testcase)
            %T1.2.8.1
            testcase.elevatorController.task(2) = 1;
            testcase.elevatorController.elevatorOutUI_1.Button.Enable = 'off';
            testcase.elevatorController.updateOutButton(0);
            ret = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_1.Button.Enable, 'on')
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);

            %T1.2.8.2
            testcase.elevatorController.task(2) = 1;
            testcase.elevatorController.elevatorOutUI_1.Button.Enable = 'on';
            testcase.elevatorController.updateOutButton(0);
            ret = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_1.Button.Enable, 'on')
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);

            %T1.2.8.3
            testcase.elevatorController.task(3) = 1;
            testcase.elevatorController.elevatorOutUI_2.upButton.Enable = 'off';
            testcase.elevatorController.elevatorOutUI_2.downButton.Enable = 'off';
            testcase.elevatorController.updateOutButton(1);
            ret1 = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_2.upButton.Enable, 'on')
                ret1 = 1;
            end
            ret2 = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_2.downButton.Enable, 'on')
                ret2 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            testcase.verifyEqual(ret2, 1);

            %T1.2.8.4
            testcase.elevatorController.task(3) = 1;
            testcase.elevatorController.elevatorOutUI_2.upButton.Enable = 'on';
            testcase.elevatorController.elevatorOutUI_2.downButton.Enable = 'on';
            testcase.elevatorController.updateOutButton(1);
            ret1 = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_2.upButton.Enable, 'on')
                ret1 = 1;
            end
            ret2 = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_2.downButton.Enable, 'on')
                ret2 = 1;
            end
            testcase.verifyEqual(ret1, 1);
            testcase.verifyEqual(ret2, 1);

            %T1.2.8.5
            testcase.elevatorController.task(4) = 1;
            testcase.elevatorController.elevatorOutUI_3.downButton.Enable = 'off';
            testcase.elevatorController.updateOutButton(2);
            ret = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_3.downButton.Enable, 'on')
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);

            %T1.2.8.6
            testcase.elevatorController.task(4) = 1;
            testcase.elevatorController.elevatorOutUI_3.downButton.Enable = 'on';
            testcase.elevatorController.updateOutButton(2);
            ret = 0;
            if strcmp(testcase.elevatorController.elevatorOutUI_3.downButton.Enable, 'on')
                ret = 1;
            end
            testcase.verifyEqual(ret, 1);
        end
    end
end