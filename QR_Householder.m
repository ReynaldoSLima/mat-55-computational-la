function R1 = QR_Householder(A, m, n, b)


sig = @(u) sign(u) + (u==0);

for k = 1:n
    x = A(k:m, k);
    if abs(x(1,1)) < 10^-5
        x(1, 1) = 0;
    end
    e = eye(m-k+1, 1);
    u = (x + sig(x(1,1))*norm(x)*e)/norm(x + sig(x(1,1))*norm(x)*e);
    A(k:m, k:n) = A(k:m, k:n) - 2*(u*u.')*A(k:m, k:n);
    A(k+1:m, k) = 0;
    b(k:m, 1) = b(k:m, 1) - 2*(u*u.')*b(k:m, 1);
    
end

R1 = A(1:n, 1:n);
b1 = b(1:n);
x = UTriang(R1, b1);

end
    
    