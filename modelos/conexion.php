<?php
session_start();
class Conexion extends PDO{

    public function __construct(){
        try{
                parent::__construct("mysql:host=localhost;dbname=redservcom_bd", "root", "");
                parent::exec("set names utf8");
            }catch(PDOException $e){
                echo "Error al conectar " . $e->getMessage();
                exit;
            }
    }

}

?>
<?php
// class conecta
// {
//     private static $conexion;

//     public static function conectarBD()
//     {
//         if (!self::$conexion) {
//             self::$conexion = mysqli_connect('localhost', 'root', '', 'redservcom_bd');
//             if (!self::$conexion) {
//                 die("Error al conectar a la base de datos: " . mysqli_connect_error());
//             }
//         }
//         return self::$conexion;
//     }

//     public static function desConectaBD()
//     {
//         if (self::$conexion) {
//             mysqli_close(self::$conexion);
//             self::$conexion = null;
//         }
//     }
//     public static function debuguearConexion()
//     {
//         echo("<pre>");
//         var_dump(self::$conexion);
//         echo("</pre>");
//     }
// }
// // pruebas
// conecta::conectarBD();
// conecta::debuguearConexion();
// conecta::desConectaBD();
?>