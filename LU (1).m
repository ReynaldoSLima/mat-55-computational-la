function x = LU(A,b)
%---------------------Algoritmo de fatoração LU-------------------%
%Recebemos A e b e retornamos a solução, usando, para isso usando o
%UTriang, o LTriang (dado que achamos LU = A), resolvermos Ly = b e Ux = y

N = size(A);
n = N(1);

L = eye(n);
U = A;

for i = 1:n-1
    for k = i+1:n
        if A(i, i) == 0
            %Esse caso implica em SPI
            k = n;
            i = n-1;
        else
            L(k,i) = U(k, i)/U(i, i);
            for j = i+1:n
                U(k,j) = U(k, j) - L(k,i)*U(i,j);
            end
            U(k,i) = 0;
        end
    end
end

y = LTriang(L, b);
x = UTriang(U, y);