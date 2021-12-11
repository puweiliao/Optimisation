function [e] = energie(xy)       %calcule de l'energie potentielle e
    global A; global B; global L;
    nb = length(L);
    nn = length(xy)/2;      
    x = xy(1:nn);
    y = xy(nn+1:end);
    e=L(1)*(y(1)/2);
    for i=2:nn
        e=e+L(i)*(y(i)+y(i-1))/2;
    end
    e=e+L(nb)*(B+y(nn))/2;
    return
  
end
