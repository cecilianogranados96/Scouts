<?php 
include "header.php"; 
if (isset($_GET['insertar'])){
    mysql_query("
    INSERT INTO `usuario`(
        `pass`, `usuario`, `nombre`
    ) VALUES (
        '".md5($_POST['pass'])."','".$_POST['usuario']."','".$_POST['nombre']."'
    )", $conexion) or die(mysql_error());
    echo "<script>alert('Insertado con exito!');</script>";    
}

if (isset($_GET['borrar'])){
    mysql_query("DELETE FROM `usuario` WHERE `id_usuario` =  ".$_GET['borrar']." ", $conexion) or die(mysql_error());
    echo "<script>alert('Borrado con exito!');</script>";
}
?>

<head>
    <style>
        body {
            padding-top: 100px;

        }
    </style>
</head>
<center>
    <h1>Nuevos usuarios</h1>
</center>
    <script>
        $('#collapseExample').hide();
        function mostrar(){
            $('#collapseExample').show();
        }
    </script>


<center>
  <a class="btn btn-success" onclick="mostrar();">
    Nuevo Usuario
  </a>
</center>
<div class="collapse" id="collapseExample">
    <br><br>
    <form class="form-horizontal" action="?insertar=1" method="post" enctype="multipart/form-data">
        <!-- Form Name -->
        <table width="100%" aling="center" border="0">
            <tr>
                <td>
                    <center>
                        <!-- Text input-->
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="usuario">Nombre</label>
                            <div class="col-md-4">
                                <input id="usuario" name="nombre" type="text" placeholder="" class="form-control input-md" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="usuario">Usuario</label>
                            <div class="col-md-4">
                                <input id="email" name="usuario" type="text" placeholder="" class="form-control input-md" required>
                            </div>
                        </div>
 
                        <div class="form-group">
                            <label class="col-md-4 control-label" for="pass">Password </label>
                            <div class="col-md-4">
                                <input id="pass" name="pass" type="password" placeholder="" class="form-control input-md" required>
                            </div>
                        </div>
                   
               
                    </center>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <center>
                        <button type="submit" class="btn btn-success">Enviar</button>
                    </center>
                </td>
            </tr>
        </table>
    </form>
    
</div>

<div class="container">
    <center>
        <h3>Usuarios</h3>
    </center>
    <table class="table table-striped">
        <thead>

            <tr>
                <th>
                    <center>Nombre</center>
                </th>
                <th>
                    <center>Usuario</center>
                </th>
                <th>
                    <center>Editar/Borrar</center>
                </th>
            </tr>
        </thead>
<?php 
            $queEmp = "SELECT * FROM `usuario`";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
			$totEmp = mysql_num_rows($resEmp);
			if ($totEmp> 0) {	
				while ($rowEmp = mysql_fetch_assoc($resEmp)) {

					echo "
                        <tr>
                            <td><center>".$rowEmp['nombre']."</center></td>
                            <td><center>".$rowEmp['usuario']."</center></td>
                            
                            <td>
                                <center>
                                   
                                    
                                    <a class='btn btn-warning' href='editar_usuario.php?editar=".$rowEmp['id_usuario']."'><span class='glyphicon glyphicon-edit'></span> Editar</a>
                                    <a class='btn btn-danger' href='?borrar=".$rowEmp['id_usuario']."' onclick=".'"'."javascript: return confirm('¿Estas seguro?');".'"'." ><span class='glyphicon glyphicon-delete'></span> Eliminar</a>
                                </center>
                            </td>
                        </tr>";            
				}
			}
?>


    </table>
   
</div>
<?php include "fotter.php"; ?>




