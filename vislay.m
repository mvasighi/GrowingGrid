% Visualization of weight layers
% by: Mahdi Vasighi
% -------------------------------------------------------------------------
function vislay(net,laynum)
set(gcf,'position',[50 50 640 640],'Color',[1 1 1])
set(gcf, 'name', ['Weight layer',num2str(laynum)])
set(gcf, 'NumberTitle', 'off')

maxsize=max(max(net.grd')-min(net.grd'));
gCord=net.grd;

maxbox=430/maxsize;
maxval=max(net.W(laynum,:));
hold on
% plot(gCord(1,:),gCord(2,:),'ws','markersize',maxbox,'markerfacecolor',[1 1 1],'MarkerEdgeColor',[0 0 0])

for i=1:size(net.grd,2)
plot(gCord(1,i),gCord(2,i),'ws','markersize',maxbox,'markerfacecolor',(net.W(laynum,i)/maxval).*[1 1 1],'MarkerEdgeColor',[0 0 0])
% text(gCord(1,i),gCord(2,i),num2str(net.hitcount(i)))
end
axis equal
axis off
hold off