function delete_buttons(x,y)
%DELETEBUTTONS Summary of this function goes here
%  Löscht Buttons im direkten Umfeld des angeklickten Buttons, speichert
%  diese dann und wiederholt den Vorgang bis der Speicher leer ist, wobei
%  sicher gestellt wird, dass kein Button zweimal in die Liste kommt. 
global values handles;

M=[x
   y];
delete(handles.field(x,y));
values.fields_to_find = values.fields_to_find -1;
while(~isempty(M))
    field_x = M(1,1);
    field_y = M(2,1);
    for i=(-1):1:1
        for j=(-1):1:1
            if field_x+i > 0 && field_y+j > 0 && field_x+i <= values.height && field_y+j <= values.width
                if ~isempty(handles.field(field_x+i, field_y+j )) && ishandle(handles.field(field_x+i, field_y+j ))
                    delete(handles.field(field_x+i,(field_y+j)))
                    values.fields_to_find = values.fields_to_find -1;
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
