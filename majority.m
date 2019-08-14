function m=majority(j,temp,nop,non,neighbors)
choices(1)=0;%correct
choices(2)=0;%wrong


%一维结构
% for i=(j+1):(j+non)
%     if(i>nop)
%         i=i-nop;
%     end
%     if(temp(i)==1)
%         choices(1)=choices(1)+1;
%     else
%         choices(2)=choices(2)+1;
%     end
% end

%二维结构
pick=neighbors(j,:);
for i=1:non
    if(temp(pick(i))==1)
        choices(1)=choices(1)+1;
    else
        choices(2)=choices(2)+1;
    end
end


if(choices(1)>choices(2))
    m=1;
elseif(choices(2)>choices(1))
    m=-1;
else
    m=sign(randn(1));
end