<?php
require_once '../modelos/facturaModelo.php';
if($_POST)
{
    $fac=new Facturas();
    switch($_POST['accion'])
    {
        case "CONSULTAR":
                echo json_encode($fac->listar_facturas());
                break;
        case "CONSULTAR_CLIENTE":
                echo json_encode($fac->seleccionar_cliente());
                break;
        case "CLIENTE_CONSULTAR_ID":
                echo json_encode($fac->capturar_cliente($_POST['idCliente']));
                break;
        case "CONSULTAR_PRODUCTO":
                echo json_encode($fac->seleccionar_producto());
                break;
        case "PRODUCTO_CONSULTAR_ID":
                echo json_encode($fac->capturar_producto($_POST['idProducto']));
                break;        
    }
}
?>