% Program askisi3
clear; clc;

e = 1.e-14;
pi_val = 3.141592653589793; 

% Input section
x_old = input('Give x0: ');

while true
    x_new = x_old - (f(x_old, pi_val) / df(x_old, pi_val));
    error_val = abs(x_new - x_old);
    
    % Relative error check
    if (error_val / abs(x_new)) <= e
        break;
    end
    
    x_old = x_new;
end

fprintf('x= %.15f\n', x_new);
fprintf('f(x)= %e\n', f(x_new, pi_val));
fprintf('the error is %e\n', error_val);


function result = f(x, pi_val)
    result = exp(cos(pi_val * x)) + cos(3 * x);
end

function result = df(x, pi_val)
    result = -pi_val * exp(cos(pi_val * x)) * sin(pi_val * x) - 3 * sin(3 * x);
end
