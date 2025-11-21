function [B, rho] = jacobi_spectral_radius(A)
% JACOBI_SPECTRAL_RADIUS constructs Jacobi iteration matrix and computes spectral radius
%
% Input:
%   A - coefficient matrix (n x n)
%
% Output:
%   B - Jacobi iteration matrix B = D^(-1)(L + U)
%   rho - spectral radius of B (maximum absolute eigenvalue)
%
% The Jacobi method converges if and only if rho < 1

    % Check if matrix is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix must be square');
    end
    
    % Extract diagonal matrix D
    D = diag(diag(A));
    
    % Check if any diagonal element is zero
    if any(diag(D) == 0)
        error('Matrix has zero diagonal elements - Jacobi method cannot be applied');
    end
    
    % Extract lower and upper triangular parts (without diagonal)
    L = tril(A, -1);  % Lower triangular part (below diagonal)
    U = triu(A, 1);   % Upper triangular part (above diagonal)
    
    % Construct Jacobi iteration matrix: B = D^(-1)(L + U)
    % Note: D^(-1)(L + U) = D^(-1) * (A - D) = D^(-1)*A - I
    B = D \ (L + U);
    % Alternative: B = inv(D) * (L + U);
    
    % Compute eigenvalues of B
    eigenvalues = eig(B);
    
    % Compute spectral radius: rho(B) = max(|eigenvalues|)
    rho = max(abs(eigenvalues));
end
