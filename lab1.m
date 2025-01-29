% ENSC180 Lab 1-Q1:
% Using vector operations to speed up the code.
% Fiona Jin, 301612323, fja20@sfu.ca 1/16/25
clear all
close all

%matrix formation
A = randn(200);
A = round(A*10);
disp(A(1:4,1:4));
tic

for i = 2: 2 : 200
    for c = 2 :2 : 200
        A(i, c) = A(i,c)^2;
    end
end

toc 

disp(toc);
disp(A(1:4,1:4));

rows = 2:2:200;
cols = 2:2:200;

A(rows,cols) = A(rows,cols).^2;
toc
disp(toc)
disp(A(1:4,1:4));

