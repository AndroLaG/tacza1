let ruta='../controladores/facturaControlador.php';
var a=0;

$(document).ready(function(){
   Consultar(); 
   ConsultarP();
});

function Consultar()
{
    $.ajax({
        data:{accion:"CONSULTAR_CLIENTE"},
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
                html+="<button class='btn btn-primary mx-2' onclick='Cliente_id("+data.id_cliente+")';><i class='fa fa-plus-circle'></i></button>"                
                html+="</td>";
                html+="</tr>";
            });
            document.getElementById('datos').innerHTML=html;
            grid();
        }
    });
}
function Cliente_id(id)
{
    $.ajax({
        data:{idCliente:id,accion:"CLIENTE_CONSULTAR_ID"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            document.getElementById('cli').value=data.nom_cliente;
            document.getElementById('dir').value=data.direccion;
            document.getElementById('tel').value=data.telefono;
            document.getElementById('idCliente').value=data.id_cliente;
            $("#Aclientefactura").modal('toggle');
            Fecha();            
        }
    });
}
function Fecha()
{
    let hoy = new Date();

    let dia = hoy.getDate();
    let mes = hoy.getMonth() + 1;
    let agnio = hoy.getFullYear();

    dia = ('0' + dia).slice(-2);
    mes = ('0' + mes).slice(-2);
    
    let fe = dia + "/" + mes + "/" + agnio;
    document.getElementById('fec').value=fe;
}
function ConsultarP()
{
    $.ajax({
        data:{accion:"CONSULTAR_PRODUCTO"},
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
                html+="<td style='text-align:center'>";
                html+="<button class='btn btn-primary mx-2' onclick='Producto_id("+data.idproducto+")';><i class='fa fa-plus-circle'></i></button>"
                html+="</td>";
                html+="</tr>";
                a++;
            });
            document.getElementById('datosP').innerHTML=html;
            grid2();
        }
    });
}
function Producto_id(id)
{
    $.ajax({
        data:{idProducto:id,accion:"PRODUCTO_CONSULTAR_ID"},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            $("#Aproductofactura").modal('toggle');
            document.getElementById('idProducto').value=id;
            document.getElementById('pro').value=data.nombre;
            document.getElementById('pre').value=data.precio; 
            document.getElementById('can').disabled=false;         
            document.getElementById('can').focus();
        }
    });
}
function seleccionar_pro()
{      
    let p=document.getElementById('pre').value;      
    let c=document.getElementById('can').value;
    let st=p*c;
    if(p!="")
    {
        let html;            
        html+="<tr>";
        html+="<td>"+document.getElementById('idProducto').value+"</td>";
        html+="<td>"+document.getElementById('pro').value+"</td>";
        html+="<td style='text-align:right'>"+p+"</td>";                
        html+="<td style='text-align:right'>"+c+"</td>";
        html+="<td style='text-align:right'>"+st+"</td>";                 
        html+="<td style='text-align:center'>";
        html+="<button class='btn btn-danger mx-2' onclick='Eliminar(document.getElementById('idProducto').value)';><i class='fa fa-trash'></i></button>"
        html+="</td>";                
        html+="</tr>";
        $('#datosprod').append(html);
        sumatoria();
        document.getElementById('pro').value="";
        document.getElementById('pre').value="";
        document.getElementById('can').value="";
        document.getElementById('can').disabled=true; 
    }
    else
    {
        MostrarAlerta("Error", "Debe Seleccionar un Producto", "error");
    }
}
function sumatoria()
{
    let sum=0;
    let st=0;
    let igv=0;
    let tot=0;
    $('#datosprod tr').each(function(){        
        let pre=parseFloat($(this).find('td').eq(2).text());
        let cant=$(this).find('td').eq(3).text();
        st=pre*cant;        
        sum+=st;
    });
    igv=sum*0.19;
    tot=sum+igv;
    document.getElementById('stotal').value=sum;
    document.getElementById('igv').value=igv;
    document.getElementById('total').value=tot;
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
        lengthMenu: [
            [5],
        ],
       paging: true,
       searching: true,
       lengthChange: false,
       ordering: false,
       info: true,
       autoWidth: false,
       responsive: true,    
    });     

}
function grid2(){ 
    $('#dtProducto').dataTable( {
       destroy:true,
       language: {
            "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Spanish.json"
        },            
        lengthMenu: [
            [5],
        ],
       paging: true,
       searching: true,
       lengthChange: false,
       ordering: false,
       info: true,
       autoWidth: false,
       responsive: true,    
    });     

}