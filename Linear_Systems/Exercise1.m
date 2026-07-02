% Program askisi1
clear; clc;

n = 5;

% Matrix and vector initialization
A = [ 10.0, -1.0,  2.0,  0.0,  1.0;
      -1.0, 11.0, -1.0,  3.0,  2.0;
       2.0, -1.0, 10.0, -1.0,  1.0;
       0.0,  3.0, -1.0,  8.0, -2.0;
       1.0,  2.0,  1.0, -2.0,  9.0 ];

b = [ 6.0; 25.0; -11.0; 15.0; 9.0 ]; 

x = zeros(n, 1);

% Forward Elimination Loop
for r = 1:(n - 1)
    
    max_val = abs(A(r, r));
    pos = r;
    
    for i = (r + 1):n
        if max_val < abs(A(i, r))
            max_val = abs(A(i, r));
            pos = i;
        end
    end
    
    if r ~= pos
        % Swap rows in Matrix A
        temp = A(r, :);
        A(r, :) = A(pos, :);
        A(pos, :) = temp;
        
        % Swap elements in vector b
        temp1 = b(r);
        b(r) = b(pos);
        b(pos) = temp1;
    end
 
    for i = (r + 1):n
        m = A(i, r) / A(r, r);
        for j = r:n
            A(i, j) = A(i, j) - m * A(r, j);
        end
        b(i) = b(i) - m * b(r);
    end
    
end

x(n) = b(n) / A(n, n);

for i = (n - 1):-1:1
    s = 0.0;
    for k = (i + 1):n
        s = s + A(i, k) * x(k);
    end
    x(i) = (b(i) - s) / A(i, i);
end

for i = 1:n
    fprintf('x(%d) = %.15f\n', i, x(i));
end
