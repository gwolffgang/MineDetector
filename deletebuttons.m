function  deletebuttons(vh,x,y,width,height)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
M=[x
   y];
delete(vh.field(x,y));
while(~isempty(M))
      for i=(-1):1:1
          for j=(-1):1:1
              if ((M(1,1)+i) > 0 && (M(2,1)+j) > 0 &&(M(1,1)+i) < width  && (M(2,1)+j) < height )
                    ishandle(vh.field(M(1,1)+i,M(2,1)+j))
                  if (ishandle(vh.field(M(1,1)+i,M(2,1)+j))) 
                    delete(vh.field(M(1,1)+i,(M(2,1)+j)))
                     if (vh.Minefield(M(1,1)+i,(M(2,1)+j))==0)
                         A=[x+i 
                            y+j];
                        M=[M A]
                     end
                  end
              end
          end
      end
      M(:,1)=[];
end

end

