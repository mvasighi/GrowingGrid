% Growing Grid (GG)
% version 1.0 - Dec 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

% Demo: Iris data analysis

close all
clear
clc

load iris
data=X(:,1:2);

netset = setting('gg');

netset.sf  = 0.8;      %spread-out factor
netset.epch = 100;     %training epoch
netset.vis = 'y';
netset.inw= 'mn';

net=gg(data,netset);

figure(1);vismap(net,class)
figure(2);vishit(net)
