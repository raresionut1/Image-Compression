% Constantin Rares 311CD

function [Ak S] = cerinta4(image, k)

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

%calculul matricei de covarianta Z
Z = A * (A'/(n-1));

%calculul valorilor si vectorilor proprii pentru matricea Z
[V S] = eig(Z);

%calculul spatiului k-dimensional al componentelor principale
W = V(: , 1:k);

%calculul proiectiei lui A in spatiul componentelor principale
Y = W'*A;

%aproximarea matricei initiale
Ak = W*Y + miu;

end