# engis-kitchen
Tugas Besar Daspro 2018 <br>

## Dekomposisi Fungsi
### uang.pas
#### tambahUang
```pascal
procedure tambahUang(var currentSimulasi : main.data; <jumlah_penambahan>);
```
#### kurangUang
```pascal
procedure kurangUang(var currentSimulasi : main.data; <jumlah_pengurangan>);
```
<br>

### energi.pas
#### tambahEnergi
```pascal
procedure tambahEnergi(var currentSimulasi: main.data; <jumlah_penambahan>);
```
#### kurangEnergi
```pascal
procedure kurangEnergi(var currentSimulasi: main.data; <jumlah_pengurangan>);
```
<br>

### inventori.pas
#### useInventori
```pascal
procedure useInventori(var currentSimulasi: main.data); 
```
<br>
Prosedur ini akan menggunakan ruang inventori untuk menyimpan bahan.
#### freeInventori
```pascal
procedure freeInventori(var currentSimulasi: main.data); 
```
<br>
Prosedur ini akan membebaskan/mengosongkan ruang inventori jika bahan kadaluarsa/terjual/sudah diolah menjadi resep dan dijual.
#### lihatInventori
```pascal
procedure lihatInventori(arrInvMentah: array of main.isi_inventori; arrInvOlahan: array of main.isi_inventori);
``` 
<br>
Prosedur ini akan membaca seluruh isi dari array bertipe isi_inventori dan menampilkannya menjadi detail bahan-bahan yang disimpan dalam inventori.
#### upgradeInventori
```pascal
procedure upgradeInventori(var currentSimulasi : main.data);
``` 
<br>
Prosedur ini akan membaca jumlah space inventori yang ingin dibeli oleh user dan mengurangi jumlah uang sesuai dengan space inventori yang dibeli.
<br>

### aksiChef.pas
#### makan
```pascal
procedure makan(var currentSimulasi: main.data; var <variabel_jumlah_makan_hari_ini>);
```
#### istirahat
```pascal
procedure istirahat(var currentSimulasi: main.data; var <variabel_jumlah_istirahat_hari_ini>);
```
#### tidur
```pascal
procedure istirahat(var currentSimulasi: main.data; var <variabel_counter_hari_simulasi>); 
``` 
<br>
Catatan: prosedur hapusBahanKadaluarsa harus dijalankan setiap kali prosedur tidur dijalankan.
<br>

### aksiBahan.pas
Jangan lupa untuk mengubah nilai currentSimulasi: main.data, currentSimulasi : main.data, dan <variabel_ruang_inventori_yang_digunakan> dengan menggunakan prosedur pada energi.pas, uang.pas, dan inventori.pas.
#### beliBahan
```pascal
procedure beliBahan(var arrInvMentah : array of main.isi_inventori; arrBahanMentah : array of main.bahan_mentah); 
``` 
<br>
Note: minta masukan bahan yang mau dibeli di dalam prosedur. <br>
beliBahan digunakan untuk membeli bahan mentah dari supermarket. Butuh energi dan uang untuk melakukan beliBahan. Bahan disimpan dalam inventori. Jumlah bahan dalam inventori harus diubah. Jangan lupa untuk melakukan validasi pada setiap aspek (uang tidak mencukupi, inventori tidak mencukupi, dsb.). Jika bahan gagal dibeli, tampilkan "Pembelian bahan gagal, silakan coba lagi."
#### olahBahan
```pascal
procedure olahBahan(var arrInvOlahan : array of main.isi_inventori; arrBahanOlahan : array of main.bahan_olahan);
```
<br>
Note: minta masukan bahan olahan yang ingin dibuat di dalam prosedur dan jangan lupa melakukan validasi terhadap jumlah bahan serta ketersediaan data bahan olahan yang diinput pada arrBahanOlahan yang di-load dari file eksternal. Langsung keluar dari prosedur jika bahan tidak mencukupi dan tampilkan "Pengolahan gagal. Silakan coba lagi.". <br>
olahBahan digunakan untuk mengolah bahan mentah menjadi bahan olahan, lalu bahan tersebut disimpan ke dalam inventori. Butuh energi. Bahan yang
digunakan harus dikurangi jumlahnya sebanyak 1.
#### jualResep
```pascal
procedure jualResep (var arrInvOlahan : array of main.isi_inventori; var arrInvMentah : array of main.isi_inventori; arrResep : array of main.hasil_olah);
```
<br>
Note: minta masukan resep yang ingin dibuat di dalam prosedur dan jangan lupa melakukan validasi terhadap jumlah bahan. 
Langsung keluar dari prosedur jika bahan tidak mencukupi dan tampilkan "Pengolahan gagal. Silakan coba lagi.". <br>
jualResep digunakan untuk membuat resep tertentu dari bahan mentah dan bahan olahan yang ada di inventori dan menjualnya untuk mendapatkan
keuntungan. Butuh energi. Bahan yang sudah habis setelah jualResep dijalankan harus dihapus dari inventori. Setiap kali bahan digunakan, jumlahnya akan dikurangi sebanyak 1.
#### hapusBahanKadaluarsa
```pascal
procedure hapusBahanKadaluarsa (var arrInvOlahan : array of main.isi_inventori; arrBahanMentah: array of main.bahan_mentah; var arrInvMentah : array of main.isi_inventori; currentSimulasi: data); 
```
<br>
Note: Untuk bahan mentah, sesuaikan waktu kadaluarsa dengan selisih antara waktu pembelian Bahan Olahan dengan currentSimulasi.dd, currentSimulasi.mm, currentSimulasi.yy (Jika selisih = 0, bahan kadaluarsa dan akan dihapus). Untuk arrBahanOlahan, seluruh Bahan Olahan memiliki durasi kadaluarsa 3 hari. Cari selisih antara arrBahanOlahan.dd, arrBahanOlahan.mm, arrBahanMentah.yy dengan currentSimulasi.dd, currentSimulasi.mm, currentSimulasi.yy. Jika selisih = 0, bahan akan dihapus dari inventori. Prosedur ini akan digunakan tiap kali prosedur tidur dijalankan.
#### restockBahan - rancang spesifikasinya
```pascal 
procedure restockBahan
```
<br>

