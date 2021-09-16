%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Hari Kumar Ganesh           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;clc;
%defining coordinates of the car
x=[-5.2 -5 -4.9 -5.2 -4.8 -5.3 -5 -2.5 0 1.5 2 2.5 3 3.5 4 4.5 5 5 4.5 4 3.5 3 2.5 2 1.5 1 -2 -2.5 -3 -3.5 -4.2 -4.6 -4.9 -5.2];
y=[0 2.7 3.1 3.7 3.8 4.7 4.8 5.2 5 2.5 2.5 2.5 2.5 2.5 2.5 2.5 2.5 0 0 0 0.35 0.5 0.65 0.54 0.37 0 0 0.35 0.5 0.65 0.54 0.37 0 0];

scale_matrix=[2 0 0;0 3 0;0 0 1];                                   %defining scaling matrix
rot_matrix=[cos(pi/2) sin(pi/2) 0;-sin(pi/2) cos(pi/2) 0;0 0 1];    %defining rotation matrix
tran_matrix=[1 0 1;0 1 2;0 0 1];                                    %defining translation matrix

car=[x;y;ones(size(x))];                                            %generating car matrix so that we can apply operations on it

%applying transformation 1 by 1
scaled_car=scale_matrix*car;                                        %scaling the car
rotated_car=rot_matrix*scaled_car;                                  %rotating the car
translated_car=tran_matrix*rotated_car;                             %translating the car

%applying transformation in concatenation/affine style
transformed_car=scale_matrix*rot_matrix*tran_matrix*car;            %applying transformations

plot(x,y,'blue');                                                   %plotting the original car
hold on
plot(translated_car(1,:),translated_car(2,:),'red');                %plotting the transformed car by the first method(applying transformation 1 by 1

plot(transformed_car(1,:),transformed_car(2,:),'green');            %plotting the transformed car by the second method(applying transformation in concatination method
hold off
