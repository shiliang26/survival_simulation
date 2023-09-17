function [player]=roundtest(nop,non)
pro_loc=[1 2 3 4 5];
civ_loc=setdiff(1:nop,pro_loc);
player=zeros(101,33);
player(:,2)=50;
player(pro_loc,1)=1;
player(pro_loc,3:33)=1;
player(civ_loc,3)=50+sign(randn(1,length(civ_loc)));

for i=1:30
    temp=player(:,i+2);
    for j=1:nop
            player(j,i+3)=decision(majority(j,temp,nop,non));%研究选项分布
            %player(j,i+3)=player(j,i+2)+decision(majority(j,temp,nop,non));%研究生命分布
    end
end

%for i=3:33
%player(101,i)=sum(player(:,i));
%end %研究选项分布
%for i=7:100
%player(i,34)=sum(player(i,2:33));
%end 