### aksiResep.pas
#### lihatResep
```pascal
procedure lihatResep(arrResep : array of main.hasil_olah);
```
#### cariResep
```pascal
procedure cariResep(arrResep : array of main.hasil_olah);
```
<br>
Note: resep yang ingin dicari diminta masukannya kepada user di dalam prosedur ini (bukan di luar prosedur). Resep dicari dengan nama.
#### tambahResep
```pascal
procedure tambahResep(var arrResep : array of main.hasil_olah); 
```
<br>
Note: Jangan lupa lakukan validasi terhadap jumlah bahan mentah/olahan (min. terdiri dari 2 bahan) dan ketersediaan masukan bahan pada arrBahanMentah dan arrBahanOlahan. Validasi juga harga resep yang dimasukkan user (minimal 12.5% lebih tinggi dari harga total bahan yang digunakan). Jika terdapat desimal pada harga resep, bulatkan ke atas.
<br>

### aksiLoad.pas
#### loadBahanMentah
```pascal
procedure loadBahanMentah(var arrBahanMentah : array of main.bahan_mentah); 
```
<br>
Note: Load dari listBahanMentah.dat. Return informasi error jika load gagal: "Pesan Error: Gagal memuat file data bahan mentah!".
#### loadBahanOlahan
```pascal
procedure loadBahanOlahan(var arrBahanOlahan : array of main.hasil_olah);
```
<br>
Note: Load dari listBahanOlahan.dat. Return informasi error jika load gagal: "Pesan Error: Gagal memuat file data bahan olahan!".
#### loadResep
```pascal
procedure loadResep(var arrResep : array of main.hasil_olah); 
```
<br>
Note: Load dari resep.dat. Return informasi error jika load gagal: "Pesan Error: Gagal memuat file data resep!".
#### loadInventori
```pascal
procedure loadInventori(var arrInvMentah : array of main.isi_inventori; var arrInvOlahan : array of main.isi_inventori); 
```
<br>
Note: Load dari listInvenMentah.dat dan listInvenOlahan.dat. Return informasi error jika load gagal: "Pesan Error: Gagal memuat file data inventori!".
<br>

### aksiSimulasi.pas
#### startSimulasi
```pascal
procedure startSimulasi(var currentSimulasi : data, dataSimulasi : array of data); 
```
<br>
Note: Start simulasi yang dipilih. Data dari dataSimulasi yg dipilih di-clone ke dalam variabel currentSimulasi.
#### stopSimulasi
```pascal
procedure stopSimulasi(var currentSimulasi : data, dataSimulasi : array of data); 
```
<br>
Note: Stop simulasi yang sedang dijalankan. Panggil lihatStatistik dari unit aksiStatistik.pas
#### exit
```pascal
procedure exit(var terminateProgram: boolean); 
```
<br>
Note: panggil seluruh prosedur save (saveResep, saveInventori) pada prosedur ini.
<br>

### aksiSave.pas
#### saveInventori
```pascal
procedure saveInventori(var arrInvMentah: array of isi_inventori; var arrInvOlahan: array of isi_inventori);
```
<br>
Menyimpan inventori Simulasi ke dalam file eksternal listInvenMentah.dat dan listInvenOlahan.dat
#### saveResep
```pascal
procedure saveResep(var arrResep: array of hasil_olah);
```
<br>
Menyimpan seluruh resep pada arrResep ke dalam file eksternal resep.dat
<br>

### aksiStatistik.pas
#### lihatStatistik
```pascal
procedure lihatStatistik(currentSimulasi: data; arrInvMentah: array of isi_inventori; arrInvOlahan: array of isi_inventori);
```
<br>
Menampilkan statistik informasi yang sedang dijalankan atau di-stopSimulasi. Buat selengkap dan serapi mungkin~ (bentuk tabel, blablabla)
<br>

### handler.pas
#### runUserInterface
```pascal
procedure runUserInterface(var terminateProgram : boolean); 
```
<br>
Fungsional masukan dan keluaran, mengecek perintah yang dimasukkan oleh user dengan if conditional, dan menjalankan prosedur pada unit-unit lainnya sesuai dengan masukan dari user. Jika user memasukkan "exit", terminateProgram akan bernilai true sehingga runUserInterface tidak di-loop lagi pada main.pas. <br>

if conditional checking dilakukan untuk setiap input yang sesuai dengan fitur (cek spesifikasi tubes. Contoh terdapat pada halaman 6). Setiap baris harus terdapat "> ". Jika input user tidak sesuai dengan string yang ada pada bagian fitur (misal 'startSimulasi' diinput menjadi 'mulaiSimulasi'), minta user mengulangi input. <br>

Agar dapat berjalan, cantumkan seluruh unit yang digunakan pada bagian implementation (hmmm... sederhananya handler.pas bakal pakai semua unit selain main.pas) <br>

### main.pas
main.pas hanya untuk looping runUserInterface sampai variabel terminateProgram bernilai True (Jangan lupa untuk menginisialisasi terminateProgram menjadi False). Seluruh kamus dideklarasikan pada main.pas. Uses handler, aksiSimulasi. 
