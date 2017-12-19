function [nb_id,bo_id]=findbound(ds)
% finding boundary and non-boundary neurons

% Growing Grid (GG)
% version 1.0 - Dec 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

nb_id=find(sum(ds==1)==4); % non-boundary nodes
bo_id=find(sum(ds==1)<4);  % boundary nodes