<?php
require 'conexion.php';
class Productos
{
    public function listar_productos()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call listar_productos();");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function llenar_lista()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call listar_tipo();");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function agregar_productos($n,$p,$s,$t,$c)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call agregar_productos(?,?,?,?,?);");
        $stmt->bindParam(1,$n);
        $stmt->bindParam(2,$p);
        $stmt->bindParam(3,$s);
        $stmt->bindParam(4,$t);
        $stmt->bindParam(5,$c);

        if($stmt->execute())
        {
           return "OK"; 
        }
        else{
            return "Error: se ha generado un error al guardar la información";
        }
    } 
    public function ConsultarProId($idProducto)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call listar_productos_id(?);");
        $stmt->bindParam(1,$idProducto);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_OBJ);
    } 
    public function modificar_producto($idPro,$nom,$pre,$sto,$tip,$con)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call editar_productos(?,?,?,?,?,?);");
        $stmt->bindParam(1,$nom);
        $stmt->bindParam(2,$pre);
        $stmt->bindParam(3,$sto);
        $stmt->bindParam(4,$tip);
        $stmt->bindParam(5,$idPro);
        $stmt->bindParam(6,$con);
       
        if($stmt->execute())
        {
            return "OK";
        }
        else
        {
            return "Error se ha generado un error al modificar la información";
        }
    } 
    public function eliminar($idPro,$con)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call eliminar_productos(?,?);");
        $stmt->bindParam(1,$idPro);
        $stmt->bindParam(2,$con);

        if($stmt->execute())
        {
           return "OK"; 
        }
        else{
            return "Error: se ha generado un error al eliminar la información";
        }
    }    
}
?>

