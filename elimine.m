function [tilde_AA, tilde_LL] = elimine(AA, LL, Refneu);
  #Applique la méthode de pseudo-élimination
  tilde_AA=AA;
  tilde_LL=LL;
  for i =1:length(Refneu)
    if Refneu(i)==1
      tilde_AA(i,:) = 0;
      tilde_AA(:,i) = 0;
      tilde_AA(i,i) = 1;
      tilde_LL(i)=0;
      end
  end
  
endfunction
