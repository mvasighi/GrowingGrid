% Visualization of top-map and Labeling function
% by: Mahdi Vasighi
% -------------------------------------------------------------------------
function vismap(net,LB)

set(gcf,'position',[50 50 640 640],'Color',[1 1 1])
set(gcf, 'name', 'Top map')
set(gcf, 'NumberTitle', 'off')
% maxsize=max(max(grd'))-min(min(grd'));
maxsize=max(max(net.grd,[],2)-min(net.grd,[],2));
gCord=net.grd;
plot(gCord(1,:),gCord(2,:),'ws','markersize',450/maxsize,'markerfacecolor',[1 1 1],'MarkerEdgeColor',[0 0 0])

axis equal
axis off
text_color = [0 0 0];

for i=1:length(LB)
    text(gCord(1,net.winlist(i))+(0.6*randn/maxsize),gCord(2,net.winlist(i))+(0.6*randn/maxsize),num2str(LB(i)),'horizontalalignment','left','color',text_color)
end




% while ~isempty(LB)
%     ww=find(net.winlist==net.winlist(1));
%     for i=1:length(ww)
% %         text(gCord(1,net.winlist(1))+(0.7*randn/maxsize),gCord(2,net.winlist(1))+(0.7*randn/maxsize),num2str(LB(ww(i))),'fontsize',150/maxsize,'horizontalalignment','left','color',text_color)
%         text(gCord(1,net.winlist(1))+(0.6*randn/maxsize),gCord(2,net.winlist(1))+(0.6*randn/maxsize),num2str(LB(ww(i))),'horizontalalignment','left','color',text_color)
%     end
%     net.winlist(ww)=[];
%     LB(ww)=[];
% end

