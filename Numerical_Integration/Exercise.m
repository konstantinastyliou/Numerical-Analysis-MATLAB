% Program askisi1
clear; clc;

pi_val = 4.0 * atan(1.0);
a = 0.0;
b = 2.0 * pi_val;
e = 1.0e-5;

% Rectangle Method
fprintf('methodos orthogoniou\n');
n = 4;
while true
    qn = orth(a, b, n);
    q2n = orth(a, b, 2 * n);
    fprintf('n = %d  Result = %f\n', n, qn);

    if abs(q2n - qn) <= abs(q2n) * e
        fprintf('sygklisi sto n = %d  Timi = %f\n', 2 * n, q2n);
        break;
    end
    n = 2 * n;
end

%Trapezoidal Method
fprintf('methodos trapeziwn\n');
n = 4;
while true
    qn = trap(a, b, n);
    q2n = trap(a, b, 2 * n);
    fprintf('n = %d  Result = %f\n', n, qn);

    if abs(q2n - qn) <= abs(q2n) * e
        fprintf('sygklisi sto n = %d  Timi = %f\n', 2 * n, q2n);
        break;
    end
    n = 2 * n;
end

%Simpson Method
fprintf('methodos Simpson\n');
n = 4;
while true
    qn = simp(a, b, n);
    q2n = simp(a, b, 2 * n);
    fprintf('n = %d  Result = %f\n', n, qn);

    if abs(q2n - qn) <= abs(q2n) * e
        fprintf('sygklisi sto n = %d  Timi = %f\n', 2 * n, q2n);
        break;
    end
    n = 2 * n;
end


function result = orth(a, b, n)
    h = (b - a) / n;
    x = zeros(1, n + 1);
    for i = 0:n
        x(i + 1) = a + (b - a) * i / n; 
    end
    s = 0.0;
    for i = 1:n
        temp = (x(i) + x(i + 1)) / 2.0;
        s = s + f(temp);
    end
    result = h * s;
end

function result = trap(a, b, n)
    h = (b - a) / n;
    x = zeros(1, n + 1);
    for i = 0:n
        x(i + 1) = a + (b - a) * i / n;
    end
    s = 0.0;
    for i = 1:(n - 1)
        s = s + f(x(i + 1));
    end
    result = (h / 2.0) * (f(x(1)) + 2.0 * s + f(x(n + 1)));
end

function result = simp(a, b, n)
    h = (b - a) / n;
    x = zeros(1, n + 1);
    for i = 0:n
        x(i + 1) = a + (b - a) * i / n;
    end
    s1 = 0.0;
    for i = 2:2:(n - 2)
        s1 = s1 + f(x(i + 1));
    end
    s2 = 0.0;
    for i = 1:2:(n - 1)
        s2 = s2 + f(x(i + 1));
    end
    result = (h / 3.0) * (f(x(1)) + 2.0 * s1 + 4.0 * s2 + f(x(n + 1)));
end

function result = f(x)
    result = exp(-(x^3)) * sin(3.0 * x);
end
