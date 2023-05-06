<?php

//  include_once 'top.php';
//  include_once 'menu.php';

$model = new Pesanan();
$data_pesanan = $model->dataPesanan();



?> 
      
     <!-- Main row -->
     <div class="row">
          <!-- Left col -->
          <div class="col-md-11">
           
            <!-- TABLE: LATEST ORDERS -->
            <div class="card">
              <div class="card-header border-transparent">
                <h3 class="card-title">Pesanan</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                  <button type="button" class="btn btn-tool" data-card-widget="remove">
                    <i class="fas fa-times"></i>
                  </button>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <div class="table-responsive">
                  <table class="table m-0">
                    <thead>
                    <tr>
                      <th>No</th>
                      <th>Tanggal</th>
                      <th>Total</th>
                      <th>Pelanggan</th>
                      <th>Produk</th>
                    </tr>
                    </thead>
                    <tbody>
                    
                    <?php
                        $no = 1;
                            foreach($data_produk as $row){
                              ?>
                                <tr>
                                    <td><?= $no ?></td>
                                    <td><?= $row['tanggal']?></td>
                                    <td><?= $row['total']?></td>
                                    <td><?= $row['pelanggan_id']?></td>
                                    <td><?= $row['produk_id']?></td>
                              
                                </tr>
                            <?php
                                $no++; } 
                            ?>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive -->
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <a href="javascript:void(0)" class="btn btn-sm btn-info float-left">Place New Order</a>
                <a href="javascript:void(0)" class="btn btn-sm btn-secondary float-right">View All Orders</a>
              </div>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
     </div>





