function MineDetector( action )
%MINEDETECTOR Summary of this function goes here
%  Hauptprogramm

global handles values;

if nargin == 0
    values.MD = mfilename;
    
    values.img_flag = imread('Flag-2400px.png', 'png');
    % Red Flag (https://openclipart.org/detail/170768/red-flag) by ky1en1te
    
    values.img_mine = imread('rg1024-cartoon-sea-mine-2400px.png', 'png');

    % Cartoon Sea Mine (https://openclipart.org/detail/20846/cartoon-sea-mine) by rg1024
    
    set(0,'units','pixels');
    values.screen_dimensions = get(0,'screensize') * 0.95;
    
    values.width = 9;
    values.height = 9;
    values.old_width = 9;
    values.old_height = 9;
    values.mines = 10;
    values.time = 0.0;
    values.initilized = false;
    values.customizing = false;
    handles.fig_main = figure(...
        'NumberTitle','off',...
        'Name','MineDetector',...
        'Resize', 'off',...
        'Menubar','none');
    generate_menu;
    handles.mines = uicontrol(handles.fig_main,...
        'Style','edit',...
        'Unit','normalized',...
        'Backgroundcolor','[.9 .9 .9]',...
        'Position',[.01 .95 .10 .05],...
        'String',values.mines,...
        'Enable','inactive',...
        'FontWeight','bold',...
        'FontSize',14);
    handles.new = uicontrol(handles.fig_main,...
        'Style','push',...
        'Unit','normalized',...
        'Position',[.475 .95 .05 .05],...
        'Callback',[values.MD ' NewGameButton']);
    handles.timer = uicontrol(handles.fig_main,...
        'Style','edit',...
        'Unit','normalized',...
        'Backgroundcolor','[.9 .9 .9]',...
        'Position',[.89 .95 .10 .05],...
        'String',values.time,...
        'Enable','inactive',...
        'FontWeight','bold',...
        'FontSize',14);
    MineDetector('NewGame');
    
else
    if isfield(handles,'custom_close') && ishandle(handles.custom_close)
        delete_custombuttons;
    end
    
    switch action
        case 'About'
            about;
        case 'Exit'
            if isfield(handles,'fig_customize') && ishandle(handles.fig_customize)
                close(handles.fig_customize);
            end
            if isfield(handles,'fig_about') && ishandle(handles.fig_about)
                close(handles.fig_about);
            end
            close(handles.fig_main);
        case 'Help'
            winopen('Help.txt');
        case 'NewGame'
            screen = get(0,'screensize');
            values.field_size = min((values.screen_dimensions(1,3)*0.9 / values.width), (values.screen_dimensions(1,4)*0.9 / values.height));
            set(handles.fig_main,'Position',[screen(1,3)-values.screen_dimensions(1,3) screen(1,4)-values.screen_dimensions(1,4) values.field_size*values.width values.field_size*values.height]);
            reset_values;
            delete_fields;
            generate_buttons;
            values.initilized = 0;
        case 'NewGameButton'
            values.customizing = false;
            MineDetector('NewGame');
        case 'Values_Beginner'
            values.customizing = false;
            values.width = 9;
            values.height = 9;
            values.mines = 10;
            MineDetector('NewGame');
        case 'Values_Custom'
            values.customizing = true;
            MineDetector('NewGame');
        case 'Values_Expert'
            values.customizing = false;
            values.width = 30;
            values.height = 16;
            values.mines = 99;
            MineDetector('NewGame');
        case 'Values_Intermediate'
            values.customizing = false;
            values.width = 16;
            values.height = 16;
            values.mines = 40;
            MineDetector('NewGame');
    end
    parts = strsplit(action,'|');                                           % Callback-Trennung für Variable Callback
    if strcmp(parts(1),'lc') == 1 || strcmp(parts(1),'rc') == 1             % Überprüfung von Rechts- oder Linksklick
        if values.initilized == 0
            initilize_game(str2double(parts(2)),str2double(parts(3)));
        end 
        field_click(str2double(parts(2)),str2double(parts(3)),parts(1));        
    end
    if strcmp(parts(1),'custom') == 1                                       % Customization aktiv
        if strcmp(parts(2),'close') == 1
            values.customizing = false;
        end
        if strcmp(parts(2),'width') == 1
            if strcmp(parts(3),'plus') == 1
                if values.width < 30
                    values.width = values.width +1;
                end
            end
            if strcmp(parts(3),'minus') == 1
                if values.width > 5
                    values.width = values.width -1;
                end
            end
        end
        if strcmp(parts(2),'height') == 1
            if strcmp(parts(3),'plus') == 1
                if values.height < 26
                    values.height = values.height +1;
                end
            end
            if strcmp(parts(3),'minus') == 1
                if values.height > 5
                    values.height = values.height -1;
                end
            end
        end
        if strcmp(parts(2),'mines') == 1
            if strcmp(parts(3),'plus') == 1
                if values.mines < round(values.width*values.height*0.25)
                    values.mines = values.mines +1;
                end
            end
            if strcmp(parts(3),'minus') == 1
                if values.mines > 5
                    values.mines = values.mines -1;
                end
            end
        end
        
        max_mines = round(values.width*values.height*0.25);
        if values.mines > max_mines
            values.mines = max_mines;
        end
        MineDetector('NewGame');
    end
    
end

if isfield(handles,'mines') && ishandle(handles.mines)
    values.flags = 0;
    for i=1:1:values.height
        for j=1:1:values.width
            if ishandle(handles.field(i,j))
                if strcmp(get(handles.field(i,j),'String'),' ') == 1
                    values.flags = values.flags +1;
                end
            end
        end
    end
    values.mines_left = values.mines - values.flags;
    set(handles.mines,'String',values.mines_left);
end

end %MineDetector

function reset_values %zur Wiederherstellung der Standard-Werte
            global values handles;
            
            values.game_over = true;
            if isfield(values, 'timer')
                stop(timerfind('Name','timer'));
            end
            values.time = 0.0;
            set(handles.timer,'String',num2str(values.time,'%.1f'));
end