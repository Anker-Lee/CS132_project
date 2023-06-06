classdef TestElevator < matlab.unittest.TestCase
    properties
        elevatorController
    end
    
    methods(TestMethodSetup)
        function launchAPP(testcase)
            elevator = Elevator(1);
            testcase.elevatorController = ElevatorController(3, 3);
            testcase.elevatorController.elevator_1 = elevator;
        end
    end

    methods (Test)
        %T1.1.1
        function test_move(testcase)
            %up
            testcase.elevatorController.elevator_1.setDestination(2);
            %T1.1.1.1
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 1.5)
            %T1.1.1.2
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 4.5)
            %T1.1.1.3
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 6)
            testcase.elevatorController.elevator_1.task(4) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';

            testcase.elevatorController.elevator_1.setDestination(1);
            %T1.1.1.4
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 4.5)
            %T1.1.1.5
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 3)
            %T1.1.1.6
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 1.5)

            testcase.elevatorController.elevator_1.task(4) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            testcase.elevatorController.elevator_1.height = 6;
            testcase.elevatorController.elevator_1.position = 2;

            %down
            testcase.elevatorController.elevator_1.setDestination(0);
            %T1.1.1.7
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 3)
            %T1.1.1.8
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 0)
            %T1.1.1.9
            testcase.elevatorController.elevator_1.move(0.5);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, -1.5)
            testcase.elevatorController.elevator_1.task(2) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';

            testcase.elevatorController.elevator_1.setDestination(1);
            %T1.1.1.10
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, -3)
            %T1.1.1.11
            testcase.elevatorController.elevator_1.move(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, -1.5)
            %T1.1.1.12
            testcase.elevatorController.elevator_1.move(0.5);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.height, 0.0)
            testcase.elevatorController.elevator_1.task(2) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
        end
        
        function test_setDestination(testcase)
            testcase.elevatorController.elevator_1.position = 1;
            testcase.elevatorController.elevator_1.height = 3;
            %T1.1.2.1
            testcase.elevatorController.elevator_1.setDestination(0);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.task(2), 1)
            testcase.verifyEqual(testcase.elevatorController.elevator_1.direction, 'down')
            testcase.elevatorController.elevator_1.task(2) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            %T1.1.2.2
            testcase.elevatorController.elevator_1.setDestination(1);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.task(3), 1)
            testcase.verifyEqual(testcase.elevatorController.elevator_1.direction, 'idle')
            testcase.elevatorController.elevator_1.task(3) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
            %T1.1.2.3
            testcase.elevatorController.elevator_1.setDestination(2);
            testcase.verifyEqual(testcase.elevatorController.elevator_1.task(4), 1)
            testcase.verifyEqual(testcase.elevatorController.elevator_1.direction, 'up')
            testcase.elevatorController.elevator_1.task(3) = 0;
            testcase.elevatorController.elevator_1.direction = 'idle';
        end
    end

end
