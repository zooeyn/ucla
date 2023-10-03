% Zooey Nguyen
% I implemented the algorithm from https://www.wikiwand.com/en/Cholesky_decomposition#/The_Cholesky_algorithm.

function L = cholesky(A, N)
% A is a matrix that MUST be symmetric positive definite

L = zeros(N,N); % create blank, NxN matrix of zeros

for j = 1:N
	L(j,j) = sqrt(A(j,j) - sumsqr(L(j,1:(j-1))));
	for i = (j+1):N
		L(i,j) = (A(i,j) - sum(L(i,1:(j-1)) .* L(j,1:(j-1)))) / L(j,j);
	end
end