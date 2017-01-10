function MineDetector( action )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
MD=mfilename;


global vh width height;
if nargin==0
                   
    
vh.fig_handle=figure('NumberTitle','off',...
                  'Name','MineDetector');
set(vh.fig_handle,'Menubar','none')              
vh.pb_handle1=uicontrol   (vh.fig_handle,'Style','push',...
                                         'Unit','normalized',...
                                         'position',[0.25 0.7 0.5 0.3],...
                                         'String','Easy',...
                                         'Callback',[MD ' Easy']);
vh.pb_handle2=uicontrol   (vh.fig_handle,'Style','push',...
                                         'Unit','normalized',...
                                         'position',[0.25 0.35 0.5 0.3],...
                                         'String','Medium',...
                                         'Callback',[MD ' Medium']);
vh.pb_handle3=uicontrol   (vh.fig_handle,'Style','push',...
                                         'Unit','normalized',...
                                         'position',[0.25 0 0.5 0.3],...
                                         'String','Hard',...
                                         'Callback',[MD ' Hard']);  

else 
    switch action
        case  'Easy'
         delete (vh.pb_handle1);
         delete (vh.pb_handle2); 
         delete (vh.pb_handle3);   
         height=9;
         width=9;
         mines=4;
         vh.Minefield=zeros(height,width);
         P=randperm(width*height);                                     
         for i=1:1:height
            for j=1:1:width
                if P((i-1)*width+j)<=mines
                    vh.Minefield(i,j)=-1;
                end
            end
         end
         for i=1:1:height
               for j=1:1:width
                   a=0;
                   if vh.Minefield(i,j)~=-1
                       for k=i-1:1:i+1
                           for l=j-1:1:j+1
                               if (l>0 && l<=width && k>0 && k<=height)
                                   if vh.Minefield(k,l)==-1
                                       a=a+1;
                                   end
                               end
                           end
                       end 
                       vh.Minefield(i,j)=a;
                   end
               end
         end
         case  'Medium'
         delete (vh.pb_handle1);
         delete (vh.pb_handle2); 
         delete (vh.pb_handle3);   
         height=16;
         width=16;
         mines=40;
         vh.Minefield=zeros(height,width);
         P=randperm(width*height);                                     
         for i=1:1:height
            for j=1:1:width
                if P((i-1)*width+j)<=mines
                    vh.Minefield(i,j)=-1;
                end
            end
         end
         for i=1:1:height
               for j=1:1:width
                   a=0;
                   if vh.Minefield(i,j)~=-1
                       for k=i-1:1:i+1
                           for l=j-1:1:j+1
                               if (l>0 && l<=width && k>0 && k<=height)
                                   if vh.Minefield(k,l)==-1
                                       a=a+1;
                                   end
                               end
                           end
                       end 
                       vh.Minefield(i,j)=a;
                   end
               end
         end
         case  'Hard'
         delete (vh.pb_handle1);
         delete (vh.pb_handle2); 
         delete (vh.pb_handle3);   
         height=16;
         width=30;
         mines=99;
         vh.Minefield=zeros(height,width);
         P=randperm(width*height);                                     
         for i=1:1:height
            for j=1:1:width
                if P((i-1)*width+j)<=mines
                    vh.Minefield(i,j)=-1;
                end
            end
         end
         for i=1:1:height
               for j=1:1:width
                   a=0;
                   if vh.Minefield(i,j)~=-1
                       for k=i-1:1:i+1
                           for l=j-1:1:j+1
                               if (l>0 && l<=width && k>0 && k<=height)
                                   if vh.Minefield(k,l)==-1
                                       a=a+1;
                                   end
                               end
                           end
                       end 
                       vh.Minefield(i,j)=a;
                   end
               end
         end
    end
    parts =strsplit(action,'|');
    if strcmp(parts(1),'cb') == 1
    x=str2double(parts(2));
    y=str2double(parts(3));
    if vh.Minefield(x,y)==0
       deletebuttons(vh,x,y,width,height);
    else
        if vh.Minefield(x,y)==(-1)
            close(vh.fig_handle);
        else
             delete(vh.field(x,y));
        end
    end
    else
       field=[1/width 0.9/height]; 
       for i=1:1:height
        for j=1:1:width
        t1=num2str(i);
        t2=num2str(j);
        t3=num2str(vh.Minefield(i,j));
        cb=strcat(' cb','|', t1,'|',t2);
        vh.cb_txt=uicontrol(vh.fig_handle,'Style','text',...
        'Unit','normalized',...
        'position',[1/width*(j-1) 0.9/height*(i-1) field],...
        'String',t3); 
        vh.handlename=uicontrol(vh.fig_handle,...
        'Style','push',...
        'Unit','normalized',...
        'position',[1/width*(j-1) 0.9/height*(i-1) field],...
        'Callback',[MD cb]);
        vh.field(i,j)=vh.handlename;
        end
       end
    end
end

