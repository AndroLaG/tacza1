<br><br><br>
<div class="modal fade" id="Aclientefactura" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Seleccionar Cliente</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">            
          <table id="dtCliente" class="table table-bordered table-striped table-hover">
                  <thead>
                      <tr>
                          <th>CÓDIGO</th>
                          <th>NOMBRES</th>
                          <th>DIRECCIÓN</th>
                          <th>TELEFONO</th>
                          <th></th>
                      </tr>
                  </thead>
                  <tbody id="datos"></tbody>
          </table>               
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="Aproductofactura" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-xl">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Seleccionar Productos</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">            
      <table id="dtProducto" class="table table-bordered table-striped table-hover">
          <thead>
              <tr>
                  <th>CODIGO</th>
                  <th>NOMBRE</th>
                  <th>PRECIO</th>
                  <th>STOCK</th>
                  <th></th>
              </tr>
          </thead>
          <tbody id="datosP"></tbody>
      </table>               
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>