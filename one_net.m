function neighbors=one_net(nop,no)
neighbors=zeros(1,100);
for j=1:100
    if(j+no>nop)
        num=j+no-nop;
    else
        num=j+no;
    end
    neighbors(j)=num;
end