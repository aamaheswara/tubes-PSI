<!DOCTYPE html>
<!-- test comment -->
<?php
session_start();
require "php/config.php";

if (!isset($_SESSION["username"])) {
  echo "Anda harus login dulu <br><a href='login.php'>Klik disini</a>";
  exit;
}

$id_user=$_SESSION["id"];
  $username=$_SESSION["username"];
  $nama=$_SESSION["nama"];
  $email=$_SESSION["email"];
  $toko = $_SESSION["toko"];  

$sql = "select * from toko where id='".$toko."'";
$hasil = mysqli_query ($kon,$sql);
$jumlah = mysqli_num_rows($hasil);
      

if ($jumlah>0) {
    $row = mysqli_fetch_assoc($hasil);
    $toko_nama = $row["nama"];
    
}
$sql2 = "select * from pegawai where id_toko='".$toko."'";
$hasil = mysqli_query ($kon,$sql2);
$jumlah = mysqli_num_rows($hasil);
      

if ($jumlah>0) {
    $row = mysqli_fetch_assoc($hasil);
    $Pusername=$row["username"];
    $Pnama=$row["nama"];
    $Pemail=$row["email"];
    $Pid = $row["id"]; 
    
}
?>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Input Data</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">

  <!-- dari advanced forms -->
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- daterange picker -->
  <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
  <!-- iCheck for checkboxes and radio inputs -->
  <link rel="stylesheet" href="../../plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Bootstrap Color Picker -->
  <link rel="stylesheet" href="../../plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="../../plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="../../plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="../../plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
  <!-- Bootstrap4 Duallistbox -->
  <link rel="stylesheet" href="../../plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
  <!-- BS Stepper -->
  <link rel="stylesheet" href="../../plugins/bs-stepper/css/bs-stepper.min.css">
  <!-- dropzonejs -->
  <link rel="stylesheet" href="../../plugins/dropzone/min/dropzone.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">


  <!-- Script JS u/ tabel transaksi -->
  
  <script type="text/javascript">
    myFunction(e){
        if(e.target.value = "Aqua"){
          document.getElementById("hargabox").value = "2000";
          document.getElementById("hargabox").placeholder = "2000";
        }
        else(e.target.value = "Dairy Milk"){
          document.getElementById("hargabox").value = "2000";
          document.getElementById("hargabox").placeholder = "2000";
        }
        else(e.target.value = "Sapu Rumah"){
          document.getElementById("hargabox").value = "2000";
          document.getElementById("hargabox").placeholder = "2000";
        }
        else(e.target.value = "Lays"){
          document.getElementById("hargabox").value = "2000";
          document.getElementById("hargabox").placeholder = "2000";
        }
    }

        function addField(n) {
        var myTable = document.getElementById("t-produk");
        var currentIndex = myTable.rows.length;
        var currentRow = myTable.insertRow(currentIndex - 1);

        var productBox = document.createElement("SELECT");
        productBox.setAttribute("name", "produkbox" + currentIndex);
        productBox.setAttribute("class", "form-control select2");
        
        // buat isi dropdown options dari SELECT
        document.body.appendChild(productBox);

        var items = ["Aqua","Sapu Rumah","Lays", "Dairy Milk"];
        for(var i = 0;i<items.length;i++) {
          var item = items[i];
          var newOption = document.createElement("option");
          newOption.setAttribute("value", item);
          var textNode = document.createTextNode(item);
          newOption.appendChild(textNode);
          productBox.appendChild(newOption);
        }     
         

        var hargaBox = document.createElement("input");
        hargaBox.setAttribute("name", "hargabox" + currentIndex);
        hargaBox.setAttribute("type", "text");
        hargaBox.setAttribute("class", "form-control");
        hargaBox.setAttribute("disabled", "true");

        
        var jumlahprodukBox = document.createElement("input");
        jumlahprodukBox.setAttribute("name", "jumlahitem" + currentIndex);
        jumlahprodukBox.setAttribute("type", "number");
        jumlahprodukBox.setAttribute("class", "form-control");
        

        var subtotalbox = document.createElement("input");
        subtotalbox.setAttribute("type", "text");
        subtotalbox.setAttribute("class", "form-control");
        subtotalbox.setAttribute("disabled", "true");
        subtotalbox.setAttribute("name",  "subtotal" + currentIndex);


         var currentCell = currentRow.insertCell(-1);
         currentCell.appendChild(productBox);

         currentCell = currentRow.insertCell(-1);
         currentCell.appendChild(hargaBox);

         currentCell = currentRow.insertCell(-1);
         currentCell.appendChild(jumlahprodukBox);

         currentCell = currentRow.insertCell(-1);
         currentCell.appendChild(subtotalbox);
        }
        
        
         

    // function addField (argument) {
    //     var myTable = document.getElementById("t-produk");
    //     var currentIndex = myTable.rows.length;
    //     var currentRow = myTable.insertRow(-1);

    //     var linksBox = document.createElement("input");
    //     linksBox.setAttribute("name", "links" + currentIndex);

    //     var keywordsBox = document.createElement("input");
    //     keywordsBox.setAttribute("name", "keywords" + currentIndex);

    //     var violationsBox = document.createElement("input");
    //     violationsBox.setAttribute("name", "violationtype" + currentIndex);

    //     var addRowBox = document.createElement("input");
    //     addRowBox.setAttribute("type", "button");
    //     addRowBox.setAttribute("value", "Add another line");
    //     addRowBox.setAttribute("onclick", "addField();");
    //     addRowBox.setAttribute("class", "button");

    //     var currentCell = currentRow.insertCell(-1);
    //     currentCell.appendChild(linksBox);

    //     currentCell = currentRow.insertCell(-1);
    //     currentCell.appendChild(keywordsBox);

    //     currentCell = currentRow.insertCell(-1);
    //     currentCell.appendChild(violationsBox);

    //     currentCell = currentRow.insertCell(-1);
    //     currentCell.appendChild(addRowBox);
    // }
  </script>
