<?php
require_once '../modelos/productoModelo.php';
if($_POST)
{
    $pro=new Productos();
    switch($_POST['accion'])
    {
        case "CONSULTAR":
                echo json_encode($pro->listar_productos());
                break;
        case "LLENAR":
                echo json_encode($pro->llenar_lista());
                break;
        case "NUEVO":
                $n=$_POST['nom'];
                $p=$_POST['pre'];
                $s=$_POST['sto'];
                $t=$_POST['tip'];
                $c=$_POST['con'];
                echo json_encode($pro->agregar_productos($n,$p,$s,$t,$c));
                break;
        case "CONSULTAR_ID":
                echo json_encode($pro->ConsultarProId($_POST['idProducto']));
                break;
        case "MODIFICAR":
                $nombre=$_POST['nom'];
                $precio=$_POST['pre'];
                $stock=$_POST['sto'];
                $tipo=$_POST['tip'];
                $condicion=$_POST['con'];
                $idProducto=$_POST['IdProducto'];
                echo json_encode($pro->modificar_producto($idProducto,$nombre,$precio,$stock,$tipo,$condicion));
                break;
        case "ELIMINAR":
                $idProducto=$_POST['idProducto'];
                $con=$_POST['condicion'];
                echo json_encode($pro->Eliminar($idProducto,$con));
                break;
    }
}
?>