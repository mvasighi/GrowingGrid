function netset=setting(method)
% setting initializes a default structure for DBGSOM parameters
% input: method                        type of settings
%                               'gg' for Growing Grid.
% output: netset 

% netset.method     method name ('gg')
% netset.epch       number of epochs (default = NaN)
% netset.amax       max. learning rate (default = 0.5)
% netset.amin   	min. learning rate (default = 0.01)
% netset.vis    	training visualization (for 2D datasets) ('y', 'n') (default = 'n')
% netset.pmax   	initial neighborhood function width (a number between 0 and 1) (default = 2)
% netset.pmin   	final neighborhood function width (a number between 0 and pmax)(default = 0.7)
% netset.sf         spread-out factor ( 0 > sf > 1) (default = NaN)

% Growing Grid (GG)
% version 1.0 - July 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/
netset.method = method;    % method name
netset.epch   = 100;       % number of epochs
netset.amax   = 0.2;       % max. learning rate
netset.amin   = 0.01;      % min. learning rate
netset.neighb = 'linear';  % neighbor function
netset.vis    = 'n';       % training visualization (yes, no)
netset.inw    = 'rn';      % weight of starting neurons (mn: mean of data, rn: random)
netset.pmax   = 2;         % max. neighbor radius
netset.pmin   = 2;         % min. neighbor radius
netset.sf     = NaN;       % spread-out factor
