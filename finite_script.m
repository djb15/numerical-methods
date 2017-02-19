h = 0.005;
k = 0.005;
N = round(1/h);

U = zeros(N+1);

divs = 0:h:1;
y0 = (sawtooth(2*pi*divs,0.5)+1)/2;


U(1,1:N+1) = y0;
%At x=0 and x=N (i.e. the start and end of the rod) the value is 0 for all
%m.  This corresponds to the first and last column of the matrix being 0.
v = k/h^2;
b = 1-2*v;


for m=2:7
    for j=2:N
        U(m,j) = v*U(m-1,j-1) + b*U(m-1,j) + v*U(m-1, j+1);
    end
end
