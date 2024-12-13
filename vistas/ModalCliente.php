<br><br><br>
<div class="modal fade" id="Agregarcliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Clientes</h5>
        <button type="button" class="btn"  data-bs-dismiss="modal" aria-label="Close" onclick="limpiar();"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">
        <form id="formcliente">
            <div class="row">
                <div class="col-12">
                    <label class="col-form-label">Nombres</label>
                    <input type="text" class="form-control" id="nom" placeholder="Ingresar Nombres"  onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class="col-12">
                    <label class="col-form-label">Dirección</label>
                    <input type="text" class="form-control" id="dir" placeholder="Ingresar Dirección" onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class="col-12">
                    <label class="col-form-label">Telefono</label>
                    <input type="text" class="form-control" id="tel" placeholder="Ingresar Telefono" maxlength="9">
                </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="limpiar();">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="Agregar();">Guardar</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="Editarcliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Editar Clientes</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close" onclick="limpiar();"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">
        <form id="formcliente">
            <div class="row">
                <input type="hidden" id="idCliente" class="form-control">
                <div class="col-12">
                    <label class="col-form-label">Nombres</label>
                    <input type="text" class="form-control" id="Enom" placeholder="Ingresar Nombres"  onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class="col-12">
                    <label class="col-form-label">Dirección</label>
                    <input type="text" class="form-control" id="Edir" placeholder="Ingresar Dirección" onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class="col-12">
                    <label class="col-form-label">Telefono</label>
                    <input type="text" class="form-control" id="Etel" placeholder="Ingresar Telefono" maxlength="9">
                </div>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="limpiar();">Cancelar</button>
        <button type="button" class="btn btn-primary" onclick="Editar();">Guardar</button>
      </div>
    </div>
  </div>
</div>
<script src="../js/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
