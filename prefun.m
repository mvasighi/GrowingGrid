function [pre_X,pre_param]=prefun(X,option)
% Preprocessing function 
% apply range-scaling or auto-scaling

% Growing Grid (GG)
% version 1.0 - Dec 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

[n1,~]=size(X);

switch option
    case 'rs' % range scaling the columns
        pre_X=(X-repmat(min(X),n1,1))./(repmat(max(X)-min(X),n1,1));
        pre_param.min=min(X);
        pre_param.max=max(X);
    case 'as' % mean centering
        pre_X=(X-repmat(mean(X),n1,1))./(repmat(std(X),n1,1));
        pre_param.cmean=mean(X);
        pre_param.cstd=std(X);
end