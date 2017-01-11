function generate_buttons()
%GENERATE_BUTTONS Summary of this function goes here
%   Detailed explanation goes here

    global values;

    delete(values.pb_handle_easy);
    delete(values.pb_handle_medium); 
    delete(values.pb_handle_hard);

    values.field_size = [1/values.width 0.9/values.height];
    for i=1:1:values.height
        for j=1:1:values.width
            field_x = num2str(i);
            field_y = num2str(j);
            cb_rightclick = strcat(' rc|', field_x, '|', field_y);
            cb_leftclick = strcat(' lc|', field_x, '|', field_y);
            values.field(i,j) = uicontrol(values.fig_handle,...
                'Style','push',...
                'Unit','normalized',...
                'Position',[1/values.width*(j-1) 0.9/values.height*(i-1) values.field_size],...
                'ButtonDownFcn',[values.MD cb_rightclick],...
                'Callback',[values.MD cb_leftclick]);
        end
    end
end

