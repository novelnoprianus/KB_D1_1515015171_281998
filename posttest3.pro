domains
  nama,matakuliah = symbol
  kelas        = unsigned

predicates
  matkul(nama,kelas) - nondeterm (i,o)
  dosen_matkul(matakuliah,nama) - nondeterm (o,o)
  matkul_nilai(nama) - nondeterm (o)
  menyukai(symbol,symbol) - nondeterm (i,o)
  favorit(symbol,symbol) - nondeterm (i,i)
  matkul_fav(symbol) - nondeterm (o)

clauses
  dosen_matkul(angel,"Kecerdasan Buatan").
  dosen_matkul(hario,"Framework").
  dosen_matkul(edi,"Visual").
   
  matkul("Kecerdasan Buatan",80).
  matkul("Framework",70).
  matkul("Visual",90).

  matkul_nilai(Nama):-
	dosen_matkul(_,Nama),
	matkul(Nama,Nilai),
	Nilai > 70.
	
 menyukai(novel,X):-
	matkul_fav(X),
	favorit(X,mudah).
 favorit(visual,mudah).
 favorit(ai,susah).

 matkul_fav(framework).
 matkul_fav(visual).


goal
  matkul_nilai(MataKuliah),
  menyukai(novel,Favorit).