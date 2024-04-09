function C_decode = hamming_decode(R,G)

SE = {[0 0 0],[0 0 0 0 0 0 0];...
      [0 0 1],[0 0 0 0 0 0 1];...
      [0 1 0],[0 0 0 0 0 1 0];...
      [1 0 0],[0 0 0 0 1 0 0];...
      [1 1 0],[0 0 0 1 0 0 0];...
      [1 1 1],[0 0 1 0 0 0 0];...
      [0 1 1],[0 1 0 0 0 0 0];...
      [1 0 1],[1 0 0 0 0 0 0]};

[k,n] = size(G);
H = [G(:,k+1:n).',eye(3)];
S = R*(H.');
S = mod(S,2);
[S_row,~] = size(S);
C_decode = zeros(S_row,n);
[SE_row,~] = size(SE);

for m=1:S_row
    for n=1:SE_row
        if all(S(m,:) == cell2mat(SE(n,1)))
            C_decode(m,:) = R(m,:)+cell2mat(SE(n,2));
            C_decode(m,:) = mod(C_decode(m,:),2);
        end
    end
end

C_decode = C_decode(:,1:k);

end