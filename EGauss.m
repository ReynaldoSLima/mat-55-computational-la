function x = EGauss(A,b)
%---------------------Algoritmo de eliminação Gaussiana-------------------%
%Recebemos A e b e retornamos a solução, usando, para isso usando o UTriang

N = size(A);
n = N(1);

for i = 1:n-1
    for k = i+1:n
        if A(i, i) == 0
            %Esse caso implica em SPI
            k = n;
            i = n-1;
        else
            m = A(k, i)/A(i, i);
            for j = i+1:n
                A(k,j) = A(k, j) - m*A(i,j);
            end
            A(k,i) = 0;
            b(k) = b(k) - m*b(i);
        end
    end
end

x = UTriang(A,b);
