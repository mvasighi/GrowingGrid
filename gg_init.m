function net=gg_init(X,netset)
% GG initialization 

% Growing Grid (GG)
% version 1.0 - Dec. 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/
grd=[0 0;1 0;0 1;1 1]'; %initial grid positions

switch netset.inw
    case 'rn'
        W=rand(size(X,2),size(grd,2));
    case 'mn'
        W=mean(X)'*ones(1,4);
    otherwise
        
end
net.W=W;
net.grd=grd;