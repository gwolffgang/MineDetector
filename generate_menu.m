function generate_menu()
%GENERATE_MENU Summary of this function goes here
%   Detailed explanation goes here

global handles;

    handles.menu_1 = uimenu(handles.fig_main,...
        'Label','&Game');
    handles.menu_1_1 = uimenu(handles.menu_1,...
        'Label','&New');
    handles.menu_1_1_1 = uimenu(handles.menu_1_1,...
        'Label','&Beginner',...
        'Accelerator','1',...
        'Callback',[values.MD ' Beginner']);
    handles.menu_1_1_2 = uimenu(handles.menu_1_1,...
        'Label','&Intermediate',...
        'Accelerator','2',...
        'Callback',[values.MD ' Intermediate']);
    handles.menu_1_1_3 = uimenu(handles.menu_1_1,...
        'Label','&Expert',...
        'Accelerator','3',...
        'Callback',[values.MD ' Expert']);
    handles.menu_1_1_4 = uimenu(handles.menu_1_1,...
        'Label','&Custom',...
        'Separator','on',...
        'Accelerator','4',...
        'Callback',[values.MD ' Custom']);
    handles.menu_1_2 = uimenu(handles.menu_1,...
        'Label','&Highscores',...
        'Separator','on',...
        'Accelerator','h',...
        'Callback',[values.MD ' Highscore']);
    handles.menu_1_3 = uimenu(handles.menu_1,...
        'Label','&Statistics',...
        'Accelerator','s',...
        'Callback',[values.MD ' Statistics']);
    handles.menu_1_4 = uimenu(handles.menu_1,...
        'Label','&Options',...
        'Accelerator','o');
    handles.menu_1_5 = uimenu(handles.menu_1,...
        'Label','E&xit',...
        'Separator','on',...
        'Accelerator','x',...
        'Callback',[values.MD ' Exit']);
    handles.menu_2 = uimenu(handles.fig_main,...
        'Label','&Help);
    handles.menu_2_1 = uimenu(handles.menu_2,...
        'Label','View &help',...
        'Callback',[values.MD ' Help']);
    handles.menu_2_2 = uimenu(handles.menu_2,...
        'Label','&About MineDetector',...
        'Separator','on',...
        'Callback',[values.MD ' About']);
end

