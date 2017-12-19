function Err=errcalc(win_err,win_id,grd)
% Accumulative error calculation

% Growing Grid (GG)
% version 1.0 - Dec. 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

Err=zeros(1,size(grd,2));
for i=1:size(grd,2)
    Err(i)=sum(win_err(find(win_id==i)));
end