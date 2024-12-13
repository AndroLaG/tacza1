<?php
require 'conexion.php';
class Clientes
{
    public function listar_clientes()
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("select * from cliente");
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_OBJ);
    }
    public function agregar_clientes($n,$d,$t)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("insert into cliente values(null,:n,:d,:t);");
        $stmt->bindValue(":n",$n,PDO::PARAM_STR);
        $stmt->bindValue(":d",$d,PDO::PARAM_STR);
        $stmt->bindValue(":t",$t,PDO::PARAM_STR);

        if($stmt->execute())
        {
           return "OK"; 
        }
        else{
            return "Error: se ha generado un error al guardar la información";
        }
    } 
    public function ConsultarPorId($id)  
    {
        $conex=new Conexion();
        $sql="select * from cliente where id_cliente=?";
        $stmt=$conex->prepare($sql);
        $stmt->bindParam(1,$id);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_OBJ);
    } 
    public function modificar_cliente($id,$n,$d,$t)
    {
        $conex=new Conexion();
        $sql="update cliente "
            ."set "
            ."nom_cliente=? ,"
            ."direccion=? ,"
            ."telefono=? "
            ."where id_cliente=?;";
        $stmt=$conex->prepare($sql);
        $stmt->bindParam(1,$n);
        $stmt->bindParam(2,$d);
        $stmt->bindParam(3,$t);
        $stmt->bindParam(4,$id);

        if($stmt->execute())
        {
            return "OK";
        }
        else{
            return "Error: se ha generado un error al Modificar la Información";
        }
    }
    public function Eliminar($id)
    {
        $conex=new Conexion();
        $stmt=$conex->prepare("delete from cliente where id_cliente=?;");
        $stmt->bindParam(1,$id);

        if($stmt->execute())
        {
            return "OK";
        }
        else{
            return "se ha generado un error al eliminar la información";
        }
    }
}
?>