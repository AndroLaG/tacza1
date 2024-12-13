let ruta="../controladores/accesoControlador.php";

function Acceso()
{
    let usuario=document.getElementById('usu').value;
    let contrasena=document.getElementById('pass').value;

    if(usuario=="")
    {
        MostrarAlerta("ALERTA","Debe Ingresar un usuario","error");
        return;
    }
    if(contrasena=="")
    {
        MostrarAlerta("ALERTA","Debe Ingresar un password","error");
        return;
    }
    $.ajax({
        data:{usuario:usuario,contrasena:contrasena},
        url:ruta,
        type:'post',
        dataType:'json',

        success:function(data)
        {
            if(data=="OK")
            {
                window.location='../vistas/home.php';
            }
            else{
                MostrarAlerta("ALERTA",data,"error");
                document.getElementById('usu').value="";
                document.getElementById('pass').value="";
            }
            
        }
    });
}
function MostrarAlerta(titulo, descripcion, tipoAlerta) {
    Swal.fire({
        position: 'top-end',
        icon: tipoAlerta,
        title: titulo,
        text: descripcion, 
        color:'white',               
        iconColor:'#6592ff', 
        background:'#053871',       
        showConfirmButton: false,
        timer: 1500
    })
}
