<?php
require_once '../modelos/accesoModelo.php';
if($_POST)
{
    $usuario=($_POST['usuario']);
    $contrasena=($_POST['contrasena']);

    $acceso=new Login();

    echo json_encode($acceso->IniciarSesion($usuario,$contrasena));
}
else{
    echo json_encode("No ha enviado datos desde el formulario");
    return;
}
?>