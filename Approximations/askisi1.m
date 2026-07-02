% Program askisi1
clear; clc;

% Input section
n = input('give n: ');
x = input('give x: ');

% First calculation 
s = 1;
term = 1;
for i = 2:n
    term = term * (-x / (i - 1));
    s = s + term;
end

fprintf('to s einai : %f to e^(-x) einai : %f\n', s, exp(-x));

% Second calculation 
s = 1;
term = 1;
for i = 2:n
    term = term * (x / (i - 1));
    s = s + term;
end

fprintf('to 1/s einai : %f\n', 1 / s);
