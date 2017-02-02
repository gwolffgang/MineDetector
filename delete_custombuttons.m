function delete_custombuttons
%DELETE_CUSTOMBUTTONS Summary of this function goes here
%  Löscht die Customizing-Buttons. 
global handles;

    if ishandle(handles.custom_close)
        delete(handles.custom_close);
    end
    if ishandle(handles.custom_width_minus)
        delete(handles.custom_width_minus);
    end
    if ishandle(handles.custom_width_value)
        delete(handles.custom_width_value);
    end
    if ishandle(handles.custom_width_plus)
        delete(handles.custom_width_plus);
    end
    if ishandle(handles.custom_height_minus)
        delete(handles.custom_height_minus);
    end
    if ishandle(handles.custom_height_value)
        delete(handles.custom_height_value);
    end
    if ishandle(handles.custom_height_plus)
        delete(handles.custom_height_plus);
    end
    if ishandle(handles.custom_mines_minus)
        delete(handles.custom_mines_minus);
    end
    if ishandle(handles.custom_mines_plus)
        delete(handles.custom_mines_plus);
    end
end
