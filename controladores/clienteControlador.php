<?php
require_once '../modelos/clienteModelo.php';
if($_POST)
{
    $cli=new Clientes();
    switch($_POST['accion'])
    {
        case "CONSULTAR":
                echo json_encode($cli->listar_clientes());
                break;
        case "NUEVO":
                $n=$_POST['nom'];
                $d=$_POST['dir'];
                $t=$_POST['tel'];
                echo json_encode($cli->agregar_clientes($n,$d,$t));
                break;  
        case "CONSULTAR_ID":
                echo json_encode($cli->ConsultarPorId($_POST['idCliente']));
                break;
        case "MODIFICAR":
            $n=$_POST['nom'];
            $d=$_POST['dir'];
            $t=$_POST['tel'];
            $id=$_POST['idCliente'];
            echo json_encode($cli->modificar_cliente($id,$n,$d,$t));
            break; 
        case "ELIMINAR":
            $id=$_POST['idCliente'];
            echo json_encode($cli->Eliminar($id));
            break;     
    }
}
?>