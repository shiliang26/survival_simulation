function [player]=oneround(player,nop,non,pro_loc,neighbors)
player(pro_loc,3)=1;
for j=1:nop
        if(player(j,1)==0)
            if(rand<0.47368)%0.47368
                player(j,3)=1;
            else
                player(j,3)=-1;
            end
        end
end

for i=1:11
    temp=player(:,3);
    for j=1:nop
        if(player(j,1)==0)
            player(j,3)=decision(majority(j,temp,nop,non,neighbors)); %decision概率地决定从众或不从众
            %if(player(j,3)==1)
            %    record(i,round)=record(i,round)+1;%统计每次决策选对的人数
            %end
        end
    end
end
%player(:,3)=player(:,3)*rc;%有正确答案时使用
player(:,2)=player(:,2)+player(:,3);
