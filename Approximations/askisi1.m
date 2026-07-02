% Program askisi3
clear; clc;

% Input section
k = input('give k: ');

I = 0.0;
disp(I);

% Backward loop from k-1 down to 2 with a step of -1
for n = (k - 1):-1:2
    I = (1.0 - I) / n;
    disp(I);
end

% Calculating and printing the absolute error E
E = abs(I - 1.0 / exp(1.0));
fprintf('E= %e\n', E);
