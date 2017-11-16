%Inclass 13
%GB comments
1a 100
1b 100
1c 100
1d 100
2a 100
2b 100
2c 100
overall: 100

%Part 1. In this directory, you will find an image of some cells expressing a 
% fluorescent protein in the nucleus. 
% A. Create a new image with intensity normalization so that all the cell
% nuclei appear approximately eqully bright.
img = imread('Dish1Well8Hyb1Before_w0001_m0006.tif');
img = im2double(img);
img_dilate = imdilate(img, strel('disk',500));
img_norm = img./img_dilate;
imshow(img_norm,[])

% B. Threshold this normalized image to produce a binary mask where the nuclei are marked true. 
%%
mask = img > 0.1;
imshow(mask);

% C. Run an edge detection algorithm and make a binary mask where the edges
% are marked true.
%%
img_edge = edge(img, 'sobel');
imshow(img_edge,[])

% D. Display a three color image where the orignal image is red, the
% nuclear mask is green, and the edge mask is blue. 
toshow = cat(3, img_norm, mask, img_edge);
imshow(toshow)

%%
%Part 2. Continue with your nuclear mask from part 1. 
%A. Use regionprops to find the centers of the objects
cell_properties = regionprops(mask, 'Centroid');
centroids = cat(1, cell_properties.Centroid);

%B. display the mask and plot the centers of the objects on top of the
%objects

imshow(mask)
hold on
plot(centroids(:,1),centroids(:,2), 'b*')
hold off


%C. Make a new figure without the image and plot the centers of the objects
%so they appear in the same positions as when you plot on the image (Hint: remember
%Image coordinates). 
%%
plot(centroids(:,1),centroids(:,2)*(-1), 'b*')



