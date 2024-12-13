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
                    <h5 class="card-header bg-primary bg-gradient text-white">Mantenimiento de Clientes</h5>
                    <div class="card-body">
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#Agregarcliente"><i class='fa fa-plus-circle'></i> Nuevo</button>
                        <?php
                            require_once 'ModalCliente.php';
                        ?>
                        <table id="dtCliente" class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>CÓDIGO</th>
                                    <th>NOMBRES</th>
                                    <th>DIRECCIÓN</th>
                                    <th>TELEFONO</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody id="datos"></tbody>
                        </table>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</section>
<?php
  require_once '../parte_inferior.php';
  echo "<script src='../js/clientes.js'></script>";
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