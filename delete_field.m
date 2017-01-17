function delete_field
%DELETEBUTTONS Summary of this function goes here
%   Detailed explanation goes here
global values;
if values.Game>0
    for i=1:1:values.height
        for j=1:1:values.width
            if ishandle(values.field(i,j))
                delete(values.field(i,j));
            end
            if values.Game == 2
                delete(values.cb_txt(i,j));
            end
        end
    end
end

end %delete_field
