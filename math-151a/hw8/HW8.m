N = 4;                  % size of matrix

A = rand(N) + 1.;       % create random NxN matrix, add one to all entries

A = tril(A);            % select lower triangular portion the matrix. 
                        % note: all diagonal entries are positive

A = A*A';               % create new matrix that is symmetric and positive definite



L = cholesky(A, N);        % call your function to get L such that 
                            % A = L L^T
L_matlab = chol(A,'lower'); % use Matlab's implementation to get L

diff = L - L_matlab         % test whether L and L_matlab agree; if 
                            % implemented correctly, this matrix should be
                            % all zeroes, up to round off errors. 
                            % Note: make sure there is no semi-colon to
                            % get Matlab to print it out to the console