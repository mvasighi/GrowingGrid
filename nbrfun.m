function h=nbrfun(netset,ds,ep)
% neighbor function 

% Growing Grid (GG)
% version 1.0 - Dec. 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

lr=netset.lrvec(ep);


switch netset.neighb
    case 'gauss'
        lr=netset.lrvec(ep);
        l = netset.pvec(ep)-ds;
        l(l<0)=0;
        l(l>=0)=1;
        h = lr.*exp(-(ds.^2)/(2*((netset.pvec(ep))^2))).*l;
    case 'linear'
        nbr=(1-(ds./(netset.pvec(ep)+1)));
        nbr(nbr<0)=0;
        h = netset.lrvec(ep)*nbr;
end
        
  