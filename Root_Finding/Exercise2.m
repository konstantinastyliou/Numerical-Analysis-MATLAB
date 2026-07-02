% Program askisi2
clear; clc;

e = 5.e-7;

% Input section
x_old = input('Give x0: ');
c = 0;

% Infinite loop
    x_new = phi(x_old);
    c = c + 1;
    
    error_val = abs(x_new - x_old);
    
    % Relative error check for convergence
    if (error_val / abs(x_new)) <= e
        break;
    end
    
    x_old = x_new;
end

fprintf('x= %.15f\n', x_new);
fprintf('f(x)= %e\n', f(x_new));
fprintf('c= %d\n', c);



function result = f(x)
    result = 2^x - 5 * x + 2;
end

function result = phi(x)
    result = (2.0^x + 2.0) / 5.0;
end
