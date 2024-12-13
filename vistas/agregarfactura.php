<?php
session_start();
if(isset($_SESSION['perfil']) and isset($_SESSION['usuario']))
{
  require_once '../parte_superior.php';
?>
<?php
  require_once 'ModalAfactura.php';
?>
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <h5 class="card-header bg-primary bg-gradient text-white">Agregar Facturas</h5>
                    <div class="card-body">                        
                        <div class="row">
                            <input type="hidden" id="idCliente">
                            <div class="col-6 input-group mt-2">                                    
                                <input type="text" id="cli" class="form-control" placeholder="Seleccionar Cliente" aria-describedby="cli" disabled>
                                <button class="btn btn-primary" type="button" id="cli" data-bs-toggle="modal" data-bs-target="#Aclientefactura"><i class="fas fa-search"></i></button>                                
                            </div>                             
                            <div class="col-6 mt-2"> 
                                <input type="text" id="dir" class="form-control" placeholder="Dirección" disabled>
                            </div>          
                            <div class="col-6 mt-4">                
                                <input type="text" id="tel" class="form-control" placeholder="Telefono" disabled>
                            </div>                                       
                            <div class="col-6 mt-4">
                                <input type="text" id="fec" class="form-control" placeholder="Fecha" disabled>
                            </div>
                            <div class="d-flex gap-2 justify-content-end col-12 mt-4">
                                <button type="button" class="btn btn-primary">Nuevo Cliente</button>                                
                            </div>
                       </div>
                       <div class="row">
                            <input type="hidden" id="idProducto">
                            <div class="col-6 input-group mt-2">                                    
                                <input type="text" id="pro" class="form-control" placeholder="Seleccionar Producto" aria-describedby="pro" disabled>
                                <button class="btn btn-primary" type="button" id="pro" data-bs-toggle="modal" data-bs-target="#Aproductofactura"><i class="fas fa-search"></i></button>                                
                            </div>                         
                            <div class="col-3 mt-2">                
                                <input type="text" id="pre" class="form-control" placeholder="Precio" disabled>
                            </div>                                       
                            <div class="col-3 mt-2">
                                <input type="text" id="can" class="form-control" placeholder="Cantidad" disabled>
                            </div>
                            <div class="d-flex gap-2 justify-content-end col-12 mt-4"> 
                                <button type="button" class="btn btn-secondary" onclick="seleccionar_pro();">Agregar Producto</button>                            
                            </div>
                       </div>
                    </div>
                    <div class="card-footer bg-white">
                        <table id="dtProducto" class="table table-bordered">
                            <thead class="bg-blue">
                                <tr>
                                    <th>CODIGO</th>
                                    <th style="width: 700px;">DESCRIPCION</th>
                                    <th style="width: 200px;">PRECIO</th>
                                    <th style="width: 200px;">CANTIDAD</th>
                                    <th style="width: 200px;">STOTAL</th>
                                    <th style="width: 200px;"></th>
                                </tr>
                            </thead>
                            <tbody id="datosprod">              
                            </tbody>                                             
                            <tfoot>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>SUB-TOTAL</td>
                                    <td><input type="text" class="form-control" id="stotal" style="text-align:right" disabled></td>
                                    <td></td>
                                </tr> 
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>IGV</td>
                                    <td><input type="text" class="form-control" id="igv" style="text-align:right" disabled></td>
                                    <td></td>
                                </tr> 
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>TOTAL</td>
                                    <td><input type="text" class="form-control" id="total" style="text-align:right" disabled></td>
                                    <td></td>
                                </tr>
                            </tfoot>                                   
                        </table>
                    </div>
                    <div class="d-flex gap-2 justify-content-end col-12 my-4"> 
                        <button type="button" class="btn btn-primary">Guardar</button>
                        <button type="button" class="btn btn-success">Imprimir</button>
                        <button type="button" class="btn btn-danger mx-3" onclick="window.location='facturas.php'">Cancelar</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div> 
</section>
<?php
  require_once '../parte_inferior.php';
  echo "<script src='../js/Afacturas.js'></script>";
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