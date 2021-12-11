function [e,c,g,a,hl,indic]=chs(indic,xy,lm)
    global A B L nb
    nn=length(xy)/2;
    
    
    x=xy(1:nn);
    y=xy(nn+1:end);
    
    if indic==1
       plot([0;x;A],[0;y;B],'-b');
       return
       indic=0;     
    end
    
    
    if indic==2
       e=L(1)*(y(1)/2);
       for i=2:nn
           e=e+L(i)*(y(i)+y(i-1))/2;
       end
       e=e+L(nb)*(B+y(nn))/2;
       c=sparse(1,nb);
       c(1)=(x(1))^2+(y(1))^2-L(1)^2;
       for j=2:nn
           c(j)=(x(j)-x(j-1))^2+(y(j)-y(j-1))^2-L(j)^2;
       c(nb)=(A-x(nn))^2+(B-y(nn))^2-L(nb)^2;
       c
       return 
       indic=0;
    end
    
    
    
    if indic==4
        
       e=L(1)*(y(1)/2);
       for i=2:nn
           e=e+L(i)*(y(i)+y(i-1))/2;
       end
       e=e+L(nb)*(B+y(nn))/2;
       c=sparse(1,nb);
       c(1)=(x(1))^2+(y(1))^2-L(1)^2;
       for j=2:nn
           c(j)=(x(j)-x(j-1))^2+(y(j)-y(j-1))^2-L(j)^2;
       end
       c(nb)=(A-x(nn))^2+(B-y(nn))^2-L(nb)^2;
        
        
        g=zeros(1,2*nn);
        for i=1:nn
            g(i)=0;
        end
        for j=(nn+1):(2*nn-1)
            g(j)=(L(j-nn)+L(j+1-nn))/2;
        end
        g(2*nn)=(L(nn)+L(nb))/2;
        
        a=zeros(nb,2*nn);
        a(1,1)=2*x(1);
        a(nb,nn)=-2*(A-x(nn));
        for i=2:nn
            a(i,i)=2*(x(i)-x(i-1));
            a(i,i-1)=-2*(x(i)-x(i-1));
        end
        a(1,nn+1)=2*y(1);
        a(nb,2*nn)=-2*(B-y(nn));
        for i=2:nn
            a(i,i+nn)=2*(y(i)-y(i-1));
            a(i,i-1+nn)=-2*(y(i)-y(i-1));
        end
        return
        indic=0;
    end
    
    
    if indic==5
        hl=sparse(2*nn,2*nn);
        hl(1,1)=2*lm(1);
        hl(nn+1,nn+1)=2*lm(1);
        hl(nn,nn)=2*lm(nb);
        hl(2*nn,2*nn)=2*lm(nb);
        
        for i=2:nn
            hl(i,i)=hl(i,i)+2*lm(i);
            hl(i,i-1)=hl(i,i-1)+(-2)*lm(i);
            hl(i-1,i)=hl(i-1,i)+(-2)*lm(i);
            hl(i-1,i-1)=hl(i-1,i-1)+2*lm(i);
            hl(nn+i,nn+i)=hl(i+nn,i+nn)+(2)*lm(i);
            hl(i+nn,i-1+nn)=hl(i+nn,i-1+nn)+(-2)*lm(i);
            hl(i-1+nn,i+nn)=hl(i-1+nn,i+nn)+(-2)*lm(i);
            hl(i-1+nn,i-1+nn)=hl(i-1+nn,i-1+nn)+2*lm(i);
            
        end
        hl
        return
        indic=0;
    end
    
end

    
