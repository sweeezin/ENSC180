%%Fiona Jin
%%fja20@sfu.ca
%%301612323

%%Q1
function newString = stringfunction(inputStr)
    inputStr = inputStr(isletter(inputStr));

    for i = 2:2:length(inputStr)
        inputStr(i) = upper(inputStr(i));
    end
    newString = inputStr;
end

%%Q2
A = randn(1, 4);

%open file to write
fileID = fopen('text.txt', 'w');

fprintf(fileID, 'this is a text file');
fprintf(fileID, '\n');
fprintf(fileID, '%8.2f ', A);
fclose(fileID);

%open file to read
fileID = fopen('text.txt', 'r');

line = fgets(fileID);
disp(line);
B = [];
for i = 1:4
    B(1, i) = fscanf(fileID, '%f',1);
end
fclose(fileID);
%%error calculation
disp(A)
disp(B)
error = A - B;
disp("error is")
disp(error);

%Q3
M = rand(2,4)
%%open file to write matrix
fileID = fopen('binary_data.dat', 'w');
fwrite(fileID, M, 'double');
fclose(fileID);

type('binary_data.dat');

fileID = fopen('binary_data.dat', 'r');
%%read matrix
E = fread(fileID, [2, 4], 'double');
fclose(fileID);
%%calculate error

disp(E)
error = M - E;
disp("error is")
disp(error);