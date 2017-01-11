function field_click(x,y,click)
%FIELD_CLICK Summary of this function goes here
%   Detailed explanation goes here

    global values;

    if strcmp(click,'lc') == 1
        if strcmp(get(values.field(x,y),'string'),'Mine?!') == 0
            if values.Minefield(x,y) == 0
                delete_buttons(x,y);
            else
                if values.Minefield(x,y) == -1
                    close(values.fig_handle);
                else
                    delete(values.field(x,y));
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

