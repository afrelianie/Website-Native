
TUGAS 7

mysql> delimiter $$
mysql> select*from pelanggan;
    -> $$


Buat fungsi inputPelanggan(), setelah itu panggil fungsinya
mysql> create procedure inputPelanggan()
    -> begin
    -> select nama, jk, tmp_lahir, email, kartu_id, alamat from pelanggan;
    -> end $$

panggil fungsi
mysql> call inputpelanggan();


Buat fungsi showPelanggan(), setelah itu panggil fungsinya
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> create procedure showPelanggan()
    -> begin
    -> select nama, jk, tmp_lahir, email, kartu_id, alamat from pelanggan;
    -> end $$

mysql> call showpelanggan();
    -> $$

Buat fungsi inputProduk(), setelah itu panggil fungsinya
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> create procedure inputProduk()
    -> begin
    -> select nama, harga_beli, harga_jual from produk;
    -> end $$

mysql> call inputproduk();
    -> $$

Buat fungsi showProduk(), setelah itu panggil fungsinya
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> create procedure showProduk()
    -> begin
    -> select nama, harga_beli, harga_jual from produk;
    -> end $$

mysql> call showproduk();
    -> $$


Buat fungsi totalPesanan(), setelah itu panggil fungsinya
mysql> DELIMITER ;
mysql> DELIMITER $$
mysql> create procedure totalPesanan(in hrg double, in jml int, out total double)
    -> begin
    -> set total = hrg*jml;
    -> select @total;
    -> end $$

tampilkan seluruh pesanan dari semua pelanggan
mysql> call totalpesanan(25000,4,@totalHarga);
mysql> select @totalpesanan;

buatkan query panjang di atas menjadi sebuah view baru: pesanan_produk_vw 
(menggunakan join dari table pesanan,pelanggan dan produk)

mysql> select pesanan.*, produk.nama as jenis from produk inner join pesanan
    -> on pesanan.produk_id = produk.id;

mysql> select p.*, j.nama as jenis from produk j inner join pesanan p on p.produk_id = j.id;

mysql> create view pesanan_produk_vw as
    -> select p.*, j.nama as jenis from produk j inner join pesanan p on p.produk_id = j.id;

mysql> select * from pesanan_produk_vw;













