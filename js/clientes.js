let ruta='../controladores/clienteControlador.php';

$(document).ready(function(){
   Consultar(); 
});

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
                html+="<td>"+data.id_cliente+"</td>";
                html+="<td>"+data.nom_cliente+"</td>";
                html+="<td>"+data.direccion+"</td>";
                html+="<td>"+data.telefono+"</td>";
                html+="<td style='text-align:center'>";
                html+="<button class='btn btn-success' onclick='Cliente_id("+data.id_cliente+");'data-bs-toggle='modal' data-bs-target='#Editarcliente'><i class='fa fa-edit'></i></button>"
                html+="<button class='btn btn-danger' onclick='MostrarAlertaE(" + data.id_cliente + ");'><i class='fa fa-trash'></i></button>"
                html+="</td>";
                html+="</tr>";
            });
            document.getElementById('datos').innerHTML=html;
            grid();
        }
    });
}
function limpiar()
{
    document.getElementById('nom').value="";
    document.getElementById('dir').value="";
    document.getElementById('tel').value="";
}
function Agregar()
{
    let nom=document.getElementById('nom').value;
    let dir=document.getElementById('dir').value;
    let tel=document.getElementById('tel').value;

    if(nom=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar un Nombre", "error");
        return;
    }
    if(dir=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar una Dirección", "error");
        return;
    }
    if(tel=="")
    {
        MostrarAlerta("ALERTA", "Debe Ingresar un Telefono", "error");
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
                $("#Agregarcliente").modal('toggle');
                MostrarAlerta("Éxito", "Datos Guardados con Éxito", "success");
            }
            else{
                MostrarAlerta("Error", data, "error");
            }
            limpiar();
            $("#dtCliente").dataTable().fnDestroy();              
            Consultar()
        }
    });
}
function retornarDatos(accion)
{
    return{
        nom:document.getElementById('nom').value,
        dir:document.getElementById('dir').value,
        tel:document.getElementById('tel').value,
        accion:accion
    }
}
function Cliente_id(id)
{
    $.ajax({
        data:{idCliente:id,accion:"CONSULTAR_ID"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            document.getElementById('Enom').value=data.nom_cliente;
            document.getElementById('Edir').value=data.direccion;
            document.getElementById('Etel').value=data.telefono;
            document.getElementById('idCliente').value=data.id_cliente;
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
            if(data=="OK")
            {
                $("#Editarcliente").modal('toggle');
                MostrarAlerta("Éxito", "Datos Actualizados con Éxito", "success");
            }
            else{
                MostrarAlerta("Error", data, "error");
            }
            limpiar();
            $("#dtCliente").dataTable().fnDestroy();              
            Consultar()
        }
    })
}
function retornarDatosEdi(accion)
{
    return{
        nom:document.getElementById('Enom').value,
        dir:document.getElementById('Edir').value,
        tel:document.getElementById('Etel').value,
        accion:accion,
        idCliente:document.getElementById('idCliente').value
    }
}
function Eliminar(id)
{
    $.ajax({
        data:{idCliente:id,accion:"ELIMINAR"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            if(data=="OK")
            {                
            }
            else{
                MostrarAlerta("Error", data, "error");
            }
            $("#dtCliente").dataTable().fnDestroy();
            Consultar();
        }
    })
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
function grid(){ 
    $('#dtCliente').dataTable( {
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

