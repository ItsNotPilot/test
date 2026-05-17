CanalDeTransmissionAK4avecBoucle.m


clear; 
clc;
N = 100000;
X = randn(1,N);

for i = 1:length(X)
    if X(i) > 0
        X(i) = 1;
    else
        X(i) = 0;
    end
end

index = 1; 
i = 1;
while index < length(X)
    if X(index)==0 && X(index+1)==0 
        Xmod(i) = -3;
    elseif X(index)==0 && X(index+1)==1
        Xmod(i) = -1;
    elseif X(index)==1 && X(index+1)==0
        Xmod(i) = 1;
    else
        Xmod(i) = 3;
    end
    index = index + 2;
    i = i + 1;
end

RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));

for k = 1:length(RSB_tot)
    RSB = RSB_tot(k);
    sigma = 1/sqrt(2) * 10^(-RSB/20);
    bruit = sigma * randn(1,length(Xmod));
    Y = Xmod + bruit;

    Xdmod = zeros(1,2*length(Y));
    idx = 1;
    for i = 1:length(Y)
        if Y(i) <= -2
            Xdmod(idx)   = 0;
            Xdmod(idx+1) = 0;
        elseif Y(i) <= 0
            Xdmod(idx)   = 0;
            Xdmod(idx+1) = 1;
        elseif Y(i) <= 2
            Xdmod(idx)   = 1;
            Xdmod(idx+1) = 0;
        else
            Xdmod(idx)   = 1;
            Xdmod(idx+1) = 1;
        end
        idx = idx + 2;
    end

    nbr_bit_faux = 0;
    for i = 1:length(X)
        if Xdmod(i) ~= X(i)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end

    TEB = nbr_bit_faux / length(X);
    TEB_tot(k) = TEB;
end

semilogy(RSB_tot, TEB_tot);

CanalDeTransmissionAK8avecBoucle.m

clear; 
clc;
N = 100000;
X = randn(1,N);
for i = 1:length(X)
    if X(i) > 0
        X(i) = 1;
    else
        X(i) = 0;
    end
end

index = 1; 
i = 1;
while index < length(X)
    if X(index)==0 && X(index+1)==0 && X(index+2)==0
        Xmod(i) = -7;
    elseif X(index)==0 && X(index+1)==0 && X(index+2)==1
        Xmod(i) = -5;
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==0
        Xmod(i) = -3;
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==1
        Xmod(i) = -1;
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==0
        Xmod(i) = 1;
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==1
        Xmod(i) = 3;
    elseif X(index)==1 && X(index+1)==1 && X(index+2)==0
        Xmod(i) = 5;
    else
        Xmod(i) = 7;
    end
    index = index + 3;
    i = i + 1;
end

RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));

for k = 1:length(RSB_tot)
    RSB = RSB_tot(k);
    sigma = 1/sqrt(2) * 10^(-RSB/20);
    bruit = sigma * randn(1,length(Xmod));
    Y = Xmod + bruit;

    Xdmod = zeros(1,3*length(Y));
    idx = 1;
    for i = 1:length(Y)
        if Y(i) < -6
            Xdmod(idx)   = 0; 
            Xdmod(idx+1) = 0; 
            Xdmod(idx+2) = 0;
        elseif Y(i) < -4
            Xdmod(idx)   = 0; 
            Xdmod(idx+1) = 0; 
            Xdmod(idx+2) = 1;
        elseif Y(i) < -2
            Xdmod(idx)   = 0; 
            Xdmod(idx+1) = 1; 
            Xdmod(idx+2) = 0;
        elseif Y(i) < 0
            Xdmod(idx)   = 0; 
            Xdmod(idx+1) = 1; 
            Xdmod(idx+2) = 1;
        elseif Y(i) < 2
            Xdmod(idx)   = 1; 
            Xdmod(idx+1) = 0; 
            Xdmod(idx+2) = 0;
        elseif Y(i) < 4
            Xdmod(idx)   = 1; 
            Xdmod(idx+1) = 0; 
            Xdmod(idx+2) = 1;
        elseif Y(i) < 6
            Xdmod(idx)   = 1; 
            Xdmod(idx+1) = 1; 
            Xdmod(idx+2) = 0;
        else
            Xdmod(idx)   = 1; 
            Xdmod(idx+1) = 1; 
            Xdmod(idx+2) = 1;
        end
        idx = idx + 3;
    end


    nbr_bit_faux = 0;
    for j = 1:length(Xdmod)
        if Xdmod(j) ~= X(j)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end

    TEB = nbr_bit_faux / length(X);
    TEB_tot(k) = TEB;
