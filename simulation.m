function [neighbors,result]=simulation(nop,maxneighbor,nor,prophet)
tic
result=zeros(10,maxneighbor);
neighbors=zeros(nop,nop);

for j=1:maxneighbor
    if(mod(j,1)==0)
        fprintf("ÁÚ¾Ó£º%d\n",j);
        for i=1:10
            for k=1:nop
                %neighbors(k,:)=two_net(nop,k);
                %neighbors(k,:)=one_net(nop,k);
                neighbors(k,:)=rand_net(nop);
            end
            result(i,j)=onegame(nop,j,nor,prophet,neighbors);
        end
    end
end

result(11,1:maxneighbor)=sum(result(1:10,1:maxneighbor))/10;

toc
