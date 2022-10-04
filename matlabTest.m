function  exam(port1,port2)

%assumption while the button is pressed an event will be sent each cycle

%define output strings
ButtonOneOn = 'Button one been switched On';
ButtonOneOff = 'Button one been switched Off';
ButtonTwoOn = 'Button two been switched On';
ButtonTwoOff = 'Button two been switched Off';

%define initial measure
ButtonOneMeasure = false;
ButtonTwoMeasure = false;

%define initial button state;
ButtonOneOnState = false;
ButtonTwoOnState = false;

%define flag for handling of "long" presses
ButtonOneFirstPress = true;
ButtonTwoFirstPress = true;

while 1
    
    ButtonOneMeasure = getPress(port1);
    ButtonTwoMeasure = getPress(port2);
    
    %handle first button
    if (ButtonOneMeasure==true)&&(ButtonOneFirstPress==true)
        if (ButtonOneOnState == false)
            ButtonOneOnState = true;
            sendData(ButtonOneOn)
        else
            ButtonOneOnState = false;
            sendData(ButtonOneOff)
        end
        ButtonOneFirstPress = false;
    elseif(ButtonOneMeasure == false)
        ButtonOneFirstPress = true;
    end
    
    %handle second button
    if (ButtonTwoMeasure == true)&&(ButtonTwoFirstPress == true)
        if (ButtonTwoOnState == false)
            ButtonTwoOnState = true;
            sendData(ButtonTwoOn)
        else
            ButtonTwoOnState = false;
            sendData(ButtonTwoOff)
        end
        ButtonTwoFirstPress = false;
    elseif(ButtonTwoMeasure == false)
        ButtonTwoFirstPress = true;
    end

end
end