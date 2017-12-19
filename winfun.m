function [Minval,winlist]=winfun(data,W)
% finding list of winner neurons and corresponding error values for data 

% Growing Grid (GG)
% version 1.0 - Dec. 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

[Minval,winlist]=min(dist(W',data'));