end

semilogy(RSB_tot, TEB_tot);

CanalDeTransmissionASK2avecBoucle.m



clear; clc;
N=100000;
X=randn(1,N);
for i=1:length(X)
    if X(i)>0
        X(i)=1;
    else
        X(i)=0;
    end
end

index=1; 
i=1;
while index<=length(X)
    if X(index)==0 
        Xmod(i)=-1;
    else
        Xmod(i)=1;
    end
    index=index+1;
    i=i+1;
end
RSB_tot=0:2:16
TEB_tot=zeros(1,length(RSB_tot));

for k=1:length(RSB_tot)
    RSB=RSB_tot(k)
    sigma=1/sqrt(2)10^(-RSB/20);
    bruit=sigmarandn(1,length(Xmod));
    Y=Xmod+bruit;
    Xdmod=zeros(1,length(Y));

    for i=1:length(Y)
        if Y(i)>=0
            Xdmod(i)=1;
        else
            Xdmod(i)=0;
        end
    end
    nbr_bit_faux=0
    for i=1:length(Xmod)
        if Xdmod(i)~= X(i)
            nbr_bit_faux=nbr_bit_faux+1;
        end
    end
    TEB=nbr_bit_faux/length(Xmod)
    TEB_tot(k)=TEB;


end
semilogy(RSB_tot, TEB_tot)


CanalDeTransmissionAsk2sansBoucle.m

clear; clc;
N=20;
X=randn(1,N);
for i=1:length(X)
    if X(i)>0
        X(i)=1;
    else
        X(i)=0;
    end
end

index=1; 
i=1;
while index<length(X)
    if X(index)==0 
        Xmod(i)=-1;
    else
        Xmod(i)=1;
    end
    index=index+1;
    i=i+1;
end
RSB=10;
sigma=1/sqrt(2)10^(-RSB/20);
bruit=sigmarandn(1,length(Xmod));
Y=Xmod+bruit;
plot(real(Y),imag(Y),'ro')
hold on
plot(real(Xmod),imag(Xmod),'yo')
Xdmod=zeros(1,length(Y));
for i=1:length(Y)
    if Y(i)>=0
        Xdmod(i)=1;
    else
        Xdmod(i)=0;
    end
end
nbr_bit_faux=0
for i=1:length(Xmod)
    if Xdmod(i)~= X(i)
        nbr_bit_faux=nbr_bit_faux+1;
    end
end
TEB=nbr_bit_faux/length(Xmod)

codageASK2.m


clear; clc;
N = 7000;

RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));
TEF_tot = zeros(1,length(RSB_tot));
k=7;

