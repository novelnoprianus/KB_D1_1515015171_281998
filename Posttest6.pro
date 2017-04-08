DOMAINS
pohonchar = pohon(char, pohonchar, pohonchar); akhir

PREDICATES
nondeterm lakukan(pohonchar)
kerjakan(char, pohonchar, pohonchar)
buat_pohon(pohonchar, pohonchar)
sisip(char, pohonchar, pohonchar)
cetak_pohon(pohonchar)
nondeterm ulang

CLAUSES
lakukan(Pohon):- %lakukan(Pohon) akan dijalankan jika
ulang,nl,%menjalankan ulang untuk baris selanjutnya yaitu menampilkan write sebagai output secara berulang sebalum diakhiri

write("*******************************************************"),nl,%menampilkan output opsi ke layar
write("Ketik 1 meng-update pohon\n"),				    %
write("Ketik 2 mencetak pohon\n"),				    %
write("Ketik 7 keluar\n"),					    %
write("*******************************************************"),nl,%
write("Masukkan angka - "),					    %

readchar(X),nl, %menginputkan data pada layar setelah menampilkan output pada layar
kerjakan(X, Pohon, PohonBaru), %variabel X akan menampung nilai yang sudah diinputkan dan PohonBaru akan dijalankan dan melanjukan ke aturan kerjakan
lakukan(PohonBaru). %maka PohonBaru akan di buat
kerjakan('1',Pohon,PohonBaru):- % ketika menginputkan 1 akan membuat pohon baru jika
write("Ketik karakter # untuk mengakhiri: "), %menampilkan write untuk mengakhiri ketikan # dan selanjutnya
buat_pohon(Pohon, PohonBaru). %pembuatan pohon baru

kerjakan('2',Pohon,Pohon):- %ketika menginputkan 2 maka akan menjalankan aturan kerjakan pohon jika
cetak_pohon(Pohon), %pohon akan dicetak atau ditampikan sebagai output
write("\nTekan sembarang tombol"), %menampikan output 
readchar(_),nl. %ketika sembarang tombol ditekan akan keluar dari pohon
kerjakan('7', _, akhir):- %ketika menginputkan angka 7 maka proram akan berakhir
exit. %berhenti menjalankan program atau keluar dari program

buat_pohon(Pohon, PohonBaru):- %buat pohon baru jika
readchar(C), % akan membaca karaker C
C<>'#',!, %C akan menampung # dan cut untuk mengakhiri parulangan
write(C, " "), %menampilkan output C
sisip(C, Pohon, PohonTemp), %C akan digunakan untuk sisip pohon
buat_pohon(PohonTemp, PohonBaru).
buat_pohon(Pohon, Pohon). %pohon akan dibuat
sisip(Baru,akhir,pohon(Baru,akhir,akhir)):-!. %mengakhiri program dengan cut supaya tidak berlanjut
sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,KiriBaru,Kanan)):- %membuat sisip baru ke pohon kiri kanan dan kiribaru kanan jika
Baru<Elemen,!, %baru kurang dari elemen yang disisipkan maka akan berakhir
sisip(Baru,Kiri,KiriBaru). %membuat sisip baru kanan dan kananbaru
sisip(Baru,pohon(Elemen,Kiri,Kanan),pohon(Elemen,Kiri,KananBaru)):- %membuat sisip baru ke pohon kiri kanan dan pohon kiri kananbaru jika
sisip(Baru,Kanan,KananBaru). %membuat sisip baru dan kanan kananbaru
cetak_pohon(akhir). %maka cetak pohon akan berakhir
cetak_pohon(pohon(Item,Kiri,Kanan)):- 
cetak_pohon(Kiri),
write(Item, " "),
cetak_pohon(Kanan).
ulang. %mengakhiri perulangan ulang supaya tidak mengulang menampilkan output
ulang:-ulang. %mengulangi perintah untuk mengakhiri ulang
GOAL
write("********** Sortir Pohon Karakter ************"),nl,
lakukan(akhir).