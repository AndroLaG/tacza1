<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="home.php" class="brand-link" style="background-color:#F67C69;">
      <img src="../dist/img/letra-r.png" alt="SisVentas" class="brand-image img-circle elevation-3" style="opacity: .8">
      <span class="brand-text font-weight-light">REDSERVCOM</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar" >
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex" >        
        <div class="info" style="color: white;">
        <h3 style="text-align: center;">USUARIO</h3><br> 
        <h6><?php echo $_SESSION["usuario"]; ?></h6>              
        </div>        
      </div>        
      <!-- Sidebar Menu -->
      <?php
      if($_SESSION['perfil']==1)
      {
        ?>
          <nav class="mt-2" >
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" >
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="home.php" class="nav-link">
              <i class="nav-icon fas fa-home" style="font-size: 16pt;"></i>
              <p>
                Home                               
              </p>
            </a>      
          </li>
          <li class="nav-item">
            <a href="clientes.php" class="nav-link">
              <i class="nav-icon fas fa-user-tie" style="font-size: 16pt;"></i>
              <p>
                Clientes                               
              </p>
            </a>      
          </li>
          <li class="nav-item">
            <a href="productos.php" class="nav-link">
              <i class="nav-icon fab fa-product-hunt" style="font-size: 16pt;"></i>
              <p>
                Productos                
              </p>
            </a>            
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-columns" style="font-size: 16pt;"></i>
              <p>
                Categorias                
              </p>
            </a>            
          </li> 
          <li class="nav-item">
            <a href="facturas.php" class="nav-link">
              <i class="nav-icon fas fa-file-invoice" style="font-size: 16pt;"></i>
              <p>
                Facturación                
              </p>
            </a>
          </li> 
          <li class="nav-item">
            <a href="" class="nav-link">
              <i class="nav-icon fas fa-user-lock" style="font-size: 16pt;"></i>
              <p>
                Usuarios               
              </p>
            </a>
          </li> 
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-users-cog" style="font-size: 16pt;"></i>
              <p>
                Perfiles                
              </p>
            </a>            
          </li>                                   
        </ul>
      </nav>    
      <?php
      }
      if($_SESSION['perfil']==2)
      {
        ?>
            <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="home.php" class="nav-link">
              <i class="nav-icon fas fa-home" style="font-size: 16pt;"></i>
              <p>
                Home                               
              </p>
            </a>      
          </li>
          <li class="nav-item">
            <a href="clientes.php" class="nav-link">
              <i class="nav-icon fas fa-user-tie" style="font-size: 16pt;"></i>
              <p>
                Clientes                               
              </p>
            </a>      
          </li>
          <li class="nav-item">
            <a href="productos.php" class="nav-link">
              <i class="nav-icon fab fa-product-hunt" style="font-size: 16pt;"></i>
              <p>
                Productos                
              </p>
            </a>            
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-columns" style="font-size: 16pt;"></i>
              <p>
                Categorias                
              </p>
            </a>            
          </li> 
          <li class="nav-item">
            <a href="facturas.php" class="nav-link">
              <i class="nav-icon fas fa-file-invoice" style="font-size: 16pt;"></i>
              <p>
                Facturación                
              </p>
            </a>
          </li>         
         </ul>
      </nav>  
        <?php
      }
      ?>
      
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  


