<br><br><br>
<div class="modal fade" id="Agregarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Agregar Productos</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close" onclick="limpiar();"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">
        <form>
            <div class="row">
                <div class="col-12">
                    <label class="col-form-label">Producto</label>
                    <input type="text" id="nom" class="form-control" onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class=" col-6">
                    <label class="col-form-label">Precio</label>
                    <input type="number" id="pre" class="form-control">
                </div>             
                <div class="col-6">
                    <label class="col-form-label">Stock</label>
                    <input type="number" id="sto" class="form-control">
                </div>
                <div class="col-6">
                    <label class="col-form-label">Tipo</label>
                    <select class="form-select mb-3" id="tip">               
                    </select>
                </div>           
                <div class="col-6">
                    <label class="col-form-label">Condición</label>
                    <select class="form-select mb-3" id="con">
                        <option selected>Seleccione Condición</option>
                        <option value="ACTIVO">ACTIVO</option>
                        <option value="DESACTIVO">DESACTIVO</option>               
                    </select>
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
<div class="modal fade" id="Editarproducto" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-primary">
        <h5 class="modal-title" id="exampleModalLabel">Editar Productos</h5>
        <button type="button" class="btn" data-bs-dismiss="modal" aria-label="Close" onclick="limpiar();"><i class='fa fa-times-circle' style="font-size: 20pt;"></i></button>
      </div>
      <div class="modal-body">
        <form id="form">
            <div class="row">
                <input type="hidden" id="idProducto" class="form-control">
                <div class="col-12">
                    <label class="col-form-label">Producto</label>
                    <input type="text" id="Enom" class="form-control" onkeyup="javascript:this.value=this.value.toUpperCase();">
                </div>
                <div class=" col-6">
                    <label class="col-form-label">Precio</label>
                    <input type="number" id="Epre" class="form-control">
                </div>             
                <div class="col-6">
                    <label class="col-form-label">Stock</label>
                    <input type="number" id="Esto" class="form-control">
                </div>
                <div class="col-6">
                    <label class="col-form-label">Tipo</label>
                    <select class="form-select" id="Etip">               
                    </select>
                </div>           
                <div class="col-6">
                    <label class="col-form-label">Condición</label>
                    <select class="form-select" id="Econ">
                        <option selected>Seleccione Condición</option>
                        <option value="ACTIVO">Activo</option>
                        <option value="DESACTIVO">Desactivo</option>               
                    </select>
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
