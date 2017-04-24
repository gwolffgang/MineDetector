function about( varargin )

global handles;
cb=mfilename;
if nargin == 0
    %Initialisierung
    handles.fig_about = figure(...
        'NumberTitle','off',...
        'Name','About MineDetector',...
        'Unit','normalized',...
        'Position',[0.35 0.35 0.3 0.2],...
        'Resize', 'off',...
        'Menubar','none');
    handles.txt1 = uicontrol(handles.fig_about,...
        'Style','edit',...
        'Unit','normalized',...
        'Backgroundcolor',[0.9 0.9 0.9],...
        'Position',[0.05 0.55 0.9 0.3],...
        'String','MineDetector - A MineSweeper clone',...
        'Enable','inactive',...
        'FontWeight','bold',...
        'FontSize',14);  
    handles.txt2 = uicontrol(handles.fig_about,...
        'Style','edit',...
        'Unit','normalized',...
        'Backgroundcolor',[0.9 0.9 0.9],...
        'Position',[0.05 0.25 0.9 0.3],...
        'String','by Benjamin Brinkmann, Manuel Unruh & Georg Wolffgang',...
        'Enable','inactive',...
        'FontSize',13);
    handles.pb_close=uicontrol(handles.fig_about,...
        'Style','push',...
        'Unit','normalized',...
        'Position',[0.75 0.05 0.20 0.10],...
        'String','Ok',...
        'Callback',[cb ' Exit']);

else
  switch varargin{:}
        case 'Exit'
           close(handles.fig_about); 
  end
end
end
