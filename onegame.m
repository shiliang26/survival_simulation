function [result]=onegame(nop,non,nor,prophet,neighbors)
player=zeros(nop,3);
player(:,2)=50;
pro_loc=1:prophet;%…Ë÷√‘§—‘º“Œª÷√
civ_loc=setdiff(1:nop,pro_loc);
player(pro_loc,1)=1;
%record=zeros(100,100);
for i=1:nor
    [player]=oneround(player,nop,non,pro_loc,neighbors);
%     if(mod(i,10)==0)
%        bar(player(:,2));
%        axis([1 100 0 550]);
%        title(i);
%        pause;
%     end
end
result=sum(player(civ_loc,2))/(nop-prophet);

%for i=1:100
%    record(i,101)=sum(record(i,1:100))/100;
%end