</head>
<body class="hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__wobble" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="index.php" class="nav-link">Home</a>
      </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <!-- Navbar Search -->
      

    
      <!-- Messages Dropdown Menu -->
      
      
      <!-- Notifications Dropdown Menu -->
      
    </ul>
  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index.html" class="brand-link">
      <img src="dist/img/supermart.jpg" alt="SuperMart Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">SuperMart</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="dist/img/avatar.png" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block"><?php echo "$nama";?></a>
        </div>
      </div>

      <!-- SidebarSearch Form -->
      <div class="form-inline">
        <div class="input-group" data-widget="sidebar-search">
          <input class="form-control form-control-sidebar" type="search" placeholder="Search" aria-label="Search">
          <div class="input-group-append">
            <button class="btn btn-sidebar">
              <i class="fas fa-search fa-fw"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
               <li class="nav-item">
                <a href="index.php" class="nav-link ">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    DashBoard
                    
                  </p>
                </a>
                
              </li>
    
              <li class="nav-item">
                <a href="input.html" class="nav-link active">
                  <i class="nav-icon fas fa-edit"></i>
                  <p>
                    Input Data
                  </p>
                </a>
              </li>

        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Form Input Transaksi Kasir</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="index.html">Home</a></li>
              <li class="breadcrumb-item active">Input</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-md-12">
            <!-- general form elements -->
            <div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Input dengan teliti!</h3>
              </div>
              <!-- /.card-header -->
              <!-- form start -->
              <form method="post" action="php/input-action.php">
                <div class="card-body">
                  <div class="form-group">
                    <label>ID Toko</label>
                    <input type="text" name="toko" class="form-control" value="<?php echo $toko_nama;?>" placeholder="<?php echo $toko_nama;?>" disabled>
                  </div>

                  <div class="form-group">
                    <label>ID Pegawai</label>
                    <select class="form-control select2" style="width: 100%;" name="pegawai">
                      <option disabled selected>Pilih</option>

                      

                    </select>
                  </div>
                  
                  <div class="form-group">
                    <label>Shift</label>
                    <select class="form-control select2" style="width: 100%;">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label>ID Mesin Kasir</label>
                    <select class="form-control select2" style="width: 100%;">
                      <option>1</option>
                      <option>2</option>
                      <option>3</option>
                      <option>4</option>
                      <option>5</option>
                      <option>6</option>
                      <option>7</option>
                    </select>
                  </div>

                  <div class="form-group">
                    <label>Metode Pembayaran</label>
                    <select class="form-control select2" style="width: 100%;">
                      <option>Cash</option>
                      <option>E-Money</option>
                      <option>Kartu</option>
                    </select>
                  </div>

                  <!-- mulai tabel produk-produk -->

                  <div class="form-group">
                    <div class="row">
                      <div class="col-md-6">
                        <label>Produk dibeli</label>
                      </div>
                      <div class="col-md-6">
                        <input type="button" class="button" value="Tambah Produk" onclick="addField(this);">
                      </div>
                    </div>
                    
                    <table class="table table-bordered" id="t-produk"> 
                      <!-- class table dari bootstrap -->
                      <thead class="thead-light">
                        <tr>
                          <th>Item</th>
                          <th>Harga Satuan</th>
                          <th>Jumlah item</th>
                          <th>Subtotal</th>
                        </tr>
                      </thead>
                      <tbody class="tbody-light">
                        <tr>
                          <td>
                            <form action="GET">
                            <select class="form-control select2" style="width: 100%;" name="produkbox" onchange="myFunction(event)">
                            <option disabled selected>Pilih</option>
                              <option value="Aqua">Aqua</option>
                              <option value="Sapu Rumah">Sapu Rumah</option>
                              <option value="Lays">Lays</option>
                              <option value="Diary Milk">Dairy Milk</option>
                            </form>

                            </select>
                          </td>
                          <td>
                            <input class="form-control" type="text" name="hargabox" id="hargabox"  >
                          
                        </td>
                          <td>
                            <input class="form-control" type="number" name="jumlahitem" id="">
                          </td>
                          <td>
                            <input class="form-control" type="text" name="subtotal" id="" disabled>
                          </td>
                        </tr>
                        <tr>
                          <td colspan="2"><p>Total</p></td>
                          <td>
                            <input class="form-control" type="number" name="jumlahitem" id="" disabled>
                          </td>
                          <td>
                            <input class="form-control" type="text" name="subtotal" id="" disabled>
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  
                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                  <button type="submit" class="btn btn-primary">Submit</button>
                </div>
              </form>
            </div>
            <!-- /.card    --> 

            <!-- delete mulai dari sini -->
            

          </div>
          <!--/.col (left) -->
          <!-- right column -->
          
          <!--/.col (right) -->
        </div>

        <!-- /.row -->
      </div><!--/. container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2021 Kelompok 6: SuperFour.</strong>
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="../../plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- Bootstrap -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- overlayScrollbars -->
<script src="plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.js"></script>