for k = 1:length(RSB_tot)
    X = randn(1,N);

    for i = 1:length(X)
        if X(i) > 0
            X(i) = 1;
        else
            X(i) = 0;
        end
    end

    index = 1; 
    Xcod = [];
    while index <= length(X)-k-1
        c = sum(X(index:index+k-1));
        if mod(c,2) == 0
            Xcod = [Xcod, X(index:index+k-1), 0];
        else
            Xcod = [Xcod, X(index:index+k-1), 1];
        end
        index = index + k;
    end

    Xmod = zeros(1,length(Xcod));
    for i = 1:length(Xcod)
        if Xcod(i) == 0
            Xmod(i) = -1;
        else
            Xmod(i) = 1;
        end
    end

    RSB = RSB_tot(k);
    sigma = 1/sqrt(2)10^(-RSB/20);
    bruit = zeros(1,length(Xmod));
    for i = 1:length(Xmod)
        bruit(i) = sigmarandn;
    end
    Y = Xmod + bruit;

    Xdmod = zeros(1,length(Y));
    for i = 1:length(Y)
        if Y(i) >= 0
            Xdmod(i) = 1;
        else
            Xdmod(i) = 0;
        end
    end

    Xdecod = [];
    index2 = 1;
    ERR = 0;
    while index2 <= length(Xdmod)-k
        if Xdmod(index2+k) ~= Xcod(index2+k)
            ERR = ERR + 1;
        end
        Xdecod = [Xdecod, Xdmod(index2:index2+k-1)];
        index2 = index2 + k+1;
    end

    TEF_tot(k) = ERR / (length(Xdecod)/k);

    nbr_bit_faux = 0;
    for i = 1:length(Xdecod)
        if Xdecod(i) ~= X(i)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end
    TEB_tot(k) = nbr_bit_faux / length(Xdecod);
end

figure;
semilogy(RSB_tot, TEB_tot); 
hold on;
semilogy(RSB_tot, TEF_tot);

CodageASK4.m

clear; 
clc;
N = 70000;

RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));
TEF_tot = zeros(1,length(RSB_tot));
k=7;

for idx = 1:length(RSB_tot)
    X = randn(1,N);

    for i = 1:length(X)
        if X(i) > 0
            X(i) = 1;
        else
            X(i) = 0;
        end
    end

    index = 1; 
    Xcod = [];
    while index <= length(X)-k-1
        c = sum(X(index:index+k-1));
        if mod(c,2) == 0
            Xcod = [Xcod, X(index:index+k-1), 0];
        else
            Xcod = [Xcod, X(index:index+k-1), 1];
        end
        index = index + k;
    end

    Xmod = zeros(1,length(Xcod));
    index=1; 
    i=1;
    while index<length(Xcod)
        if Xcod(index)==0 && Xcod(index+1)==0
            Xmod(i)=-3;
        elseif Xcod(index)==0 && Xcod(index+1)==1
            Xmod(i)=-1;
        elseif Xcod(index)==1 && Xcod(index+1)==0
            Xmod(i)=1;
        else
            Xmod(i)=3;
        end
        index=index+2;
        i=i+1;
    end

    RSB = RSB_tot(idx);
    sigma = sqrt(1/(210^(RSB/10)));
    bruit = zeros(1,length(Xmod));
    for i = 1:length(Xmod)
        bruit(i) = sigmarandn;
    end
    Y = Xmod + bruit;

    Xdmod = zeros(1,2*length(Y));
    idx2 = 1;
    for i = 1:length(Y)
        if Y(i) <= -2
            Xdmod(idx2)   = 0;
            Xdmod(idx2+1) = 0;
        elseif Y(i) <= 0
            Xdmod(idx2)   = 0;
            Xdmod(idx2+1) = 1;
        elseif Y(i) <= 2
            Xdmod(idx2)   = 1;
            Xdmod(idx2+1) = 0;
        else
            Xdmod(idx2)   = 1;
            Xdmod(idx2+1) = 1;
        end
        idx2 = idx2 + 2;
    end

    Xdecod = [];
    index2 = 1;
    ERR = 0;
    while index2+k <= length(Xcod) && index2+k <= length(Xdmod)
        if Xdmod(index2+k) ~= Xcod(index2+k)
            ERR = ERR + 1;
        end
        Xdecod = [Xdecod, Xdmod(index2:index2+k-1)];
        index2 = index2 + k+1;
    end

    TEF_tot(idx) = ERR / (length(Xdecod)/k);

    nbr_bit_faux = 0;
    for i = 1:length(Xdecod)
        if Xdecod(i) ~= X(i)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end
    TEB_tot(idx) = nbr_bit_faux / length(Xdecod);
end

