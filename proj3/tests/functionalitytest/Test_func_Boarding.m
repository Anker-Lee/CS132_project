classdef Test_func_Boarding < matlab.uitest.TestCase
    properties
        QueryUI1;
        QueryUI2;
        QueryUI3;
        UserBackend1;
        UserBackend2;
        UserBackend3;
        traindb
        t
    end

    methods (TestMethodSetup)
        function launchApp(testcase)
            train1 = train("G11",4,"上海虹桥","南京南","10:33","11:30",{'上海虹桥', '', '10:33',2; '南京南', '11:30', '',0});
            train2 = train("G13",4,"上海虹桥","南京南","12:03","13:00",{'上海虹桥', '', '12:03',2; '南京南', '13:00', '',0});
            train3 = train("G15",4,"上海虹桥","南京南","13:33","14:30",{'上海虹桥', '', '13:33',2; '南京南', '14:30', '',0});
            
            train17 = train("G12",4,"南京南","上海虹桥","10:33","11:30",{'南京南', '', '10:33',2; '上海虹桥', '11:30', '',0});
            train18 = train("G14",4,"南京南","上海虹桥","12:03","13:00",{'南京南', '', '12:03',2; '上海虹桥', '13:00', '',0});
            train19 = train("G16",4,"南京南","上海虹桥","13:33","14:30",{'南京南', '', '13:33',2; '上海虹桥', '14:30', '',0});
            
            train24 = train("G21",4,"杭州东","南京南","11:03","12:00",{'杭州东', '', '11:03',2; '南京南', '12:00', '',0});
            train25 = train("G23",4,"杭州东","南京南","12:33","13:30",{'杭州东', '', '12:33',2; '南京南', '13:30', '',0});
            train26 = train("G25",4,"杭州东","南京南","14:03","15:00",{'杭州东', '', '14:03',2; '南京南', '15:00', '',0});
            
            train23 = train("G22",4,"南京南","杭州东","11:33","12:00",{'南京南', '', '11:03',2; '杭州东', '12:00', '',0});
            train4 = train("G24",4,"南京南","杭州东","12:33","13:30",{'南京南', '', '12:33',2; '杭州东', '13:30', '',0});
            train5 = train("G26",4,"南京南","杭州东","14:03","15:00",{'南京南', '', '14:03',2; '杭州东', '15:00', '',0});
            
            train6 = train("D11",1,"苏州北","南京南","10:03","11:00",{'苏州北','','10:03',2;'常州北','10:30','10:33',2;'南京南','11:00','',0});
            train10 = train("D12",1,"上海虹桥","杭州东","10:03","11:00",{'上海虹桥','','10:03',2;'嘉兴南','10:30','10:33',2;'杭州东','11:00','',0});
            
            train7 = train("D13",1,"杭州东","南京南","10:03","13:30",{'杭州东','','10:03',2;'嘉兴南','10:30','10:33',2;'上海虹桥','11:00','11:03',2;'苏州北','11:30','11:33',2;'常州北','12:00','12:03',2;'南京南','12:30','',0});
            train8 = train("D15",1,"杭州东","南京南","11:33","14:00",{'杭州东','','11:33',2;'嘉兴南','12:00','12:03',2;'上海虹桥','12:30','12:33',2;'苏州北','13:00','13:03',2;'常州北','13:30','13:33',2;'南京南','14:00','',0});
            train9 = train("D17",1,"杭州东","南京南","13:03","15:30",{'杭州东','','13:03',2;'嘉兴南','13:30','13:33',2;'上海虹桥','14:00','14:03',2;'苏州北','14:30','14:33',2;'常州北','15:00','15:03',2;'南京南','15:30','',0});
            
            train20 = train("D14",1,"南京南","杭州东","10:03","13:30",{'南京南','','10:03',2;'常州北','10:30','10:33',2;'苏州北','11:00','11:03',2;'上海虹桥','11:30','11:33',2;'嘉兴南','12:00','12:03',2;'杭州东','12:30','',0});
            train21 = train("D16",1,"南京南","杭州东","11:33","14:00",{'南京南','','11:33',2;'常州北','12:00','12:03',2;'苏州北','12:30','12:33',2;'上海虹桥','13:00','13:03',2;'嘉兴南','13:30','13:33',2;'杭州东','14:00','',0});
            train22 = train("D18",1,"南京南","杭州东","13:03","15:30",{'南京南','','13:03',2;'常州北','13:30','13:33',2;'苏州北','14:00','14:03',2;'上海虹桥','14:30','14:33',2;'嘉兴南','15:00','15:03',2;'杭州东','15:30','',0});
            
            train11 = train("D21",1,"杭州东","南京南","10:03","12:30",{'杭州东','','10:03',2;'湖州','10:30','10:33',2;'溧阳','11:00','11:03',2;'南京南','12:30','',0});
            train12 = train("D22",1,"南京南","杭州东","10:03","12:30",{'南京南','','10:03',2;'溧阳','10:30','10:33',2;'湖州','11:00','11:03',2;'杭州东','12:30','',0});
            
            train13 = train("D23",1,"杭州东","南京南","11:33","13:00",{'杭州东','','11:33',2;'湖州','12:00','12:03',2;'溧阳','12:30','12:33',2;'南京南','13:00','',0});
            train14 = train("D24",1,"南京南","杭州东","11:33","13:00",{'南京南','','11:33',2;'溧阳','12:00','12:03',2;'湖州','12:30','12:33',2;'杭州东','13:00','',0});
            
            train15 = train("D25",1,"杭州东","南京南","13:03","14:30",{'杭州东','','13:03',2;'湖州','13:30','13:33',2;'溧阳','14:00','14:03',2;'南京南','14:30','',0});
            train16 = train("D26",1,"南京南","杭州东","13:03","14:30",{'南京南','','13:03',2;'溧阳','13:30','13:33',2;'湖州','14:00','14:03',2;'杭州东','14:30','',0});
            
            train_db = TrainDB;
            
            train_db.register(train1);
            train_db.register(train2);
            train_db.register(train3);
            train_db.register(train4);
            train_db.register(train5);
            train_db.register(train6);
            train_db.register(train7);
            train_db.register(train8);
            train_db.register(train9);
            train_db.register(train10);
            train_db.register(train11);
            train_db.register(train12);
            train_db.register(train13);
            train_db.register(train14);
            train_db.register(train15);
            train_db.register(train16);
            train_db.register(train17);
            train_db.register(train18);
            train_db.register(train19);
            train_db.register(train20);
            train_db.register(train21);
            train_db.register(train22);
            train_db.register(train23);
            train_db.register(train24);
            train_db.register(train25);
            train_db.register(train26);
            train_state_UI = train_state;
            time = back(train_db,train_state_UI);
            testcase.traindb = train_db;
            testcase.t = time;
        
        end
    end
    methods(Test)
        %t3.5
        function test_manual_board(testcase)
            testcase.UserBackend1 = user_backend('张三',testcase.traindb,testcase.t);
            testcase.QueryUI1 = testcase.UserBackend1.QueryUI; 
            %t3.5.1
            testcase.choose(testcase.QueryUI1.DropDown_3,'上海');
            testcase.choose(testcase.QueryUI1.DropDown_4,'杭州');
            testcase.press(testcase.QueryUI1.Button_4);
            pause(2);
            testcase.press(testcase.UserBackend1.TrainUI.buttons(1)); 
            pause(1);
            testcase.press(testcase.UserBackend1.OrderUI.Button);
            pause(1);
            testcase.type(testcase.UserBackend1.Time_backend.UI.EditField,10);
            pause(1);
            testcase.press(testcase.UserBackend1.Time_backend.UI.Button);
            pause(1);
            testcase.choose(testcase.UserBackend1.checkUI.Switch,'Off');
            pause(3);
            testcase.press(testcase.UserBackend1.checkUI.Button);
        end 
    end
end