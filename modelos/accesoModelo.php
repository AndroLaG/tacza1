<?php
require 'conexion.php';

class Login
{
    public function IniciarSesion($usu, $con)
    {
        session_start();
        $conex = new Conexion();
        $stmt = $conex->prepare("SELECT * FROM empleados WHERE usuario = :usu");
        $stmt->bindValue(":usu", $usu, PDO::PARAM_STR);
        $stmt->execute();
        $obj_usuario = $stmt->fetch(PDO::FETCH_OBJ);

        if (!$obj_usuario) {
            return "El usuario no existe";
        } else {
            // Verifica si las contraseñas coinciden (ajustar según formato)
            if (!password_verify($con, $obj_usuario->contrasena)) {
                return "La contraseña ingresada es incorrecta";
            }
            $_SESSION["perfil"] = $obj_usuario->cargo;
            $_SESSION["usuario"] = $obj_usuario->nombre;
            return "OK";
        }
    }}
?>
