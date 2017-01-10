function deletebuttons(x,y)
%DELETEBUTTONS Summary of this function goes here
%   Detailed explanation goes here
global values;

M=[x
   y];
delete(values.field(x,y));
while(~isempty(M))
    field_x = M(1,1);
    field_y = M(2,1);
    for i=(-1):1:1
        for j=(-1):1:1
            if field_x+i > 0 && field_y+j > 0 && field_x+i <= values.height && field_y+j <= values.width
                if ~isempty(values.field(field_x+i, field_y+j )) && ishandle(values.field(field_x+i, field_y+j ))
                    delete(values.field(field_x+i,(field_y+j)))
                    if (values.Minefield(field_x+i,(field_y+j)) == 0)
                        A=[field_x+i 
                           field_y+j];
                        M=[M A];
                    end
                end
            end
        end
    end
    M(:,1)=[];
end

end