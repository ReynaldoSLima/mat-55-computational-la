function x = UTriang(A, b)
%------ Resolvendo um sistema triângular superior (Upper Triangular)-------%
%Recebemos uma matriz A e uma b, retornando o x que satisfaz a equação
%Ax = b, com A uma matriz triangular superior
%Observe que temos que checar a cada passo se o termo A(i, i) é não-nulo
%ALGORITMO DE SUBSTITUIÇÃO INVERSA

N = size(A);
n = N(1);

if A(n, n) ~=0
    b(n) = b(n)/(A(n, n));
end

for i = n-1:-1:1
    if A(i, i) == 0
        %Se, por ventura, tiver um atrevido zero, temos um problema (SPI)
        i = 1;
    else
        for j = i+1:1:n
            b(i) = (b(i) - A(i, j)*b(j));
        end
        b(i) = b(i)/A(i, i);
    end
end

x = b;
end