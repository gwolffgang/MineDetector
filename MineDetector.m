function MineDetector( action )
%MINEDETECTOR Summary of this function goes here
%  Hauptprogramm

global handles values;

values.MD = mfilename;
if nargin == 0
    values.height = 9;
    values.width = 9;
    values.mines = 10;%default-Parameter
    handles.fig_main = figure(...
        'NumberTitle','off',...
        'Name','MineDetector'); 
    generate_menu
    handles.pb_handle_easy = uicontrol(handles.fig_main,...
        'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.7 0.5 0.3],...
        'String','Beginner',...
        'Callback',[values.MD ' Beginner']);
    handles.pb_handle_medium = uicontrol(handles.fig_main,...
        'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.35 0.5 0.3],...
        'String','Intermediate',...
        'Callback',[values.MD ' Intermediate']);
    handles.pb_handle_hard = uicontrol(handles.fig_main,...
        'Style','push',...
        'Unit','normalized',...
        'position',[0.25 0 0.5 0.3],...
        'String','Expert',...
        'Callback',[values.MD ' Expert']);
    values.Game = 0;%Überprüfungs-Parameter für den Spielzustand
    values.User = 0;%Überprüfungs-Parameter für die user_define-Funktion
else 
    switch action
        case 'NewGame'
            reset_values;
            generate_buttons;
        case 'Beginner'
            reset_values;
            values.height = 9;
            values.width = 9;
            values.mines = 10;
            generate_buttons;
        case 'Intermediate'
            reset_values;
            values.height = 16;
            values.width = 16;
            values.mines = 40;
            generate_buttons;
        case 'Expert'
            reset_values;
            values.height = 16;
            values.width = 30;
            values.mines = 99;
            generate_buttons;
        case 'user'
            reset_values;
            generate_buttons;
        case 'user_define'
            user_define;
        case 'Help'
            winopen('Help.txt');
        case 'Exit'
            close(handles.fig_main);
    end
    parts = strsplit(action,'|'); % Callback-Trennung für Variable Callback
    if strcmp(parts(1),'lc') == 1 || strcmp(parts(1),'rc') == 1 %Überprüfung von Rechts- oder Links-Klick
        if values.initilized == 0
            initilize_game(str2double(parts(2)),str2double(parts(3)));
        end 
        field_click(str2double(parts(2)),str2double(parts(3)),parts(1));        
    end
end

end %MineDetector


function reset_values %zur Wiederherstellung der Standard-Werte
            global handles values;
            values.timer='0.0';
            delete(timerfind('Name','timer'));
            if ishandle(handles.timer)
                delete(handles.timer);
            end
            delete_field;
            values.initilized = 0;
            values.game_over = false;
            handles.timer = uicontrol(handles.fig_main,...
                                        'Style','edit',...
                                        'Unit','normalized',...
                                        'Backgroundcolor','[.90 .90 .90]',...
                                        'Position',[0.9 0.9 0.1 0.1],...
                                        'String',values.timer,...
                                        'Enable','inactive',...
                                        'FontWeight','bold',...
                                        'FontSize',14);    
           
end