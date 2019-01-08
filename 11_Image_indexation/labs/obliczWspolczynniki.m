%% Tomasz Kryjak
% Laboratorium Biocybernetyki
% Obliczanie wspolczynnikow ksztaltu - dla obrazu poindeksowanego

% Wejscie
% - obraz - poindeksowany obraz
% Wyjscie
% - wspolczyniki - dla kazdego obiektu  seria wspolczynnikow - kolejne
% kolumny : - Compacntess, Rmin/Rmax/ Blair-Bliss, Haralick, M7


function [ wspolczynniki ] = obliczWspolczynniki( obraz )

    %% Ile obiektow na obrazie ...
    % Zalozenie o dobrej indeksacji
    ileObiektow = max(obraz(:));

    % Wyznacznie parametrow z obiektu
    res = regionprops(obraz,'Area','BoundingBox','Image');

    % Macierz na wspolczynniki
    wspolczynniki = zeros(ileObiektow,5);

    % Kontenery na wspolczynniki
    Compactness = zeros(ileObiektow,1);
    rMinrMax = zeros(ileObiektow,1);
    BlairBliss = zeros(ileObiektow,1);
    Haralick = zeros(ileObiektow,1);
    M7 = zeros(ileObiektow,1);


    for i=1:ileObiektow
        %% Wyznaczanie wspolczynnika compactness 
        S = res(i).Area;
        bb = res(i).BoundingBox;

        Compactness(i) = S / ((bb(3)*bb(4)));

        %% Wyznaczanie wspolczynnika rmin / rmax


        obiekt = res(i).Image;
        srodekCiezkosci = regionprops(obiekt,'Centroid');
        srodekCiezkosci=srodekCiezkosci.Centroid;

        kontur = bwperim(obiekt,8);

        ilePikseliNaKonturze = sum(kontur(:));

        odlOdSrodkaCiezkosci = zeros(ilePikseliNaKonturze,1);

        % Licznik po pikseleach konturu (odresowanie tablicy odleglosci)
        liczKontur=1;

        %% Do BB
        sumaOdlegosciOdSrCiezkosci = 0;
        mianownikaHaralicka = 0;
        [X Y] = size(kontur);

        %% Do M7
        m00 = S;
        M02 = 0;
        M20 = 0;
        M11 = 0;

        %% Iteracja po obrazku
        for xx=1:X
            for yy=1:Y

                %% Dotyczy Rmin/Rmax
                if (kontur(xx,yy) == 1 )
                   odlOdSrodkaCiezkosci(liczKontur) =  sqrt( (xx-srodekCiezkosci(1)) ^2 + (yy-srodekCiezkosci(2)) ^2 );
                   % Haralick
                   mianownikaHaralicka = mianownikaHaralicka + odlOdSrodkaCiezkosci(liczKontur)^2;
                   liczKontur = liczKontur +1;
                end


                %% Dotyczy Blaira-Bilissa
                if (obiekt(xx,yy) == 1 )
                    sumaOdlegosciOdSrCiezkosci = sumaOdlegosciOdSrCiezkosci + sqrt( (xx-srodekCiezkosci(1)) ^2 + (yy-srodekCiezkosci(2)) ^2 );

                end

                %% Dotyczy M7

                % M02 M20 i M11
                if (obiekt(xx,yy) == 1 )
                   M02 = M02 + (yy - srodekCiezkosci(2))^2;
                   M20 = M20 + (xx - srodekCiezkosci(1))^2;
                   M11 = M11 + (xx - srodekCiezkosci(1))*(yy - srodekCiezkosci(2));

                end


            end
        end

        Rmin = min(odlOdSrodkaCiezkosci);
        Rmax = max(odlOdSrodkaCiezkosci);

        rMinrMax(i) = sqrt(Rmin/Rmax);

        %% Blair - Bliss

        BlairBliss(i) = S / sqrt(2*pi*sumaOdlegosciOdSrCiezkosci);

        %% Haralick

        % Licznik
        licznikH = sum(odlOdSrodkaCiezkosci)^2;
        % Mianownik
        mianownikH = ilePikseliNaKonturze * mianownikaHaralicka -1;

        Haralick(i) = sqrt(licznikH/mianownikH);

        %% M7
        % Normalizacja
        N02 = M02 / m00^2;
        N20 = M20 / m00^2;
        N11 = M11 / m00^2;

        M7(i) = N20*N02 - N11^2;

        % Przypisanie wspolczynnikow...
        wspolczynniki(i,1) = Compactness(i);
        wspolczynniki(i,2) = rMinrMax(i);
        wspolczynniki(i,3) = BlairBliss(i);
        wspolczynniki(i,4) = Haralick(i);
        wspolczynniki(i,5) = M7(i);

    end




end

