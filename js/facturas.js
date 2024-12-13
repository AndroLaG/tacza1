let ruta='../controladores/facturaControlador.php';

$(document).ready(function() {
    Consultar();        
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
                html+="<td>"+data.id_factura+"</td>";
                html+="<td>"+data.nom_cliente+"</td>";
                html+="<td>"+data.fecha+"</td>";
                html+="<td>"+data.subtotal+"</td>";
                html+="<td>"+data.igv+"</td>";
                html+="<td>"+data.total+"</td>";
                html+="<td>"+data.condicion+"</td>";
                html+="<td style='text-align:center'>";
                html+="<button class='btn btn-danger mx-2' onclick='factura_id("+data.id_factura+");'data-bs-toggle='modal' data-bs-target='#verfactura'><i class='fa fa-times-circle'></i></button>"
                html+="<button class='btn btn-primary' onclick='MostrarAlertaE(" + data.id_factura + ");'><i class='fa fa-search'></i></button>"
                html+="</td>";
                html+="</tr>";
            });
            document.getElementById('datos').innerHTML=html;
            grid();
        }
    });
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