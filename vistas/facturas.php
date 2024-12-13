<?php
session_start();
if(isset($_SESSION['perfil']) and isset($_SESSION['usuario']))
{
  require_once '../parte_superior.php';
?>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <h5 class="card-header bg-primary bg-gradient text-white">Mantenimiento de Facturas</h5>
                    <div class="card-body">
                        <button type="button" class="btn btn-primary mb-5" onclick="window.location='agregarfactura.php'"><i class='fa fa-plus-circle'></i> Nuevo</button>
                        <table id="dtProducto" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>CODIGO</th>
                                    <th>CLIENTE</th>
                                    <th>FECHA</th>
                                    <th>SUB-TOTAL</th>
                                    <th>IGV</th>
                                    <th>TOTAL</th>
                                    <th>CONDICIÓN</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="datos">                 
                            </tbody>     
                        </table>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</section>
<?php
  require_once '../parte_inferior.php';
  echo "<script src='../js/facturas.js'></script>";
  echo "<script src='../js/salir.js'></script>";
}
else
{
  echo '<script>
        alert("Usted de Loguearse para Ingresar al Sistema");
        window.location="../index.php";
        </script>';
}
  
?>