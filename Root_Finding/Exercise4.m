% Program askisi4
clear; clc;

e = 1.e-14;
pi_val = 3.141592653589793; 

% Input section 
x_old1 = input('Give x_old1: ');
x_old2 = input('Give x_old2: ');

while true
    % Secant method iteration formula
    x_new = x_old1 - (f(x_old1, pi_val) * (x_old1 - x_old2)) / (f(x_old1, pi_val) - f(x_old2, pi_val));
    
    error_val = abs(x_new - x_old1);
    
    % Relative error check
    if (error_val / abs(x_new)) <= e
        break;
    end
    
    % Update values for the next iteration
    x_old2 = x_old1;
    x_old1 = x_new;
end

fprintf('x= %.15f\n', x_new);
fprintf('f(x)= %e\n', f(x_new, pi_val));
fprintf('the error is %e\n', error_val);


function result = f(x, pi_val)
    result = exp(cos(pi_val * x)) + cos(3 * x);
end
