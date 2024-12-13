let ruta='../controladores/productoControlador.php';

$(document).ready(function() {
    Consultar();  
    Combo();                  
})
function Consultar()
{
    $.ajax({
        data:{accion:"CONSULTAR"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            let html="";
            $.each(data,function(index,data){
                html+="<tr>";
                html+="<td>"+data.idproducto+"</td>";
                html+="<td>"+data.nombre+"</td>";
                html+="<td>"+data.precio+"</td>";
                html+="<td>"+data.stock+"</td>";
                html+="<td>"+data.id_tipo+"</td>";
                if(data.condicion=="ACTIVO")  html+="<td style='text-align:center'><span class='badge bg-success'>ACTIVO</span></td>";
                else html+="<td style='text-align:center'><span class='badge bg-danger'>DESACTIVO</span></td>";
                html+="<td style='text-align:center'>";
                html+="<button class='btn btn-primary mx-2' onclick='Producto_id("+data.idproducto+");'data-bs-toggle='modal' data-bs-target='#Editarproducto'><i class='fa fa-edit'></i></button>"
                html+="<button class='btn btn-danger' onclick='MostrarAlertaE(" + data.idproducto + ");'><i class='fa fa-trash'></i></button>"
                html+="</td>";
                html+="</tr>";
            });
            document.getElementById('datos').innerHTML=html;
            grid();
        }
    });
}
function Combo()
{
    $.ajax({
        data:{accion:"LLENAR"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(response)
        {
            let html="<option selected>Seleccione un Tipo de Producto</option>";
            $.each(response,function(index,data){
                html+="<option value="+data.id_tipo+">"+data.tipo+"</option>";
            });
            document.getElementById('tip').innerHTML=html;
            document.getElementById('Etip').innerHTML=html;
        }
    });
}
function Agregar()
{
    let nom=document.getElementById('nom').value;
    let pre=document.getElementById('pre').value;
    let sto=document.getElementById('sto').value;
    let tip=document.getElementById('tip').value;
    let con=document.getElementById('con').value;

    if(nom=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar un Nombre de Producto", "error");
        return;
    }
    if(pre=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar un Precio", "error");
        return;
    }
    if(sto=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar un Stock", "error");
        return;
    }
    if(tip=="Seleccione un Tipo de Producto")
    {
        MostrarAlerta("ALERTA", "Debe Seleccionar un Tipo", "error");
        return;
    }
    if(con=="Seleccione Condición")
    {
        MostrarAlerta("ALERTA", "Debe Seleccionar una Condicion", "error");
        return;
    }

    $.ajax({
        data:retornarDatos("NUEVO"),
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            if(data=="OK")
            {
                $("#Agregarproducto").modal('toggle');
                MostrarAlerta("Éxito", "Datos Guardados con Éxito", "success");
            }
            else{
                MostrarAlerta("Error", data, "error");
            }
            limpiar();
            $("#dtProducto").dataTable().fnDestroy();              
            Consultar()
        }
    });
}
function retornarDatos(accion)
{
    return{
        nom:document.getElementById('nom').value,
        pre:document.getElementById('pre').value,
        sto:document.getElementById('sto').value,
        tip:document.getElementById('tip').value,
        con:document.getElementById('con').value,
        accion:accion
    }
}
function limpiar()
{
    document.getElementById('nom').value="";        
    document.getElementById('pre').value=""; 
    document.getElementById('sto').value="";
    $('#tip').val("Seleccione un Tipo de Producto");
    $('#con').val("Seleccione Condición");      
}
function Producto_id(id)
{
    $.ajax({
        data:{idProducto:id,accion:"CONSULTAR_ID"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data){
            document.getElementById('Enom').value=data.nombre;
            document.getElementById('Epre').value=data.precio;
            document.getElementById('Esto').value=data.stock;
            document.getElementById('Etip').value=data.id_tipo;
            document.getElementById('Econ').value=data.condicion;
            document.getElementById('idProducto').value=data.idproducto;
        }
    });
}
function Editar()
{
    $.ajax({
        data:retornarDatosEdi("MODIFICAR"),
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            if(data="OK")
            {
                $("#Editarproducto").modal('toggle');
                MostrarAlerta("Éxito", "Datos Actualizados con Éxito", "success");
            }
            else
            {
                MostrarAlerta("Error", data, "error");
            }
            $("#dtProducto").dataTable().fnDestroy();
            Consultar();
        }
    })
}
function Eliminar(id)
{
    $.ajax({
        data:{idProducto:id,condicion:"DESACTIVO",accion:"ELIMINAR"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            if(data!="OK")
            {
                MostrarAlerta("Error", data, "error");
            }
            $("#dtProducto").dataTable().fnDestroy();
            Consultar();
        }
    })
}
function retornarDatosEdi(accion)
{
    return{
        nom:document.getElementById('Enom').value,
        pre:document.getElementById('Epre').value,
        sto:document.getElementById('Esto').value,
        tip:document.getElementById('Etip').value,
        con:document.getElementById('Econ').value,
        accion:accion,
        IdProducto:document.getElementById('idProducto').value
    }
}
function MostrarAlerta(titulo, descripcion, tipoAlerta) {
    Swal.fire({
        title: titulo,
        text: descripcion,
        icon: tipoAlerta,
        color:'white',               
        iconColor:'##6592ff', 
        background:'#053871',
    });    
}
function MostrarAlertaE(id)
{
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
          confirmButton: 'btn btn-success',
          cancelButton: 'btn btn-danger'
        },
        buttonsStyling: false
      })
      
      swalWithBootstrapButtons.fire({
        title: 'ALERTA',
        text: "¿Esta seguro que quiere eliminar el registro?",
        icon: 'warning',
        color:'white',
        iconColor:'#6592ff',
        background:'#053871',
        showCancelButton: true,
        confirmButtonText: 'Si, Eliminar!',
        cancelButtonText: 'No, Cancelar!',
        reverseButtons: true
      }).then((result) => {
        if (result.isConfirmed) {
          swalWithBootstrapButtons.fire({
            title:'ELIMINADO',
            text:'Registro Eliminado con Éxito!',
            icon:'success',
            color:'white',
            iconColor:'#6592ff',
            background:'#053871',
        })
        Eliminar(id);
        } else if (
          /* Read more about handling dismissals below */
          result.dismiss === Swal.DismissReason.cancel
        ) {
          swalWithBootstrapButtons.fire({
            title:'CANCELADO',
            text:'Eliminación Cancelada!',
            icon:'error',
            color:'white',
            iconColor:'#6592ff',
            background:'#053871',
            })
        }
      })
}
function grid(){ 
    $('#dtProducto').dataTable( {
       destroy:true,
       language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        },
        dom:'Bfrtip',
        buttons:[
            'copy','csv','excel','pdf','print',
        ],      
        lengthMenu: [
            [5],
        ],
       paging: true,
       searching: true,
       ordering: false,
       info: true,
       autoWidth: false,
       responsive: true,     
    });   
}