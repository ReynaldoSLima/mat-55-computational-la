function [b, A] = Q5A(n)
%------------------Função que retorna a matriz que queremos--------------
for i = 1:n
    for j = 1:n
        A(i, j) = 1/(i+j-1);
    end
    b(i) = 1;
end

b = b';
end