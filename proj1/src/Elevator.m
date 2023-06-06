classdef Elevator < handle
    properties(Access = public)
        id
        position = 0
        state = 0
        direction = 'idle'
        Alarm = 0
        height = 0
        speed = 0
        acceleration = 3
        maxSpeed = 3
        destin
        task = [0, 0, 0, 0]
    end
    
    methods
        function obj = Elevator(id)
            obj.id = id;
        end
        
        function move(elevator, t)
            if strcmp(elevator.direction, 'idle')
                return
            end

            pos = elevator.position;
            h = elevator.height;
            switch(elevator.direction)
                case 'up'
                    if(h < 6)
                        if(elevator.task(pos+3) == 1 && h-pos*3 >= 1.5 && (elevator.speed)^2/elevator.acceleration <= 2*(3*pos+3-h))
                            newSpeed = elevator.speed - elevator.acceleration*t;
                            elevator.height = h + (elevator.speed + newSpeed)*t /2;
                            elevator.speed = newSpeed;
                            if abs(elevator.height - (pos+1)*3) < 0.001
                                elevator.position = pos +1;
                                elevator.height = elevator.position*3;
                            end
                        elseif(elevator.maxSpeed - elevator.speed > 0.01)
                            newSpeed = elevator.speed + elevator.acceleration*t;                            
                            elevator.height = h + (elevator.speed + newSpeed)*t /2;
                            elevator.speed = newSpeed;
                        else
                            elevator.speed = elevator.maxSpeed;
                            elevator.height = h + elevator.speed*t;
                            if(elevator.height>=0)
                                elevator.position = floor(elevator.height/3);
                            else
                                elevator.position = -floor((-elevator.height)/3);
                            end
                        end
                    end

                case 'down'
                    if(h > 0)
                        if(elevator.task(pos+2) == 1 && pos*3-h >= -1.5 && (elevator.speed)^2/elevator.acceleration <= 2*(h-3*pos+3))%-3->0       
                            newSpeed = elevator.speed + elevator.acceleration*t;
                            elevator.height = h + (elevator.speed + newSpeed)*t /2;
                            elevator.speed = newSpeed;
                            if abs(elevator.height - (elevator.position-1)*3) < 0.001
                                elevator.position = pos -1;
                                elevator.height = elevator.position*3;
                            end
                        elseif(elevator.maxSpeed + elevator.speed > 0.01 )
                            newSpeed = elevator.speed - elevator.acceleration*t;                            
                            elevator.height = h + (elevator.speed + newSpeed)*t /2;
                            elevator.speed = newSpeed;
                        else
                            elevator.speed = -elevator.maxSpeed;
                            elevator.height = elevator.height + elevator.speed*t;
                            if(elevator.height>=0)
                                elevator.position = floor(elevator.height/3);
                            else
                                elevator.position = -floor((-elevator.height)/3);
                            end
                        end
                    end
            end
        end

        function setDestination(elevator, floor)
            elevator.task(floor+2) = 1;
            elevator.destin = floor;
            if(elevator.position > floor)       
                    elevator.direction = 'down';
            end
            if(elevator.position < floor)
                elevator.direction = 'up';        
            end
        end
    end
end

