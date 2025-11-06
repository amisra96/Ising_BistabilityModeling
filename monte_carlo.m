function  [x] = monte_carlo (x,iter,N,h,J,T)



% % % the following lines of code are needed to plot the matrix
% % fig = figure ;
% % imagesc ( x )
% % %colormap([1 0 0 ; 0 0 1])
% % colormap('gray')
% % xlim ( [ 1 N] )
% % ylim ( [ 1 N] )
% % hold on

% this is the actual computation with Metropolis algorithm

for n = 1:iter


    % Random lattice site, start with a randomly chosen lattice site.
    index = randi( N*N )  ;




    [i,j] = ind2sub([N N],index)  ; %this translate the random number index to a
    % triplet of index.


    % mod gives the report of the division between numerator and denominator
    % it's needed to take in account boundary condition

    dx = sub2ind([N N N],i,(mod(j,N)+1)) ;  % rigth nearest neigbour index.
    sx = sub2ind([N N N],i,mod(j-2,N)+1) ;  % left nearest neigbour index.
    up =sub2ind ([N N N ],mod(i-2,N)+1,j) ; % up nearest neigbour index.
    dn = sub2ind([N N N],mod(i,N)+1,j) ;    % down nearest neigbour index.


    % sum of the nearest neighbours
    neigh = x(sx)+x(dx)+x(up)+x(dn)  ;


    dE = 2*J*(x(index)*neigh) + 2*h*(x(index)) ;




    % Simple Metropolis algorithm

    prob = exp(-dE / T) ;

    if dE <=0 || rand() <= prob

        x(index) = -x(index) ;

    end


    % the if-statement is used to change the frequency used to plot the
    % matrix i.e in this case the plot is each f itarations

    f = 2000 ; % number of iteretion after which the plot is updated

%     if  sum(ismember([1:f:iter],n))
% 
% 
%         imagesc(x)
% 
% 
% 
% 
%         pause ( 0.00001)
%     end






end

end
