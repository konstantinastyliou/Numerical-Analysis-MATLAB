% Program askisi3
clear; clc;

n = 5;
eps_val = 1.e-9;

% Matrix and vector initialization
A = [ 10.0, -1.0,  2.0,  0.0,  1.0;
      -1.0, 11.0, -1.0,  3.0,  2.0;
       2.0, -1.0, 10.0, -1.0,  1.0;
       0.0,  3.0, -1.0,  8.0, -2.0;
       1.0,  2.0,  1.0, -2.0,  9.0 ];

b = [ 6.0; 25.0; -11.0; 15.0; 9.0 ];

x_old = zeros(n, 1);
x_new = zeros(n, 1);
c = 0;

% Jacobi Iteration Loop
while true
    for i = 1:n

        % Sum up elements before the diagonal element (1 to i-1)
        s1 = 0.0;
        for j = 1:(i - 1)
            s1 = s1 + A(i, j) * x_old(j);
        end

        % Sum up elements after the diagonal element (i+1 to n)
        s2 = 0.0;
        for j = (i + 1):n
            s2 = s2 + A(i, j) * x_old(j);
        end

        % Calculate new estimation for x(i)
        x_new(i) = (b(i) - s1 - s2) / A(i, i);
    end

    % Relative error calculation using max absolute value norm
    error_val = max(abs(x_new - x_old)) / max(abs(x_new));
    c = c + 1;

    % Check for convergence
    if error_val < eps_val
        break;
    end

    % Update old values for next iteration
    x_old = x_new;
end

% Print the results
fprintf('Jacobi: επαναλήψεις = %d\n', c);
for i = 1:n
    fprintf('x(%d) = %.15f\n', i, x_new(i));
end
