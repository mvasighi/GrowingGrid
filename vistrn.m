function vistrn(net,data)
% ploting neurons in data sapce

[xcord,ycord]=find(triu(linkdist(net.grd))==1);
figure(5)
plot(data(:,1),data(:,2),'.','markersize',12)
hold on
plot(net.W(1,:),net.W(2,:),'.r','markersize',18,'markerfacecolor','r')
for ii=1:length(xcord)
    line([net.W(1,xcord(ii)),net.W(1,ycord(ii))],[net.W(2,xcord(ii)),net.W(2,ycord(ii))],'Color','r');
end
axis equal
hold off
drawnow

