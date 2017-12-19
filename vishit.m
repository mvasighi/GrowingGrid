% Visualization of top-map and Labeling function
% by: Mahdi Vasighi
% -------------------------------------------------------------------------
function vishit(net)
set(gcf,'position',[50 50 640 640],'Color',[1 1 1])
set(gcf, 'name', 'Hit map')
set(gcf, 'NumberTitle', 'off')

maxsize=max(max(net.grd')-min(net.grd'));
gCord=net.grd;

maxbox=450/maxsize;
maxhit=max(net.hitcount);
hold on
plot(gCord(1,:),gCord(2,:),'ws','markersize',maxbox,'markerfacecolor',[1 1 1],'MarkerEdgeColor',[0 0 0])

for i=1:size(net.grd,2)
plot(gCord(1,i),gCord(2,i),'ws','markersize',eps+(net.hitcount(i)/maxhit)*maxbox,'markerfacecolor',[1 0 0],'MarkerEdgeColor',[1 1 1])
% text(gCord(1,i),gCord(2,i),num2str(net.hitcount(i)))
end
axis equal
axis off
hold off