<!-- PAGE PLUGINS -->
<!-- jQuery Mapael -->
<script src="plugins/jquery-mousewheel/jquery.mousewheel.js"></script>
<script src="plugins/raphael/raphael.min.js"></script>
<script src="plugins/jquery-mapael/jquery.mapael.min.js"></script>
<script src="plugins/jquery-mapael/maps/usa_states.min.js"></script>
<!-- ChartJS -->
<script src="plugins/chart.js/Chart.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard2.js"></script>

<!-- dari advanced -->
<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Select2 -->
<script src="../../plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="../../plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="../../plugins/moment/moment.min.js"></script>
<script src="../../plugins/inputmask/jquery.inputmask.min.js"></script>
<!-- date-range-picker -->
<script src="../../plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="../../plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="../../plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="../../plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- BS-Stepper -->
<script src="../../plugins/bs-stepper/js/bs-stepper.min.js"></script>
<!-- dropzonejs -->
<script src="../../plugins/dropzone/min/dropzone.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>

<!-- Page specific script dari advanced-->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date picker
    $('#reservationdate').datetimepicker({
        format: 'L'
    });

    //Date and time picker
    $('#reservationdatetime').datetimepicker({ icons: { time: 'far fa-clock' } });

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })

    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    })

  })
  // BS-Stepper Init
  document.addEventListener('DOMContentLoaded', function () {
    window.stepper = new Stepper(document.querySelector('.bs-stepper'))
  })

  // DropzoneJS Demo Code Start
  Dropzone.autoDiscover = false

  // Get the template HTML and remove it from the doumenthe template HTML and remove it from the doument
  var previewNode = document.querySelector("#template")
  previewNode.id = ""
  var previewTemplate = previewNode.parentNode.innerHTML
  previewNode.parentNode.removeChild(previewNode)

  var myDropzone = new Dropzone(document.body, { // Make the whole body a dropzone
    url: "/target-url", // Set the url
    thumbnailWidth: 80,
    thumbnailHeight: 80,
    parallelUploads: 20,
    previewTemplate: previewTemplate,
    autoQueue: false, // Make sure the files aren't queued until manually added
    previewsContainer: "#previews", // Define the container to display the previews
    clickable: ".fileinput-button" // Define the element that should be used as click trigger to select files.
  })

  myDropzone.on("addedfile", function(file) {
    // Hookup the start button
    file.previewElement.querySelector(".start").onclick = function() { myDropzone.enqueueFile(file) }
  })

  // Update the total progress bar
  myDropzone.on("totaluploadprogress", function(progress) {
    document.querySelector("#total-progress .progress-bar").style.width = progress + "%"
  })

  myDropzone.on("sending", function(file) {
    // Show the total progress bar when upload starts
    document.querySelector("#total-progress").style.opacity = "1"
    // And disable the start button
    file.previewElement.querySelector(".start").setAttribute("disabled", "disabled")
  })

  // Hide the total progress bar when nothing's uploading anymore
  myDropzone.on("queuecomplete", function(progress) {
    document.querySelector("#total-progress").style.opacity = "0"
  })

  // Setup the buttons for all transfers
  // The "add files" button doesn't need to be setup because the config
  // `clickable` has already been specified.
  document.querySelector("#actions .start").onclick = function() {
    myDropzone.enqueueFiles(myDropzone.getFilesWithStatus(Dropzone.ADDED))
  }
  document.querySelector("#actions .cancel").onclick = function() {
    myDropzone.removeAllFiles(true)
  }
  // DropzoneJS Demo Code End
</script>
</body>
</html>
