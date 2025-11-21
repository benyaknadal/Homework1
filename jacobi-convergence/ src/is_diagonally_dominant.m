function is_dominant = is_diagonally_dominant(A)
% IS_DIAGONALLY_DOMINANT checks if matrix A is strictly diagonally dominant
%
% Input:
%   A - square matrix (n x n)
%
% Output:
%   is_dominant - boolean (true if strictly diagonally dominant, false otherwise)
%
% A matrix is strictly diagonally dominant if:
%   |a_ii| > sum(|a_ij|) for all j != i, for all rows i

    % Check if matrix is square
    [m, n] = size(A);
    if m ~= n
        error('Matrix must be square');
    end
    
    % Initialize result as true
    is_dominant = true;
    
    % Check each row
    for i = 1:n
        % Diagonal element absolute value
        diag_element = abs(A(i, i));
        
        % Sum of absolute values of off-diagonal elements in row i
        row_sum = sum(abs(A(i, :))) - abs(A(i, i));
        
        % Check strict diagonal dominance condition
        if diag_element <= row_sum
            is_dominant = false;
            return;
        end
    end
end