semilogy(RSB_tot, TEB_tot); 
hold on;
semilogy(RSB_tot, TEF_tot);

codageASK8.m

clear; 
clc;
N = 70000;

RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));
TEF_tot = zeros(1,length(RSB_tot));
k=7;

for idx = 1:length(RSB_tot)

    X = randn(1,N);

    for i = 1:length(X)
        if X(i) > 0
            X(i) = 1;
        else
            X(i) = 0;
        end
    end

    index = 1; 
    Xcod = [];

    while index <= length(X)-k-1
        c = sum(X(index:index+k-1));
        if mod(c,2) == 0
            Xcod = [Xcod, X(index:index+k-1), 0];
        else
            Xcod = [Xcod, X(index:index+k-1), 1];
        end
        index = index + k;
    end

    index = 1; 
    Xmod = [];
    i = 1;

    while index < length(Xcod)

        if Xcod(index)==0 && Xcod(index+1)==0 && Xcod(index+2)==0
            Xmod(i) = -7;
        elseif Xcod(index)==0 && Xcod(index+1)==0 && Xcod(index+2)==1
            Xmod(i) = -5;
        elseif Xcod(index)==0 && Xcod(index+1)==1 && Xcod(index+2)==0
            Xmod(i) = -3;
        elseif Xcod(index)==0 && Xcod(index+1)==1 && Xcod(index+2)==1
            Xmod(i) = -1;
        elseif Xcod(index)==1 && Xcod(index+1)==0 && Xcod(index+2)==0
            Xmod(i) = 1;
        elseif Xcod(index)==1 && Xcod(index+1)==0 && Xcod(index+2)==1
            Xmod(i) = 3;
        elseif Xcod(index)==1 && Xcod(index+1)==1 && Xcod(index+2)==0
            Xmod(i) = 5;
        else
            Xmod(i) = 7;
        end

        index = index + 3;
        i = i + 1;
    end

    RSB = RSB_tot(idx);
    sigma = sqrt(1/2)*(10^(RSB/10));

    bruit = sigma*randn(1,length(Xmod));
    Y = Xmod + bruit;

    Xdmod = zeros(1,3*length(Y));
    idx2 = 1;

    for i = 1:length(Y)

        if Y(i) < -6
            Xdmod(idx2) = 0;
            Xdmod(idx2+1) = 0;
            Xdmod(idx2+2) = 0;

        elseif Y(i) < -4
            Xdmod(idx2) = 0;
            Xdmod(idx2+1) = 0;
            Xdmod(idx2+2) = 1;

        elseif Y(i) < -2
            Xdmod(idx2) = 0;
            Xdmod(idx2+1) = 1;
            Xdmod(idx2+2) = 0;

        elseif Y(i) < 0
            Xdmod(idx2) = 0;
            Xdmod(idx2+1) = 1;
            Xdmod(idx2+2) = 1;

        elseif Y(i) < 2
            Xdmod(idx2) = 1;
            Xdmod(idx2+1) = 0;
            Xdmod(idx2+2) = 0;

        elseif Y(i) < 4
            Xdmod(idx2) = 1;
            Xdmod(idx2+1) = 0;
            Xdmod(idx2+2) = 1;

        elseif Y(i) < 6
            Xdmod(idx2) = 1;
            Xdmod(idx2+1) = 1;
            Xdmod(idx2+2) = 0;

        else
            Xdmod(idx2) = 1;
            Xdmod(idx2+1) = 1;
            Xdmod(idx2+2) = 1;
        end

        idx2 = idx2 + 3;
    end

    index2 = 1;

    ERR_bit = 0;
    ERR_frame = 0;
    nb_blocs = 0;

    while index2+k <= length(Xcod) && index2+k <= length(Xdmod)

        bloc_tx = Xcod(index2:index2+k-1);
        bloc_rx = Xdmod(index2:index2+k-1);

        for j = 1:k
            if bloc_tx(j) ~= bloc_rx(j)
                ERR_bit = ERR_bit + 1;
            end
        end

        for j = 1:k
            if bloc_tx(j) ~= bloc_rx(j)
                ERR_frame = ERR_frame + 1;
                break;
            end
        end

        index2 = index2 + k + 1;
        nb_blocs = nb_blocs + 1;
    end

    L = min(length(X), length(Xdmod));

    TEB_tot(idx) = ERR_bit / L;
    TEF_tot(idx) = ERR_frame / nb_blocs;

