function salir()
{
    Swal.fire({
        title: 'Salida del Sistema',
        text: "¿Esta Seguro que quiere salir del Sistema?",
        icon: 'question',
        color:'white',
        iconColor:'#6592ff',
        background:'#053871',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Si,Deseo salir!'
      }).then((result) => {
        if (result.isConfirmed) {
          Swal.fire(
            'Hasta Pronto!',
            'Gracias por Visitarnos',
            'success'
          );
          window.location='../salir.php?s=1';
        }
      })
}
