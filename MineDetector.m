function MineDetector( action )
%MINEDETECTOR Summary of this function goes here
%   Detailed explanation goes here

MD = mfilename;
global values;

if nargin == 0
    values.fig_handle = figure('NumberTitle','off',...
        'Name','MineDetector');
    set(values.fig_handle,'Menubar','none');
    values.pb_handle_easy = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.7 0.5 0.3],...
        'String','Beginner',...
        'Callback',[MD ' Beginner']);
    values.pb_handle_medium = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'Position',[0.25 0.35 0.5 0.3],...
        'String','Intermediate',...
        'Callback',[MD ' Intermediate']);
    values.pb_handle_hard = uicontrol(values.fig_handle,'Style','push',...
        'Unit','normalized',...
        'position',[0.25 0 0.5 0.3],...
        'String','Expert',...
        'Callback',[MD ' Expert']);  
else 
    switch action
        case 'Beginner'
            values.height = 9;
            values.width = 9;
            values.mines = 10;
            new_game;
        case 'Intermediate'
            values.height = 16;
            values.width = 16;
            values.mines = 40;
            new_game;
        case 'Expert'
            values.height = 16;
            values.width = 30;
            values.mines = 99;
            new_game;
    end
    
    parts = strsplit(action,'|');
    if strcmp(parts(1),'lc') == 1 || strcmp(parts(1),'rc') == 1
        x = str2double(parts(2));
        y = str2double(parts(3));
        if strcmp(parts(1),'lc') == 1
            if strcmp(get(values.field(x,y),'string'),'Mine?!') == 0
                if values.Minefield(x,y) == 0
                    deletebuttons(x, y);
                else
                    if values.Minefield(x,y) == -1
                        close(values.fig_handle);
                    else
                        delete(values.field(x,y));
                    end
                end
            end
        else
            if strcmp(get(values.field(x,y),'string'),'') == 1
                set(values.field(x,y),'string','Mine?!');
            else
                set(values.field(x,y),'string','');
            end
        end

    else
        field_size = [1/values.width 0.9/values.height]; 
        for i=1:1:values.height
            for j=1:1:values.width
                field_x = num2str(i);
                field_y = num2str(j);
                field_code = num2str(values.Minefield(i,j));
                if field_code == '0'
                    field_code = '';
                end
                color = 'black';
                switch values.Minefield(i,j)
                    case 1
                        color = 'blue';
                    case 2
                        color = '[.2 .4 .0]';
                    case 3
                        color = 'red';
                    case 4
                        color = '[.5 .0 .5]';
                    case 5
                        color = '[.54 .27 .07]';
                    case 6
                        color = 'cyan';
                end
                cb_rightclick = strcat(' rc|', field_x, '|', field_y);
                cb_leftclick = strcat(' lc|', field_x, '|', field_y);
                values.cb_txt = uicontrol(values.fig_handle,...
                    'Style','edit',...
                    'Unit','normalized',...
                    'Backgroundcolor','[.95 .95 .95]',...
                    'Position',[1/values.width*(j-1) 0.9/values.height*(i-1) field_size],...
                    'String',field_code,...
                    'Enable','inactive',...
                    'FontWeight','bold',...
                    'FontSize',10,...
                    'Foregroundcolor',color);
                values.field(i,j) = uicontrol(values.fig_handle,...
                    'Style','push',...
                    'Unit','normalized',...
                    'Position',[1/values.width*(j-1) 0.9/values.height*(i-1) field_size],...
                    'ButtonDownFcn',[MD cb_rightclick],...
                    'Callback',[MD cb_leftclick]);
            end
        end
    end
end