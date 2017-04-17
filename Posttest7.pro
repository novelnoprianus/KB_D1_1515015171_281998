DOMAINS 
     nama_matkul, nama_mhs = symbol   
     nilai = string 
     list = nilai*  % (*) sebuah list

PREDICATES
        nondeterm mata_kuliah(nama_matkul, nama_mhs, nilai)
        nondeterm lulus(nama_matkul, nama_mhs)
        nondeterm tidak_lulus(nama_matkul, nama_mhs)

CLAUSES
     mata_kuliah("Intelegensi Buatan", "Supardi", "A").  % Supardi mengambil matakuliah Intelegensi Buatan dengan nilai A
     mata_kuliah("Intelegensi Buatan", "Surdi", "B").    %
     mata_kuliah("Intelegensi Buatan", "Suyatmi", "C").  %
     mata_kuliah("Intelegensi Buatan", "Suparni", "D").  %
     mata_kuliah("Intelegensi Buatan", "Sujiman", "C").  %

     mata_kuliah("PDE", "Suharto","B").   % Suharto mengambil matakuliah PDE dengan nilai B 
     mata_kuliah("PDE", "Sudirman","C").  %
     mata_kuliah("PDE", "Supardi","C").   %
     mata_kuliah("PDE", "Suyatmi","B").   %
     mata_kuliah("PDE", "Sutini","D").    %

     mata_kuliah("Sistem Operasi", "Suharto", "B").  % Suharto mengambil matakuliah Sistem Operai dengan nilai B 
     mata_kuliah("Sistem Operasi", "Sutini", "A").   %
     mata_kuliah("Sistem Operasi", "Supardi", "A").  %
     mata_kuliah("Sistem Operasi", "Suparni", "B").  %
     mata_kuliah("Sistem Operasi", "Suripah", "C").  %

lulus(X,Y):- % mahasiswa lulus jika
     mata_kuliah(X,Y,"A");  % Nilai matakuliah = A,B,C
     mata_kuliah(X,Y,"B");  %
     mata_kuliah(X,Y,"C").  %

tidak_lulus(X,Y):- % mahasiswa tidak lulus jika
           mata_kuliah(X,Y,"D"); % Nilai matakuliah yang diambil = D dan E
           mata_kuliah(X,Y,"E"). %

GOAL 
     %mata_kuliah(Nama_MK, "Supardi" ,Nilai). % 1. Nilai-nilai yang dimiliki oleh Supardi beserta mata kuliahnya
     %mata_kuliah(_, "Suripah" ,_).           % 2. Untuk mengecek apakah Suripah mengikuti perkuliahan pada semester tersebut
     %jumlah_elemen([1,2,3],L,0).             % 3. Mahasiswa yang tidak lulus (nilai < C) pada semester tersebut beserta mata kuliahnya
     
     