function delete_fields
%DELETE_FIELDS Summary of this function goes here
%   Detailed explanation goes here
global values handles;

for i=1:1:values.old_height
    for j=1:1:values.old_width
        if isfield(handles, 'field') && ishandle(handles.field(i,j))
            delete(handles.field(i,j));
        end
        if values.initilized && values.game_over
            if isfield(handles,'cb_txt') && ishandle(handles.cb_txt(i,j))
                delete(handles.cb_txt(i,j));
            end
        end
    end 
end
values.old_height = values.height;
values.old_width  = values.width;

end %delete_field
