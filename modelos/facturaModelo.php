<?php
require 'conexion.php';
class Facturas
{
    public function listar_facturas()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("call sp_listar_facturas();");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function seleccionar_cliente()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("select * from cliente");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function seleccionar_producto()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("select * from productos");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function capturar_cliente($id)  
    {
        $conex=new Conexion();
        $sql="select * from cliente where id_cliente=?";
        $stmt=$conex->prepare($sql);
        $stmt->bindParam(1,$id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_OBJ);
    } 
    public function capturar_producto($id)  
    {
        $conex=new Conexion();
        $sql="select * from productos where idproducto=?";
        $stmt=$conex->prepare($sql);
        $stmt->bindParam(1,$id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_OBJ);
    }     
}
?>

