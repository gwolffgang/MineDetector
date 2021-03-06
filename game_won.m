function game_won ( varargin )
    global handles values;
    
    cb=mfilename;
    if nargin == 0
        stop(timerfind('Name','timer'));
        values.game_over = true;
        values.img_flag = imread('Flag-2400px.png', 'png');
        values.img_flag = imresize(values.img_flag, values.img_size);
        for i=1:1:values.height
            for j=1:1:values.width
                if ishandle(handles.field(i,j))
                    set(handles.field(i,j),'String',' ');
                    set(handles.field(i,j),'CData', values.img_flag);
                end
            end
        end
        %Initialisierung
        handles.fig_won = figure(...
            'NumberTitle','off',...
            'Menubar','none');
        handles.pb_handle=uicontrol(handles.fig_won,...
            'Style','push',...
            'Unit','normalized',...
            'Position',[0.75 0.05 0.2 0.1],...
            'String','Ok',...
            'Callback',[cb ' Ok']);
        handles.txt = uicontrol(handles.fig_won,...
            'Style','text',...
            'Unit','normalized',...
            'Backgroundcolor','[.90 .90 .90]',...
            'Position',[0.25 0.5 0.5 0.25],...
            'String','You Win',...
            'Enable','inactive',...
            'FontWeight','bold',...
            'FontSize',14);  
    else                                  
        switch varargin{:}
            case 'Ok'
                close(handles.fig_won); 
        end
    end                              
end
