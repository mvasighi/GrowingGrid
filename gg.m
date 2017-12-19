function net=gg(data,netset)
% Training function for GG

% Growing Grid (GG)
% version 1.0 - July 2017
% Mahdi Vasighi
% Institute for Advanced Studies in Basic Sciences, Zanjan, Iran
% Department of Computer Science and Information Technology
% www.iasbs.ac.ir/~vasighi/

[n1,m1]=size(data);
[data,pre_param]=prefun(data,'rs'); %data pre-processing
data_tmp=data;

net=gg_init(data,netset); %gsom initialization

ds=linkdist(net.grd);

% creating epoch/width/GT vector
epvec=1:netset.epch;

netset.pvec=(netset.pmax-netset.pmin)*((netset.epch-epvec)/(netset.epch-1))+netset.pmin;
netset.lrvec=(netset.amax-netset.amin)*((netset.epch-epvec)/(netset.epch-1))+netset.amin; % Learning rate
netset.GT=-m1*log(netset.sf);

%Start learning

fprintf('Growing Grid \nTraining ...')

for ep=1:netset.epch
    
    net.nnum(ep)=size(net.W,2);
        
    rndid=randperm(size(data,1));
    data=data(rndid,:);
    net.Err=zeros(1,size(net.grd,2));
    h=nbrfun(netset,ds,ep);
    for sm=1:n1
        
        [~,win_id]=winfun(data(sm,:),net.W);
%         h=nbrfun(netset,ds,ep);
        DW=repmat(h(win_id,:),size(net.W,1),1).*(repmat(data(sm,:)',1,size(net.W,2))-net.W);
        net.W=net.W+DW;
        
        %calulcating error of each neuron
        [win_Err,win_id]=winfun(data(sm,:),net.W);
        net.Err(win_id)=net.Err(win_id)+win_Err;
        
        % Growing Grid
        if net.Err(win_id)>=netset.GT
            nbr_id=ds(win_id,:)==1;%neighbors of the winner
            [~,far_id]=max(nbr_id.*dist(net.W(:,win_id)',net.W)); %id of farthest unit
            shift_vec=net.grd(:,win_id)-net.grd(:,far_id); %direction of growing (1: along x-axis, 2:along y-axis
            
            grow_dir=find(abs(shift_vec)>0); % 1: along x-axis & 2: along y-axis
                        
            new_cut_ids=find(net.grd(grow_dir,:)==net.grd(grow_dir,win_id)); %moving edge units ids
            new_grds = net.grd(:,new_cut_ids);
            
            adj_grds=net.grd(:,new_cut_ids)-repmat(shift_vec,1,length(new_cut_ids));
            [~,adj_pos]=ismember(adj_grds',net.grd','rows');
            
            W_new=(net.W(:,new_cut_ids)+net.W(:,adj_pos))/2;
            net.W=[net.W,W_new];
            
%             net.Err(new_cut_ids) = net.Err(new_cut_ids)/2;
%             net.Err(adj_pos) = net.Err(adj_pos)/2;
            net.Err(new_cut_ids) = 0;
            net.Err(adj_pos) = 0;
            net.Err=[net.Err,zeros(1,length(new_cut_ids))];
            
            if sum(shift_vec)>0
                move_ids=find(net.grd(grow_dir,:)>=net.grd(grow_dir,win_id));
            else
                move_ids=find(net.grd(grow_dir,:)<=net.grd(grow_dir,win_id));
            end
            net.grd(:,move_ids)=net.grd(:,move_ids)+repmat(shift_vec,1,length(move_ids));
            net.grd=[net.grd,new_grds];
            
            ds=linkdist(net.grd);
            h=nbrfun(netset,ds,ep);
        end
    end
    
    % ploting neurons in data sapce
    if strcmp(netset.vis,'y')
        vistrn(net,data)
    end
end
    
fprintf('[Done]\n')

net.grd=net.grd-repmat(min(net.grd')',1,size(net.grd,2));

for i=1:n1
    [~,winlist(i)]=winfun(data_tmp(i,:),net.W);
end

hitcount=zeros(1,size(net.W,2));
for j=1:size(net.W,2)
    hitcount(j)=sum(winlist==j);
end

net.winlist=winlist;
net.hitcount=hitcount;
net.pre_param=pre_param;



