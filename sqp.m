function [x,lm,info,niter] = sqp (chs,x,lm,options)
  n = length(x);
  m = length(lm);
  k = 1;
  I = zeros(m,m);
  while k <= options(3)+1
    if length(x) == 0 || length(lm) == 0  
    info = 1;
    break;
  endif
    if k == options(3)   
      info  = 2;
      break;
    endif
    [e,c,g,a,hl,indic] = chs(5,x,lm);
    [e,c,g,a,indic] = chs(4,x,lm);
    M = sparse(n+m,n+m);
    M = [hl,a.';a,I];   
    F = sparse(1,n+m);
    F = -[g+a'*lm';c];  
    pas = M\F;          
    if norm(pas(1:m))<=options(1) && norm(pas(m+1:m+n))<=options(2)     
      info  = 0;   
      break;
    else
      x = x + pas(1:n);
      lm = lm + pas'(n+1:m+n);
      k = k+1;
      niter = k;
    endif
  endwhile
  return;

endfunction
