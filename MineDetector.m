function MineDetector( action )
%MINEDETECTOR Summary of this function goes here
%   Detailed explanation goes here

global handles values;

values.MD = mfilename;
values.timer = 0.0;

if nargin == 0
    handles.fig_main = figure(...
        'NumberTitle','off',...
        'Name','MineDetector',...
        'Menubar','none');
    generate_menu;
    handles.timer = uicontrol(...
        'Style','edit',...
        'Unit','normalized',...
        'Backgroundcolor','[.90 .90 .90]',...
        'Position',[0.9 0.9 0.1 0.1],...
        'String',values.timer,...
        'Enable','inactive',...
        'FontWeight','bold',...
        'FontSize',14);    
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
    values.initilized = 0;
else 
    switch action
        case 'New_Game'
            if values.initilized == 0
            	values.height = 9;
        		values.width = 9;
            	values.mines = 10;
            end
            values.initilized = 0;    
            delete_field;
            generate_buttons;
        case 'Beginner'
            values.height = 9;
            values.width = 9;
            values.mines = 10;
            delete_field;
            generate_buttons;
        case 'Intermediate'
            values.height = 16;
            values.width = 16;
            values.mines = 40;
            delete_field;
            generate_buttons;
        case 'Expert'
            values.height = 16;
            values.width = 30;
            values.mines = 99;
            delete_field;
            generate_buttons;
        case 'Help'
            winopen('Help.txt');
        case 'About'
            winopen('About.txt');
        case 'Exit'
            close(handles.fig_main);
    end
    parts = strsplit(action,'|');
    if strcmp(parts(1),'lc') == 1 || strcmp(parts(1),'rc') == 1
        if values.initilized == 0
            initilize_game(str2double(parts(2)),str2double(parts(3)));
        end
        field_click(str2double(parts(2)),str2double(parts(3)),parts(1));        
    end
end

end %MineDetector
