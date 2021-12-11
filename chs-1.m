function[e,c,g,a,hl,indic] = chs(indic,xy,lm)
  e = [];c = []; g = []; a = []; hl = [];
  global A; global B; global L;
  nb = length(L);
  nn = length(xy)/2;     
  x = xy(1:nn);
  y = xy(nn+1:end);


 
  if indic==1
    plot([0;x;A],[0;y;B]);
    indic = 0;
    return
  endif
   

  
  if indic==2
    c = sparse(1,nb);
    e=L(1)*(y(1)/2);
    c(1)=(x(1))^2+(y(1))^2-L(1)^2;
    for i=2:nn
      e=e+L(i)*(y(i)+y(i-1))/2;
      c(i)=(x(i)-x(i-1))^2+(y(i)-y(i-1))^2-L(i)^2;
    endfor
    e=e+L(nb)*(B+y(nn))/2;
    c(nb)=(A-x(nn))^2+(B-y(nn))^2-L(nb)^2;
    c = c';
    indic = 0;
    return
  endif
  
  
  if indic==4
    c = sparse(1,nb);
    e=L(1)*(y(1)/2);
    c(1)=(x(1))^2+(y(1))^2-L(1)^2;
    for i=2:nn
      e=e+L(i)*(y(i)+y(i-1))/2;
      c(i)=(x(i)-x(i-1))^2+(y(i)-y(i-1))^2-L(i)^2;
    endfor
    e=e+L(nb)*(B+y(nn))/2;
    c(nb)=(A-x(nn))^2+(B-y(nn))^2-L(nb)^2;
    c = c';
    g = sparse(1,2*nn);
    for j = nn+1:2*nn
      g(j) = (L(j-nn)+L(j+1-nn))/2;
    endfor
    g = g';
    a = sparse(nb,2*nn);
    a(1,1) = 2*x(1);
    a(1,1+nn) = 2*y(1);
    for k = 2:nn
      a(k,k) = 2*(x(k)-x(k-1));
      a(k,k+nn) = 2*(y(k)-y(k-1));
      a(k,k-1) = -2*(x(k)-x(k-1));
      a(k,k+nn-1) = -2*(y(k)-y(k-1));
    endfor
    a(nb,nn) = -2*(A-x(nn));
    a(nb,2*nn) = -2*(B-y(nn));
    indic = 0;
    return
  endif
  
  
  
  if indic==5
    hl = sparse(2*nn,2*nn);
    for i = 2:nn
      hl(i,i) = hl(i,i)+2*lm(i);
      hl(i,i-1) = hl(i,i-1)-2*lm(i);
      hl(i-1,i) = hl(i-1,i)-2*lm(i);
      hl(i-1,i-1) = hl(i-1,i-1)+2*lm(i);
      hl(i+nn,i+nn) = hl(i+nn,i+nn)+2*lm(i);
      hl(i+nn,i+nn-1) = hl(i+nn,i+nn-1)-2*lm(i);
      hl(i+nn-1,i+nn) = hl(i+nn-1,i+nn)-2*lm(i);
      hl(i+nn-1,i+nn-1) = hl(i+nn-1,i+nn-1)+2*lm(i);
    endfor
    hl(1,1) = hl(1,1)+2*lm(1);
    hl(nn+1,nn+1) = hl(nn+1,nn+1)+2*lm(1);
    hl(nn,nn) = hl(nn,nn)+2*lm(nb);
    hl(2*nn,2*nn) = hl(2*nn,2*nn)+2*lm(nb);
    indic = 0;
    return
  endif
  
  
  
  
  
  
  
  
  

    

    

endfunction