function MineDetector( action )
%MINEDETECTOR Summary of this function goes here
%   Detailed explanation goes here

global values;

values.MD = mfilename;

if nargin == 0
    values.fig_handle = figure('NumberTitle','off',...
        'Name','MineDetector');
    set(values.fig_handle,'Menubar','none');
    values.pb_handle_easy = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.7 0.5 0.3],...
        'String','Beginner',...
        'Callback',[values.MD ' Beginner']);
    values.pb_handle_medium = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.35 0.5 0.3],...
        'String','Intermediate',...
        'Callback',[values.MD ' Intermediate']);
    values.pb_handle_hard = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'position',[0.25 0 0.5 0.3],...
        'String','Expert',...
        'Callback',[values.MD ' Expert']);
    values.initilized = 0;
else 
    switch action
        case 'Beginner'
            values.height = 9;
            values.width = 9;
            values.mines = 10;
            generate_buttons;
        case 'Intermediate'
            values.height = 16;
            values.width = 16;
            values.mines = 40;
            generate_buttons;
        case 'Expert'
            values.height = 16;
            values.width = 30;
            values.mines = 99;
            generate_buttons;
    end
    parts = strsplit(action,'|');
    if strcmp(parts(1),'lc') == 1 || strcmp(parts(1),'rc') == 1
        if values.initilized == 0
            generate_minefield(str2double(parts(2)),str2double(parts(3)));
        end
        field_click(str2double(parts(2)),str2double(parts(3)),parts(1));        
    end
end