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
            player(j,3)=decision(majority(j,temp,nop,non,neighbors)); %decision���ʵؾ������ڻ򲻴���
            %if(player(j,3)==1)
            %    record(i,round)=record(i,round)+1;%ͳ��ÿ�ξ���ѡ�Ե�����
            %end
        end
    end
end
%player(:,3)=player(:,3)*rc;%����ȷ��ʱʹ��
player(:,2)=player(:,2)+player(:,3);
