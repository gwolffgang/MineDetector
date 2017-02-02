function field_click(x,y,click)
%FIELD_CLICK Summary of this function goes here
%   Ruft bei Links-Klick die delete_buttons Funktion auf. Bei Rechts-Klick wird Feld als Mine
%   markiert und kann nicht mehr ausgelöst werden. Wird erneut auf das markierte Feld geklickt, 
%   verschwindet das Minen-Symbol wieder und das Feld kann wieder ausgelöst werden. Überprüft ob das Spiel verloren bzw. gewonnen ist. 

    global values handles;
    
    if values.game_over == false
        if strcmp(click,'lc') == 1
            if strcmp(get(handles.field(x,y),'String'),' ') == 0
                if values.Minefield(x,y) == 0
                    delete_buttons(x,y);
                else
                    if values.Minefield(x,y) == -1
                        game_lost;
                    else
                        delete(handles.field(x,y));
                        values.fields_to_find = values.fields_to_find -1;
                    end
                end
                if values.fields_to_find == 0
                    game_won;
                end
            end
        else
            values.img_flag = imread('Flag-2400px.png', 'png');
            % Red Flag (https://openclipart.org/detail/170768/red-flag) by ky1en1te
            if strcmp(get(handles.field(x,y),'String'),'') == 1
                set(handles.field(x,y),'String',' ');
                values.img_flag = imresize(values.img_flag, values.img_size);
            else
                set(handles.field(x,y),'String','');
                values.img_flag = imresize(values.img_flag, [0.01 0.01]);
            end
            set(handles.field(x,y),'CData', values.img_flag);
        end
    end
end

function game_lost
    global values handles;
    
    values.img_mine = imresize(values.img_mine, values.img_size);
    for i=1:1:values.height
        for j=1:1:values.width
            if ishandle(handles.field(i,j))
                if strcmp(get(handles.cb_txt(i,j),'String'),'-1') == 1
                    set(handles.field(i,j),'CData', values.img_mine);
                end
            end  
        end
    end
    stop(timerfind('Name','timer'));
    values.game_over = true;
end
