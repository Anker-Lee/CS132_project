close all;

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
Back = Backend;

control.Back = Back;
control.elevator_1 = ele_1;
control.elevator_2 = ele_2;
control.elevatorInUI_1 = inUI_1;
control.elevatorInUI_2 = inUI_2;
control.elevatorOutUI_1 = outUI_1;
control.elevatorOutUI_2 = outUI_2;
control.elevatorOutUI_3 = outUI_3;

Back.control = control;
outUI_1.control = control;
outUI_2.control = control;
outUI_3.control = control;


control.Timer = timer('ExecutionMode', 'fixedRate', ...    
    'Period', t, ... 
    'TimerFcn', @control.timerFcn); 