# survival_simulation
群体决策项目的MATLAB仿真

可能有一定出入，但是功能基本是对的

关键变量定义
1. Simulation.m
Nop：玩家人数，包括预言家
Maxneighbor：最大邻居数目，即simulation.m生成的横轴最大值
Nor：进行游戏轮数，即生命值变化了多少次
Prophet：预言家数目
Non：邻居数目，是Onegame的输入参数，Simulation函数不断改变这个值，重复调用Onegame。
Neighbor：在一切开始之前会进行初始化，查找每个玩家的二维邻居，每次玩家决策的时候要参考这个矩阵来找到自己的邻居。每行表示一个玩家按顺序的所有可能邻居。比如，当前游戏每个人有10个邻居，那么每个玩家决策的时候会参考自己那一行的前10个玩家。
2. Onegame.m
Player：记录全体玩家的决策，是一个nop*3的矩阵，第一列记录玩家身份（预言家/非预言家），第二列记录玩家当前生命值（初始为50），第三列记录玩家决策（1或-1）。每次调用决策产生的结果将记录在第三列，在决策结束，即调用一次oneround之后，将把第三列加到第二列上。换句话说就是如果选1，那么生命值+1，如果选-1，那么生命值-1。预言家第三列始终为1，生命值不发生变化，计算平均生命值的时候也不计入。
Pro_loc：一维数组，根据prophet的值决定预言家的位置。比如，若设定pro_loc=1:prophet，且prophet=5，那么pro_loc=[1 2 3 4 5]，即前五位玩家是预言家。也可以设定随机数（用randi函数）来决定预言家位置。

后面的函数就没有什么新变量了。



函数说明
Simulation.m: 
输入nop，maxneighbor，nor，prophet，输出邻居分布neighbors和结果results。Results是一个11*maxneighbor的矩阵，其中最后一行是前十行的平均。获取宏观结果results时，选中最后一行进行plot即可。
result得到的纵轴是nop个玩家在当前参数设定下进行nor轮游戏后的平均生命值，横轴表示邻居数目。
这个函数基本上是在改变不同的邻居数目，重复调用onegame进行游戏。每个邻居数目调用10次取平均值，即maxneighbor=100时，调用onegame 1000次。

Onegame.m
	模拟一次游戏，即模拟了整个nor轮决策的过程。换句话说，Onegame所做的就是调用了Oneround nor次。

Oneround.m
	模拟一轮游戏，即从决策五五开到给定的决策次数后得到最终结果这个过程。Oneround每进行一次，玩家生命值根据最终决策进行一次调整；过程中不会进行调整。每个玩家进行决策的时候会调用decision和majority这两个函数。
	每轮开始的时候会进行一次初始化。最初希望全体玩家决策计入预言家后五五开，所以按照5%的预言家比率，实际选择1决策的平民比率是0.47368，但是这样导致了一些更复杂的问题……我后来做的仿真都是把这个数字改回0.5，然后预言家位置随机来做的。这个初始化怎么影响最终结果是一个很有意思的点，可以好好研究一下。

Majority.m
	根据neighbors变量的内容，找到玩家的所有邻居。返回多数决策，选1的多就返回1，选-1得多就返回-1，一样多就随机返回。

Decision.m
	输入Majority的返回结果，决定玩家自己的决策。决策概率这个关键参数是在这里设置的，原理是采集一个[0,1]的随机数，如果大于p，就不从众，否则从众。这个p设置多少可以自己决定，我一般基准设定为0.75或0.8，然后可以上下浮动看看有什么变化。

生成网格视频的那个函数还在改，所以没传，过两天会传上去。
