% Constantin Rares 311CD

function cerinta2()

%graficele pentru primele 2 imagini
for nr_img = 1:2

figure(nr_img);

% 2.1

%calea catre imaginea curenta
nume = ['in\images\image' num2str( nr_img ) '.gif'];

%citirea primului frame din imaginea gif
img = double(imread(nume));

A = img(:,:,1);

[m, n] = size(A);

%aplicarea algoritmului SVD
[U S V] = svd(A);

%valorile singulare
x = diag(S);

%primul grafic
subplot(2,2,1);
plot(x)
title('Valorile singulare ale matricei A')

% 2.2

%valorile alese pentru k
k = [1:19 20:20:99 100:30:min(m,n)];
l_k = length(k);

%calculul informatiei date de primele k valori singulare
info = zeros(0);

numitor = 0;

for i = 1:min(m,n);
    numitor = numitor + S(i,i);
end

for p = 1:l_k
    
    numarator = 0;

    for i = 1:k(p)
     numarator = numarator + S(i,i);
    end

    info = [info numarator/numitor];
end

%al doilea grafic
subplot(2,2,2);
plot(k, info);
title('Informatia data de valorile singulare')

% 2.3

%calculul erorii aproximarii pentru matricea A
err = zeros(l_k);

for p = 1:l_k
    
    A_k = cerinta1(nume, k(p));
    
    for i = 1:m
        for j = 1:n
            err(p) = err(p) + ( A(i,j) - A_k(i,j) )^2;
        end
    end
    
    err(p) = err(p) / (m*n);
    
end

%al treilea grafic
subplot(2,2,3);
plot(k, err);
title('Eroarea aproximarii')

% 2.4

%calculul ratei de compresie a datelor
rata_compresie = (k*m + k*n + k) / (m*n);

%al patrulea grafic
subplot(2,2,4);
plot(k, rata_compresie);
title('Rata de compresie a datelor')

%Comenzi pentru afisarea titlului mare
a = axes;
t1 = title( ['\color[rgb]{0 .5 .5}Cerinta [2]: "image' num2str( nr_img ) '.gif"'] );
set(a,'Visible','off');
set(t1,'Visible','on');
end

end