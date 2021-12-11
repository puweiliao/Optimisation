indic=1;
global A;
A=1;
global B;
B=-1;

global L;
L=[0.7;0.5;0.3;0.2;0.5];

global nb;
nb=length(L);

xy=[0.2;0.4;0.6;0.8;-1.0;-1.5;-1.5;-1.3];
global N;
N=length(xy);


%[e,c,g,a,hl,indic]=chs(1,xy,[]);




chs(5,xy,[0.01,0.01,0.01,0.01,0.01])


%calcule d'erreur de gradient  
% {
% 
% for i=1:length(xy)  
%     erreur_grad(@energie, i, xy,g)
% end
% 
% }



%calcule d'erreur de jacobien


% {
% [Jac] = erreur_Jac(@longueur, xy);
% err_J = sparse(length(L),length(xy));
% for i = 1:length(L)
%     for j = 1:length(xy)
%         if a(i,j) == 0
%             err_J(i,j) = 0;
%         end
%         if a(i,j) ~= 0
%             err_J(i,j) = abs(Jac(i,j)-a(i,j))/a(i,j);
%         end
%     end
% end
% err_J
% }

