function new_game()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    global values;

    delete(values.pb_handle_easy);
    delete(values.pb_handle_medium); 
    delete(values.pb_handle_hard);
    values.Minefield = zeros(values.height, values.width);
    random_array = randperm(values.height * values.width);                                     
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
end

