DOMAINS
nama,jender,pekerjaan,benda,alasan,zat = symbol
umur=integer

PREDICATES
nondeterm orang(nama, umur, jender, pekerjaan)
nondeterm selingkuh(nama, nama)
terbunuh_dengan(nama, benda)
terbunuh(nama)
nondeterm pembunuh(nama)
motif(alasan)
ternodai(nama, zat)
milik(nama, benda)
nondeterm cara_kerja_mirip(benda, benda)
nondeterm kemungkinan_milik(nama, benda)
nondeterm dicurigai(nama)
/* * * Fakta-fakta tentang pembunuhan * * */

CLAUSES
orang(budi,55,m,tukang_kayu).
orang(aldi,25,m,pemain_sepak_bola).
orang(aldi,25,m,tukang_jagal).
orang(joni,25,m,pencopet).

selingkuh(ina,joni).
selingkuh(ina,budi).
selingkuh(siti,joni).

terbunuh_dengan(siti,pentungan).
terbunuh(siti).

motif(uang).
motif(cemburu).
motif(dendam).

ternodai(budi, darah).
ternodai(siti, darah).
ternodai(aldi, lumpur).
ternodai(joni, coklat).
ternodai(ina, coklat).

milik(budi,kaki_palsu).
milik(joni,pistol).

/* * * Basis Pengetahuan * * */
cara_kerja_mirip(kaki_palsu, pentungan).
cara_kerja_mirip(balok, pentungan).
cara_kerja_mirip(gunting, pisau).
cara_kerja_mirip(sepatu_bola, pentungan).

kemungkinan_milik(X,sepatu_bola):-
orang(X,_,_,pemain_sepak_bola).

kemungkinan_milik(X,gunting):-
orang(X,_,_,pekerja_salon).
kemungkinan_milik(X,Benda):-
milik(X,Benda).

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai semua orang yang memiliki senjata yang *
* kerjanya mirip dengan senjata penyebab siti terbunuh. *
* * * * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
terbunuh_dengan(siti,Senjata) ,
cara_kerja_mirip(Benda,Senjata) ,
kemungkinan_milik(X,Benda).
/* * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai laki-laki yang selingkuh dengan siti. *
* * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,m,_),
selingkuh(siti,X).
/* * * * * * * * * * * * * * * * * * * * * * *
* dicurigai perempuan yang selingkuh dengan *
* laki-laki yang juga selingkuh dengan siti *
* * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(cemburu),
orang(X,_,f,_),
selingkuh(X,Lakilaki),
selingkuh(siti,Lakilaki).
/* * * * * * * * * * * * * * * * * * * * * * * * * * *
* dicurigai pencopet yang mempunyai motif uang. *
* * * * * * * * * * * * * * * * * * * * * * * * * * */
dicurigai(X):-
motif(uang),
orang(X,_,_,pencopet).

pembunuh(Pembunuh):-
orang(Pembunuh,_,_,_),
terbunuh(Terbunuh),
Terbunuh <> Pembunuh, /* Bukan bunuh diri */
dicurigai(Pembunuh),
ternodai(Pembunuh,Zat),
ternodai(Terbunuh,Zat).

GOAL
pembunuh(X).

%Pertama kali visual prolog akan mencari fakta yang cocok dengan goal
%maka ditemukanlah fakta yang cocok yaitu pembunuh(Pembunuh)
%kemidian mengunifikasi argumennya, maka unifikasi terjadi antara X dan Pembunuh, sehingga X=Pembunuh
%prolog akan melanjutkan pengujian pada body dari rule, maka dipanggil sub goal yang pertama yaitu orang(Pembunuh,_,_,_)
%kemudian prolog akan mencar kecocokan dari subgoal tersebut mulai dari atas program hingga bagian bawah program
%yang pertama ditemukan adalah orang(budi,55,m,tukang_kayu), kemudian prolog memanggil fakta terbunuh yaitu siti
%selanjutnya prolog akan mencari fakta dicurigai(X)
%setelah itu akan mencari syarat terbunuhnya siti yaitu terbunuh_dengan(siti,senjata) kemuian prolog akan memanggil fakta terbunuh_dengan untu mengetahui senjata yang dipakai
%fakta ditemukan yaitu terbunuh_dengan(siti_pentungan kemudian prolog akan mencari fakta dari benda yang cara kerjanya yang hampir sama yaitu cara_kerja_mirip(Benda,Senjata)),
%kemudian prolog akan memanggil cara_kerja_mirip untuk mengetahui benda apa yang cara kerjannya mirip pentungan
%sehingga mendapatkan fakta cara_lerja_mirip(kaki_palsu,pentungan), kemudian prolog akan mencari fakta dari kemungkinan_milik(X,Benda) dan ditemukan sebuah pernyataan milik(X,Benda)
%pencarian selanjutnya adalah sipa pemilik kaki_palsu sehingga ditemukan milik(budi,kaki_palsu)
%kemudian prolog akan memeriksa fakta dari pembunuh karena terdapat fakta yang belum diperiksa yaitu ternodai(Pembunuh,Zat)
%prolog akan memeriksa zat apa yang menodai budi, yaitu ternodai(budi,darah)
%dan ditemukan fakta yang sama bahwa siti juga mempunyai noda yang sama
%dari pencarian dan fakta yang telah dikumpulkan, maka prolog menemukan bahwa yang membunuh siti adalah budi