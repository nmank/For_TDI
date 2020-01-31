%LGB Clustering implemented 'from scratch'
%The inputs to this function are the url address to the image (url_address) 
%and the number of colors (m). 
%This script outputs the given image in the desired number of colors
%following the LGB algorithm.


%Nate Mankovich
%1/30/2020

function Vis = LGBClustering(url_address,m)

%read the data
data = imread(url_address);
[nn,kk,N] = size(data);

%number of data points
p = nn*kk;

%unroll the data
X1 = reshape(data,[p,3]);
X = double(X1');

%initialize centers (randomize)
for i=1:m
    ind = floor(p*rand);
    C(:,i) = X(:,ind);
end

%initialize error
%some book keeping
ii=2
Error(1) = 1
Error(2) = 2

%repeat until the change in successive E(ii) is small
while Error(ii) - Error(ii-1) > .00001
    ii = ii+1;
    
    %compute S_i
    
    %find a distance matrix
    for i=1:m
        for n=1:p
            dist(i,n) = norm(minus(X(:,n),C(:,i)));
        end
    end
    
    %calculate the minimum distance
    [M,index] = min(dist);
    
    %find the winning indices
    for i=1:m
        for j=1:p
            comp(i,j) = isequal(i,index(j));
        end
    end
    
    %Si is X(:,find(comp(i,:)));
    
    
    %update centers and calculate i for each S
    %ci = (1/abs(si))sum(x in Si of x)
    for i=1:m
        S = X(:,find(comp(i,:)));
        C(:,i) = (1/length(S(1,:)))*(sum(S,2));
    end    
    
    %error calculation
    E = (1/p)*sum(M.*M);
    Error(ii) = E;
    
    
end

%visualize the result
for i=1:m
    k= find(comp(i,:));
    for j=1:N
        VisRaw(j,k) = C(j,i);
    end
end
Vis = uint8(reshape(VisRaw',[nn,kk,N]));

end