end

semilogy(RSB_tot, TEB_tot); 
hold on;
semilogy(RSB_tot, TEF_tot);

codeDerepetitionASK2.m

clc;
clear;
N=10;
RSB=10;
X=randn(1,N);
code=zeros(1,30);
for i=1:length(X)
    if X(i) > 0 
        X(i)=1;
    else
        X(i)=0;
    end
end
index=1;
i=1;
while index < 3*N
    code(index)=X(i);
    code(index+1)=X(i);
    code(index+2)=X(i);
    index=index+3;
    i=i+1;
end
Xmod=zeros(1,length(code))
for index=1:length(code)
    if code(i)==1
        Xmod(i)=1;
    else
        Xmod(i)=0;
    end
end

constellationASK4.m

clear; clc;
N=20;
X=randn(1,N);
for i=1:length(X)
    if X(i)>0
        X(i)=1;
    else
        X(i)=0;
    end
end

index=1; 
i=1;
while index<length(X)
    if X(index)==0 && X(index+1)==0
        Xmod(i)=-3;
    elseif X(index)==0 && X(index+1)==1
        Xmod(i)=-1;
    elseif X(index)==1 && X(index+1)==0
        Xmod(i)=1;
    else
        Xmod(i)=3;
    end
    index=index+2;
    i=i+1;
end

plot(real(Xmod),imag(Xmod),'yo')

constellationASK8.m


clear; 
clc;
N=100;
X=randn(1,N);
for i=1:length(X)
    if X(i)>0
        X(i)=1;
    else
        X(i)=0;
    end
end
index=1; 
i=1;
while index+2 <= length(X)
    if X(index)==0 && X(index+1)==0 && X(index+2)==0
        Xmod(i)=-7;
    elseif X(index)==0 && X(index+1)==0 && X(index+2)==1
        Xmod(i)=-5;
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==0
        Xmod(i)=-3;
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==1
        Xmod(i)=-1;
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==0
        Xmod(i)=1;
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==1
        Xmod(i)=3;
    elseif X(index)==1 && X(index+1)==1 && X(index+2)==0
        Xmod(i)=5;
    else
        Xmod(i)=7;
    end
    index=index+3;
    i=i+1;
end
plot(real(Xmod),imag(Xmod),'yo')

cossin.m

clear
clc

t = -5:0.01:5;
cosinu=cos(t);
sinus=sin(t);

plot(t,cosinu)
hold on
plot(t,sinus)
xlim([-5 5])
ylim([-2 2])

fsk2.m


clear;
clc;
N = 5;
f0 = 1;
Deltaf = 10;
t=0:0.01:1;



X = randn(1,N);
for i = 1:length(X)
    if X(i) > 0
        X(i) = 1;
    else
        X(i) = 0;
    end
end


X_fin=[];
for i = 1:length(X)
    if X(i) == 0
        Xmod = cos(2pi(f0 - Deltaf/2)t);
    else
        Xmod = cos(2pi(f0 + Deltaf/2)t); 
    end
    X_fin=[X_fin , Xmod];

end
plot(X_fin)

fsk4.m


clc;
N = 10;
f0 = 1;
Deltaf = 10;
t=0:0.01:1;



X = randn(1,N);
for i = 1:length(X)
    if X(i) > 0
        X(i) = 1;
    else
        X(i) = 0;
    end
end

