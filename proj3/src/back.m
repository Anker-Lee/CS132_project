classdef back < handle
    properties
        UI;   
        Clock;
        time;
        time_period;
        train_db;
        train_state_UI;
    end
    methods
        function obj = back(train_db,train_state_ui)
            obj.UI = front;
            obj.UI.setAppController(obj);
            obj.train_db = train_db;
            obj.train_state_UI = train_state_ui;
            obj.time = timer;
            obj.time.TimerFcn = @obj.TimerCallBackFunction;
            obj.time.ExecutionMod = 'fixedSpacing';
            obj.time.Period = 1;
            obj.time_period = 5;
            obj.Clock = datetime('00:00:00','format','HH:mm:ss');
            start(obj.time);
        end
        function TimerCallBackFunction(obj, ~, ~)
            if obj.UI.Button.Value
                obj.Clock = obj.Clock + seconds(obj.time_period);
            end
             obj.UI.ClockLabel.Text = char(obj.Clock);
             train = obj.train_db.TrainList(1);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G11TextArea.Value = train_state;
             train = obj.train_db.TrainList(2);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G13TextArea.Value = train_state;  
             train = obj.train_db.TrainList(3);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G15TextArea.Value = train_state;
             train = obj.train_db.TrainList(4);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G24TextArea.Value = train_state;
             train = obj.train_db.TrainList(5);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G26TextArea.Value = train_state; 
             train = obj.train_db.TrainList(6);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D11TextArea.Value = train_state; 
             train = obj.train_db.TrainList(7);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D13TextArea.Value = train_state; 
             train = obj.train_db.TrainList(8);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D15TextArea.Value = train_state; 
             train = obj.train_db.TrainList(9);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D17TextArea.Value = train_state; 
             train = obj.train_db.TrainList(10);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D12TextArea.Value = train_state; 

             train = obj.train_db.TrainList(11);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D21TextArea.Value = train_state;
             train = obj.train_db.TrainList(12);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D22TextArea.Value = train_state;  
             train = obj.train_db.TrainList(13);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D23TextArea.Value = train_state;
             train = obj.train_db.TrainList(14);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D24TextArea.Value = train_state;
             train = obj.train_db.TrainList(15);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D25TextArea.Value = train_state; 
             train = obj.train_db.TrainList(16);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D26TextArea.Value = train_state; 
             train = obj.train_db.TrainList(17);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G12TextArea.Value = train_state; 
             train = obj.train_db.TrainList(18);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G14TextArea.Value = train_state; 
             train = obj.train_db.TrainList(19);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G16TextArea.Value = train_state; 
             train = obj.train_db.TrainList(20);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D14TextArea.Value = train_state; 
             
             train = obj.train_db.TrainList(21);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D16TextArea.Value = train_state;
             train = obj.train_db.TrainList(22);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.D18TextArea.Value = train_state;  
             train = obj.train_db.TrainList(23);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G22TextArea.Value = train_state;
             train = obj.train_db.TrainList(24);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G21TextArea.Value = train_state;
             train = obj.train_db.TrainList(25);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G23TextArea.Value = train_state; 
             train = obj.train_db.TrainList(26);
             train_state = train.train_now_state(obj.Clock);
             obj.train_state_UI.G25TextArea.Value = train_state;              
         end
         function setFunction(obj,hour,minute,second)
             change_time = strcat(hour,':',minute,':',second);
            obj.Clock = datetime(change_time,'format','HH:mm:ss');
         end
         function obj = setspeed(obj)
             if strcmp(obj.UI.DropDown.Value,'10秒/1秒')
                 obj.time_period = 10;
             elseif strcmp(obj.UI.DropDown.Value,'20秒/1秒')
                 obj.time_period = 20;
             else
                 obj.time_period = 5;
             end
         end
    end
    
end