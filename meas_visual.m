% Punkt zu Punkt Messung-Plots:

orientation = ['n' 's' 'e' 'w'];

wahl = 4;

% x_1 = 24600;
% x_2 = 25800;
% y_1 = 26000;
% y_2 = 29000;
% 
% d_x = 100;
% d_y = 100;

x_1 = 24.6;
x_2 = 25.8;
y_1 = 26.0;
y_2 = 29.0;

d_x = 0.1;
d_y = 0.1;

points_x = int32((abs((x_2-x_1))/d_x)+1);
points_y = int32((abs((y_2-y_1))/d_y)+1);

mess_or = n();
mess_x = VarName2();
mess_y = VarName3();
mess_sec = VarName5();
mess_rssi = VarName6();
mess_dist = VarName7();

IndexC = strfind(mess_or,orientation(wahl));           % Wahl der Orientierung
Index = find(not(cellfun('isempty',IndexC)));

switch wahl
    case 1 %Nord
        points_x = points_x;
        points_y = points_y;
%         testx = reshape(mess_x(Index(:)), points_y, points_x)
%         testy = reshape(mess_y(Index(:)), points_y, points_x)
        
        rssi = reshape(mess_rssi(Index(:)), points_y, points_x);
        sector = reshape(mess_sec(Index(:)), points_y, points_x);
        dist = reshape(mess_dist(Index(:)), points_y, points_x);
        
        rssi(isnan(rssi)) = 0;
        sector(isnan(sector)) = 65;
        
        show_x = [24.6  25.8];
        show_y = [26.0  29.0];
        
        figure(1)
        title('rssi')
        image(show_x, show_y , rssi,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        caxis([40 70])
        
        txt = num2str(mess_rssi(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
            
        figure(2)
        title('sector')
        image(show_x, show_y , sector,'CDataMapping','scaled')
        cmap = autumn(65);
        cmap(65, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_sec(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
            
        figure(3)
        title('distance')
        image(show_x, show_y , dist,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_dist(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')    
        
    case 2 %Süd 
        points_x = points_x;
        points_y = points_y - 1;
%         testx = reshape(mess_x(Index(:)), points_y, points_x)
%         testy = flipud(reshape(mess_y(Index(:)), points_y, points_x))
        
        rssi = flipud(reshape(mess_rssi(Index(:)), points_y, points_x));
        sector = flipud(reshape(mess_sec(Index(:)), points_y, points_x));
        dist = flipud(reshape(mess_dist(Index(:)), points_y, points_x));
        
        rssi(isnan(rssi)) = 0;
        sector(isnan(sector)) = 65;
        
        show_x = [24.6  25.8];
        show_y = [26.0  28.9];
        
        y_2 = 28.9;
        
        figure(1)
        title('rssi')
        image(show_x, show_y , rssi,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        caxis([40 70])
        
        txt = num2str(mess_rssi(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        y = flipud(y);
        
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
            
        figure(2)
        title('sector')
        image(show_x, show_y , sector,'CDataMapping','scaled')
        cmap = autumn(65);
        cmap(65, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_sec(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        y = flipud(y);
        
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
            
        figure(3)
        title('distance')
        image(show_x, show_y , dist,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_dist(Index(:)));
        txt = strtrim(cellstr(txt));
        
        [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        y = flipud(y);
        
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
%         figure(1)
%         title('rssi')
%         image(rssi,'CDataMapping','scaled')
%         cmap = summer(256);
%         cmap(1, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
%         
%         txt = num2str(Index(:))
%         txt = strtrim(cellstr(txt));
%         
%         [x y] = meshgrid(1:points_x,1:points_y);
%         y = flipud(y);
%           
%         text(x(:), y(:), txt(:), ...  % Plot the strings
%                 'HorizontalAlignment', 'center')
        
    case 3 %Ost
        points_x = points_x;
        points_y = points_y;
%         testx = transpose(reshape(mess_x(Index(:)), points_x, points_y))
%         testy = transpose(reshape(mess_y(Index(:)), points_x, points_y))
        
        rssi = transpose(reshape(mess_rssi(Index(:)), points_x, points_y));
        sector = transpose(reshape(mess_sec(Index(:)), points_x, points_y));
        dist = transpose(reshape(mess_dist(Index(:)), points_x, points_y));
        
        rssi(isnan(rssi)) = 0;
        sector(isnan(sector)) = 65;
        
        show_x = [24.6  25.8];
        show_y = [26.0  29.0];
        
        figure(1)
        title('rssi')
        image(show_x, show_y , rssi,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        caxis([40 70])
        
        txt = num2str(mess_rssi(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
            
        figure(2)
        title('sector')
        image(show_x, show_y , sector,'CDataMapping','scaled')
        cmap = autumn(65);
        cmap(65, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_sec(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
            
        figure(3)
        title('distance')
        image(show_x, show_y , dist,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_dist(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
%         figure(1)
%         title('rssi')
%         image(rssi,'CDataMapping','scaled')
%         cmap = summer(256);
%         cmap(1, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
%         
%         txt = num2str(Index(:))
%         txt = strtrim(cellstr(txt))
%         
%         
%         [y x] = meshgrid(1:points_y,1:points_x)
% %         y = flipud(y);
%           
%         text(x(:), y(:), txt(:), ...  % Plot the strings
%                 'HorizontalAlignment', 'center')
    case 4 %West
        points_x = points_x - 1;
        points_y = points_y;
%         testx = fliplr(transpose(reshape(mess_x(Index(:)), points_x, points_y)))
%         testy = transpose(reshape(mess_y(Index(:)), points_x, points_y))
        
        sector = fliplr(transpose(reshape(mess_sec(Index(:)), points_x, points_y)));
        rssi = fliplr(transpose(reshape(mess_rssi(Index(:)), points_x, points_y)));
        dist = fliplr(transpose(reshape(mess_dist(Index(:)), points_x, points_y)));
        
        rssi(isnan(rssi)) = 0;
        sector(isnan(sector)) = 65;
        
        show_x = [24.6  25.7];
        show_y = [26.0  29.0];
        
        x_2 = 25.7
        
        figure(1)
        title('rssi')
        image(show_x, show_y , rssi,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        caxis([40 70])
        
        txt = num2str(mess_rssi(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
        x = flipud(x);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
            
        figure(2)
        title('sector')
        image(show_x, show_y , sector,'CDataMapping','scaled')
        cmap = autumn(65);
        cmap(65, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_sec(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
        x = flipud(x);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
            
        figure(3)
        title('distance')
        image(show_x, show_y , dist,'CDataMapping','scaled')
        cmap = summer(256);
        cmap(1, :) = [1 1 1];
        colormap(cmap);
        colorbar
        
        txt = num2str(mess_dist(Index(:)));
        txt = strtrim(cellstr(txt));
        
%         [x y] = meshgrid(x_1:d_x:x_2, y_1:d_y:y_2);
        [y x] = meshgrid(y_1:d_y:y_2, x_1:d_x:x_2);
        x = flipud(x);
          
        text(x(:), y(:), txt(:), ...  % Plot the strings
                'HorizontalAlignment', 'center')
        
%         figure(1)
%         title('rssi')
%         image(rssi,'CDataMapping','scaled')
%         cmap = summer(256);
%         cmap(1, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
%         
%         txt = num2str(mess_dist(Index(:)))
%         txt = strtrim(cellstr(txt))
%         
%         [y x] = meshgrid(1:points_y,1:points_x)
%         x = flipud(x);
%           
%         text(x(:), y(:), txt(:), ...  % Plot the strings
%                 'HorizontalAlignment', 'center')
end



% IndexC = strfind(mess_or,orientation(wahl));           % Wahl der Orientierung
% Index = find(not(cellfun('isempty',IndexC)));
% 
% rssi = fliplr(reshape(mess_rssi(Index(:)), points_y, points_x));
% sector = fliplr(reshape(mess_sec(Index(:)), points_y, points_x));
% dist = fliplr(reshape(mess_dist(Index(:)), points_y, points_x));

% rssi(isnan(rssi)) = 0;
% sector(isnan(sector)) = 65;
% 
% figure(1)
% title('rssi')
% image(rssi,'CDataMapping','scaled')
%         cmap = summer(256);
%         cmap(1, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
%         
%         txt = num2str(Index(:))
%         txt = strtrim(cellstr(txt));
%         
%         [x y] = meshgrid(1:points_x,1:points_y);
%           
%         text(x(:), y(:), txt(:), ...  % Plot the strings
%                 'HorizontalAlignment', 'center')
        
% figure(2)
% title('sector')
% image(sector,'CDataMapping','scaled')
%         cmap = summer(65);
%         cmap(65, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
%         
% figure(3)
% title('distance')
% image(dist,'CDataMapping','scaled')
%         cmap = summer(256);
%         cmap(1, :) = [1 1 1];
%         colormap(cmap);
%         colorbar