X_fin=[];
index=1;
while index<length(X)
    if X(index)==0 && X(index+1)==0
        Xmod=cos(2pi(f0 -3Deltaf/2)t);
    elseif X(index)==0 && X(index+1)==1
        Xmod=cos(2pi(f0 -1Deltaf/2)t);
    elseif X(index)==1 && X(index+1)==0
        Xmod=cos(2pi(f0 +1Deltaf/2)t);
    else
        Xmod=cos(2pi(f0 +3Deltaf/2)t);
    end
    X_fin=[X_fin , Xmod];
    index=index+2;

fsk8.m

clear;
clc;
N = 12;
f0 = 1;
Deltaf = 10;
t=0:0.01:1;



X = randn(1,N);
for i = 1:length(X)
    if X(i) > 0
        X(i) = 1;
    else
        X(i) = 0;
    end
end


X_fin=[];
index=1;
while index<length(X)
    if X(index)==0 && X(index+1)==0 && X(index+2)==0
        Xmod=cos(2pi(f0 -7Deltaf/2)t);
    elseif X(index)==0 && X(index+1)==0 && X(index+2)==1
        Xmod=cos(2pi(f0 -5Deltaf/2)t);
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==0
        Xmod=cos(2pi(f0 -3Deltaf/2)t);
    elseif X(index)==0 && X(index+1)==1 && X(index+2)==1
        Xmod=cos(2pi(f0 -1Deltaf/2)t);
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==0
        Xmod=cos(2pi(f0 +1Deltaf/2)t);
    elseif X(index)==1 && X(index+1)==0 && X(index+2)==1
        Xmod=cos(2pi(f0 +3Deltaf/2)t);
    elseif X(index)==1 && X(index+1)==1 && X(index+2)==0
        Xmod=cos(2pi(f0 +5Deltaf/2)t);
    else
        Xmod=cos(2pi(f0 +7Deltaf/2)t);
    end
    X_fin=[X_fin , Xmod];
    index=index+3;

end
plot(X_fin)

port.m

clear
clc

t = -5:0.01:5;
porte = (t >= -1) & (t <= 1);

plot(t,porte)
xlim([-5 5])
ylim([0 2])

psk8.m


N = 100000;
RSB_tot = 0:2:20;
TEB_tot = zeros(1,length(RSB_tot));

for k = 1:length(RSB_tot)
    X = randn(1,N);
    for i=1:length(X)
        if X(i)>0
            X(i)=1;
        else
            X(i)=0;
        end
    end

    index=1; 
    i=1;
    while index<length(X)
        if X(index)==1 && X(index+1)==1 && X(index+2)==1
            Xmod(i)=exp(1j*15/8pi);
        elseif X(index)==1 && X(index+1)==1 && X(index+2)==0
            Xmod(i)=exp(1j13/8pi);
        elseif X(index)==1 && X(index+1)==0 && X(index+2)==1
            Xmod(i)=exp(1j11/8pi);
        elseif X(index)==1 && X(index+1)==0 && X(index+2)==0
            Xmod(i)=exp(1j9/8pi);
        elseif X(index)==0 && X(index+1)==1 && X(index+2)==1
            Xmod(i)=exp(1j7/8pi);
        elseif X(index)==0 && X(index+1)==1 && X(index+2)==0
            Xmod(i)=exp(1j5/8pi);
        elseif X(index)==0 && X(index+1)==0 && X(index+2)==1
            Xmod(i)=exp(1j3/8pi);
        else
            Xmod(i)=exp(1j1/8pi);
        end
        index=index+3; 
        i=i+1;
    end

    RSB = RSB_tot(k);
    sigma = 1/sqrt(2) * 10^(-RSB/20);
    bruit = sigma(randn(1,length(Xmod)) + 1jrandn(1,length(Xmod)));
    Y = Xmod + bruit;

    Xdmod = zeros(1,3*length(Xmod));
    index=1;
    for i = 1:length(Y)

        xr = real(Y(i));
        yi = imag(Y(i));

        if yi>=0 && xr>=0 && yi<xr
            Xdmod(index)=0;
            Xdmod(index+1)=0;
            Xdmod(index+2)=0;

        elseif yi>=0 && xr>=0 && yi>=xr
            Xdmod(index)=0;
            Xdmod(index+1)=0;
            Xdmod(index+2)=1;

        elseif yi>=0 && xr<0 && yi>=-xr
            Xdmod(index)=0;
            Xdmod(index+1)=1;
            Xdmod(index+2)=0;

        elseif yi>=0 && xr<0 && yi<-xr
            Xdmod(index)=0;
            Xdmod(index+1)=1;
            Xdmod(index+2)=1;

        elseif yi<0 && xr<0 && -yi<-xr
            Xdmod(index)=1;
            Xdmod(index+1)=0;
            Xdmod(index+2)=0;

        elseif yi<0 && xr<0 && -yi>=-xr
            Xdmod(index)=1;
            Xdmod(index+1)=0;
            Xdmod(index+2)=1;

        elseif yi<0 && xr>=0 && -yi>=xr
            Xdmod(index)=1;
            Xdmod(index+1)=1;
            Xdmod(index+2)=0;

        else
            Xdmod(index)=1;
            Xdmod(index+1)=1;
            Xdmod(index+2)=1;

        end

        index=index+3;
    end

    nbr_bit_faux = 0;
    for j = 1:length(Xdmod)
        if Xdmod(j) ~= X(j)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end
    TEB = nbr_bit_faux / length(X);
    TEB_tot(k) = TEB;
