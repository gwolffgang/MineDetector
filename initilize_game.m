function initilize_game(start_x, start_y)
%INITILIZE_GAME Summary of this function goes here
%   Detailed explanation goes here

    global values handles;
    
    values.game_over = false;
    values.Minefield = zeros(values.height, values.width);
    values.fields_to_find = values.height * values.width - values.mines;
    while 1
       random_array = randperm(values.height * values.width);
       if random_array((start_x-1) * values.width+start_y) > values.mines
           break;
       end
    end                                     
    for i=1:1:values.height
        for j=1:1:values.width
            if random_array((i-1) * values.width+j) <= values.mines
                values.Minefield(i,j) = -1;
            end
        end
    end
    for i=1:1:values.height
        for j=1:1:values.width
            field_code = 0;
            if values.Minefield(i,j) ~= -1
                for k=i-1:1:i+1
                    for l=j-1:1:j+1
                        if 0 < l && l <= values.width && 0 < k && k <= values.height
                            if values.Minefield(k,l) == -1
                                field_code = field_code +1;
                            end
                        end
                    end
                end
                values.Minefield(i,j) = field_code;
            end
        end
    end
    for i=1:1:values.height
        for j=1:1:values.width
            field_code = num2str(values.Minefield(i,j));
            color = 'black';
            switch values.Minefield(i,j)
                case 0
                    field_code = '';
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
            %values.img_mine = imread('pics/rg1024-sea-mine.png');
            %values.img_mine=imresize(img, [50 50]);
            handles.cb_txt = uicontrol(handles.fig_handle,...
                'Style','edit',...
                'Unit','normalized',...
                'Backgroundcolor','[.95 .95 .95]',...
                'Position',[1/values.width*(j-1) 0.9/values.height*(i-1) values.field_size],...
                'String',field_code,...
                'Enable','inactive',...
                'FontWeight','bold',...
                'FontSize',10,...
                'Foregroundcolor',color);
        end
    end
    values.initilized = 1;
    generate_buttons;
    values.timer = timer(...
        'Name','timer',...
        'ExecutionMode','fixedRate',...
        'Period',0.1,...
        'TimerFcn',@timer_count_on);
    values.time = 0;
    start(values.timer);
end

function timer_count_on(~,~)

    global values handles;

    values.time = values.time + 0.1;
    set(handles.timer,'String',num2str(values.time,'%.1f'));
end

