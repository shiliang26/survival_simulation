function pick=two_net(nop,no)
tic
pick=zeros(nop,1);
factor=sqrt(nop);
counter=1;
step=1;
x=mod(no,factor);
y=floor(no/factor)+1;
while(counter~=nop)
    target=x+step;
    while(x~=target && counter~=nop)
        x=x+1;
        pick(counter)=factor*(y-1)+x;
        counter=counter+1;
    end
    target=y-step;
    while(y~=target && counter~=nop)
        y=y-1;
        pick(counter)=factor*(y-1)+x;
        counter=counter+1;
    end
    step=step+1;
    target=x-step;
    while(x~=target && counter~=nop)
        x=x-1;
        pick(counter)=factor*(y-1)+x;
        counter=counter+1;
    end
    target=y+step;
    while(y~=target && counter~=nop)
        y=y+1;
        pick(counter)=factor*(y-1)+x;
        counter=counter+1;
    end
    step=step+1;
end

pick(pick>nop)=pick(pick>nop)-nop;
pick(pick<=0)=pick(pick<=0)+nop;