end

semilogy(RSB_tot, TEB_tot)
Forwarded

psk4.m

Forwarded
clear; clc;
N = 100000;
RSB_tot = 0:2:16;
TEB_tot = zeros(1,length(RSB_tot));

for k = 1:length(RSB_tot)
    X = randn(1,N);
    for i=1:length(X)
        if X(i)>0
            X(i)=1;
        else
            X(i)=0;
        end
    end

    index=1; 
    i=1;
    while index<length(X)
        if X(index)==1 && X(index+1)==1
            Xmod(i)=exp(1j1/4pi);
        elseif X(index)==0 && X(index+1)==1
            Xmod(i)=exp(1j3/4pi);
        elseif X(index)==0 && X(index+1)==0
            Xmod(i)=exp(1j5/4pi);
        else
            Xmod(i)=exp(1j7/4pi);
        end
        index=index+2; 
        i=i+1;
    end

    RSB = RSB_tot(k);
    sigma = 1/sqrt(2) * 10^(-RSB/20);
    bruit = sigma(randn(1,length(Xmod)) + 1jrandn(1,length(Xmod)));
    Y = Xmod + bruit;

    Xdmod = zeros(1,2*length(Xmod));
    index=1;
    for i=1:length(Xmod)
        if real(Y(i))>0 && imag(Y(i))>0
            Xdmod(index)=1; 
            Xdmod(index+1)=1;
        elseif real(Y(i))>0 && imag(Y(i))<0
            Xdmod(index)=1; 
            Xdmod(index+1)=0;
        elseif real(Y(i))<0 && imag(Y(i))>0
            Xdmod(index)=0; 
            Xdmod(index+1)=1;
        else
            Xdmod(index)=0; 
            Xdmod(index+1)=0;
        end
        index=index+2;
    end

    nbr_bit_faux = 0;
    for j = 1:length(Xdmod)
        if Xdmod(j) ~= X(j)
            nbr_bit_faux = nbr_bit_faux + 1;
        end
    end
    TEB = nbr_bit_faux / length(X);
    TEB_tot(k) = TEB;
end

semilogy(RSB_tot, TEB_tot)

triangle.m

clear
clc

t = -5:0.01:5;
triangl = zeros(size(t));

for index = 1:length(t)
    if (t(index) >= -1) && (t(index) <= 0)
        triangl(index) = 1 + t(index);
    elseif (t(index) >= 0) && (t(index) <= 1)
        triangl(index) = 1 - t(index);
    else
        triangl(index) = 0;
    end
end

plot(t, triangl)
xlim([-5 5])
ylim([0 2])
