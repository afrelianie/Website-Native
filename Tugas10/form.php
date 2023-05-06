<?php

 //memanggil dan memproses file bagian atas/header
 include_once 'top.php';
 //memanggil dan memproses file bagian menu/sidebar
 include_once 'menu.php';

?> 


     <!-- jquery validation -->
          <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Tambah <small>Produk</small></h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form id="quickForm">
                <div class="card-body">
                  <div class="form-group">
                    <label for="exampleInputEmail1">Nama Produk</label>
                    <input type="text" name="name" class="form-control" placeholder="Masukkan Nama" require>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Jumlah Produk</label>
                    <input type="number" name="jml" class="form-control" placeholder="Jumlah Produk" require>
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Harga Produk</label>
                    <input type="number" name="harga" class="form-control" placeholder="Jumlah Produk" require>
                  </div>
                </div>
                <!-- /.card-body -->
                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Tambah</button>
                </div>
              </form>
          </div>
     <!-- /.card -->
    