%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Hari Kumar Ganesh           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;clc;

theta=linspace(0,2*pi);                                             %defining theta for the parametric equation of elipse
a=30;                                                               %defining semimajor axis of elipse
b=15;                                                               %defining semiminor axis of elipse

x=a*cos(theta);                                                     %setting x value for plotting elipse from parametric equation of an elipse
y=b*sin(theta);                                                     %setting y value for plotting elipse from parametric equation of an elipse

elipse=[x;y;ones(size(x))];                                         %defining the elipse figure in a matix form so that we can perform transformations on it
scale_matrix=[0.4 0 0;0 0.6 0;0 0 1];                               %defining scaling matrix
rot_matrix=[cos(pi/4) sin(pi/4) 0;-sin(pi/4) cos(pi/4) 0;0 0 1];    %defining rotation matrix
tran_matrix=[1 0 1;0 1 2;0 0 1];                                    %defining translation matrix

scaled_matrix=scale_matrix*elipse;                                  %first scaling the elipse
rotated_matrix=rot_matrix*scaled_matrix;                            %then rotatng the elipse
translated_matrix=tran_matrix*rotated_matrix;                       %then translating the elipse

plot(elipse(1,:),elipse(2,:),'blue');                               %plotting the original elipse in blue color

hold on;
plot(translated_matrix(1,:),translated_matrix(2,:),'red');          %plotting the scaled-rotated-translated elipse
                                                                    %in red color

%checking for transformation commutative

translated_matrix1=tran_matrix*elipse;                              %first translating the elipse
rotated_matrix1=rot_matrix*translated_matrix1;                      %then rotatng the elipse
scaled_matrix1=scale_matrix*rotated_matrix1;                        %then scaling the elipse

plot(scaled_matrix1(1,:),scaled_matrix1(2,:),'green');              %plotting the translated-rotated-scaled elipse
hold off
