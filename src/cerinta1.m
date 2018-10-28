% Constantin Rares 311CD


function A_k = cerinta1 (image, k)

%citirea primului frame din imaginea gif
img = double(imread(image));

A = img(:,:,1);

[m, n] = size(A);

%aplicarea algoritmului SVD
[U S V] = svd(A);

%formarea matricei reduse
U_k = U(:, 1:k);
S_k = S(1:k, 1:k);
V_k = V(:, 1:k);

A_k = U_k * S_k * V_k';

%pentru a vedea imaginea comprimata, a se decomenta urmatoarea linie:
%imshow(uint8(A_k));

end