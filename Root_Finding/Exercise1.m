% Program askisi1
clear; clc;

a = 0.0;
b = 1.0;
e = 5.e-7;

% Calculating the maximum number of iterations needed
n = round(log((b - a) / e) / log(2.0));
disp(n);

c = 0;
for i = 1:n
    x = a + (b - a) / 2;
    c = c + 1;
    
    % Check if the function value is essentially zero
    if abs(f(x)) <= eps
        break; 
    end
    
    % Check signs to update interval
    if sgn(f(x)) == sgn(f(a))  
        a = x;
    else
        b = x;
    end
end

fprintf('c= %d\n', c);
fprintf('x= %.15f\n', x);
fprintf('f(x)= %e\n', f(x));



function result = sgn(x)
    if x > 0
        result = 1;
    elseif x < 0
        result = -1;
    else
        result = 0;
    end
end

function result = f(x)
    result = 2^x - 5 * x + 2;
end
