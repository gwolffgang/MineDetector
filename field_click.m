function field_click(x,y,click)
%FIELD_CLICK Summary of this function goes here
%   Detailed explanation goes here

    global values;
    if values.game_over == false
        if strcmp(click,'lc') == 1
            if strcmp(get(values.field(x,y),'string'),'Mine?!') == 0
                if values.Minefield(x,y) == 0
                    delete_buttons(x,y);
                else
                    if values.Minefield(x,y) == -1
                        game_lost;
                    else
                        delete(values.field(x,y));
                        values.fields_to_find = values.fields_to_find -1;
                        if values.fields_to_find == 0
                            game_won;
                        end
                    end
                end
            end
        else
            if strcmp(get(values.field(x,y),'string'),'') == 1
                set(values.field(x,y),'string','Mine?!');
            else
                set(values.field(x,y),'string','');
            end
        end
    end
end

function game_won
    global values;
    
    stop(timerfind('Name','timer'));
    values.game_over = true;
end

function game_lost
    global values;
    
    stop(timerfind('Name','timer'));
    values.game_over = true;
end
