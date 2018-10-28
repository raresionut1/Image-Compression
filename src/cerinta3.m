% Constantin Rares 311CD

function [Ak S] = cerinta3(image, k)

%citirea primului frame din imaginea gif
img = double(imread(image));

A = img(:,:,1);

[m, n] = size(A);

%calculul mediei pentru fiecare linie
miu = zeros(m, 1);

for i = 1:m
    miu(i) = sum(A(i,:)) / n;
    %actualizarea liniilor
    A(i,:) = A(i,:) - miu(i);
end

%calculul matricei Z
Z = A' / sqrt(n-1);

%aplicarea algoritmului SVD
[U S V] = svd(Z);

%calculul spatiului k-dimensional al componentelor principale
W = V(: , 1:k);

%calculul proiectiei lui A in spatiul componentelor principale
Y = W'*A;

%aproximarea matricei initiale
Ak = W*Y + miu;

end