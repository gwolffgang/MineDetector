function field_click(x,y,click)
%FIELD_CLICK Summary of this function goes here
%   Ruft bei Links-Klick die delete_buttons Funktion auf. Bei Rechts-Klick wird Feld als Mine
%   markiert und kann nicht mehr ausgelöst werden. Wird erneut auf das markierte Feld geklickt, 
%   verschwindet das Minen-Symbol wieder und das Feld kann wieder ausgelöst werden. Überprüft ob das Spiel verloren bzw. gewonnen ist. 

    global values  handles;
    if values.game_over == false
        if strcmp(click,'lc') == 1
            if strcmp(get( handles.field(x,y),'string'),'Mine?!') == 0
                if values.Minefield(x,y) == 0
                    delete_buttons(x,y);
                    if values.fields_to_find == 0
                    game_won;
                    end
                else
                    if values.Minefield(x,y) == -1
                        game_lost;
                    else
                        delete(handles.field(x,y));
                        values.fields_to_find = values.fields_to_find -1;
                        if values.fields_to_find == 0
                            game_won;
                        end
                    end
                end
            end
        else
            if strcmp(get(handles.field(x,y),'string'),'') == 1
                set(handles.field(x,y),'string','Mine?!');
                values.Mines_left=values.Mines_left-1;
                set(handles.Mines,'string',values.Mines_left);
            else
                set(handles.field(x,y),'string','');
                values.Mines_left=values.Mines_left+1;
                set(handles.Mines,'string',values.Mines_left);
            end
        end
    end
end

function game_won
    global values;
    Win
    stop(timerfind('Name','timer'));
    values.game_over = true;
end


function game_lost
    global values;
    
    stop(timerfind('Name','timer'));
    values.game_over = true;
end
