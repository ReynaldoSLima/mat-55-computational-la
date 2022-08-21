function x = LTriang(A, b)
%------ Resolvendo um sistema tri�ngular inferior (Lower Triangular)-------%
%Recebemos uma matriz A e uma b, retornando o x que satisfaz a equa��o
%Ax = b, com A uma matriz triangular inferior
%Observe que temos que checar a cada passo se o termo A(i, i) � n�o-nulo
%ALGORITMO DE SUBSTITUI��O DIRETA


N = size(A);
n = N(1);

if A(1, 1) ~=0
    b(1) = b(1)/(A(1, 1));
end

for i = 2:n
    if A(i, i) == 0
        %Se, por ventura, tiver um atrevido zero, temos um problema (SPI)
        i = n;
    else
        for j = 1:1:i-1
            b(i) = (b(i) - A(i, j)*b(j));
        end
        b(i) = b(i)/A(i, i);
    end
end

x = b;
end