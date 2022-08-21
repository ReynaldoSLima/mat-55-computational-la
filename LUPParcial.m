function x = LUPParcial(A,b)
%---------------------Algoritmo de fatoração LU com Pivotamento Parcial -------------------
%Recebemos A e b e retornamos a solução, usando, para isso usando, além do
%pivotamento, as matrizes
%UTriang e LTriang (dado que achamos LU = A), resolvermos Ly = b e Ux = y
%(com as permutações adequadas sendo feitas)

N = size(A);
n = N(1);

L = eye(n);
U = A;

for i = 1:n-1
    p = i;
    q = U(i, i);
    for l = i+1:n-1
        if abs(U(l, i)) > abs(q)
            q = U(l, i);
            p = l;
        end
    end
    %Achamos a posição que tem o pivô que queremos, e agora?
    %Basta trocar a linha i pela linha k!!!! (Além disso, temos que ajustar
    %as equações, ou seja, L e b
    aux = U(i,:);
    U(i, :) = U(p, :);
    U(p, :) = aux;
    aux2 = b(i);
    b(i) = b(p);
    b(p) = aux2;
    for l = 1:i-1
        aux3 = L(i, l);
        L(i, l) = L(p, l);
        L(p, l) = aux3;
    end
    
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