PREDICATES
nondeterm ib(symbol,symbol)
nondeterm pde(symbol,symbol)
nondeterm so(symbol,symbol)
nondeterm mhs(symbol,symbol)
nondeterm mengambil(symbol,symbol)
lulus(symbol)
tidaklulus(symbol)
matkul(symbol)

CLAUSES
lulus(A).
lulus(B). 
lulus(C). 
tidaklulus(D).
tidaklulus(E).

mhs(irfan,lulus).
mhs(komeng,tidaklulus).
mhs(dati,lulus).
mhs(fatima,lulus).
mhs(maspion,lulus).
mhs(ricky,tidaklulus).
mhs(embang,lulus).
mhs(salmin,tidaklulus).
mhs(vina,lulus).
mhs(sondang,lulus).
mhs(pamuji,tidaklulus).
mhs(luki,tidaklulus).
mhs(sadek,lulus).
mhs(yusida,lulus).
mhs(eka,lulus).

ib(irfan,lulus).
ib(komeng,tidaklulus).
ib(dati,lulus).
ib(fatima,lulus).
ib(maspion,lulus).

pde(ricky,tidaklulus).
pde(embang,lulus).
pde(salmin,tidaklulus).                                                        
pde(vina,lulus).
pde(sondang,lulus).

so(pamuji,tidaklulus).
so(luki,tidaklulus).
so(sadek,lulus).
so(yusida,lulus).
so(eka,lulus).

matkul(ib).
matkul(pde).
matkul(so).

mengambil(irfan,ib).
mengambil(komeng,ib).
mengambil(dati,ib).
mengambil(fatima,ib).
mengambil(maspion,ib).

mengambil(ricky,pde).
mengambil(embang,pde).
mengambil(salmin,pde).
mengambil(vina,pde).
mengambil(sondang,pde).

mengambil(pamuji,so).
mengambil(luki,so).
mengambil(sadek,so).
mengambil(yusida,so).
mengambil(eka,so).

goal
%a. Nama mahasiswa yang mengikuti matakuliah intelejensi buatan(ib)
%mengambil(Nama,ib).

%b. Nama mahasiswa yang tidak lulus
%ib(TidakLulus,tidaklulus);
%pde(TidakLulus,tidaklulus);
%so(TidakLulus,tidaklulus).

%c. Nama mahasiswa yang lulus
%ib(Lulus,lulus);
%pde(Lulus,lulus);
%so(Lulus,lulus).

%d. Seluruh nama matakuliah yang diajarkan
%matkul(MataKuliah).

%e. Seluruh nama mahasiswa yang ada
%mhs(Mhs,lulus);
%mhs(Mhs,tidaklulus).