<?php 
include "header.php"; 
                 
if (isset($_GET['actualizar'])){
      mysql_query("
      
    
      UPDATE `usuario` SET 
      `pass`= '".md5($_POST['pass'])."',
      `usuario`='".$_POST['email']."',
      `nombre`='".$_POST['nombre']."'
      WHERE id_usuario = ".$_GET['actualizar']."
      ", $conexion) or die(mysql_error());
    echo "<script>alert('Actualizado con exito!'); location.href ='?editar=".$_GET['actualizar']."'; </script>";    
}else{
    
    $queEmp = "SELECT * FROM `usuario` where id_usuario =  ".$_GET['editar']." ";	
    $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
    $rowEmp = mysql_fetch_assoc($resEmp);
           
    
    
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
    <h1>Editar usuarios</h1>
</center>
<form class="form-horizontal" action="?actualizar=<?php echo $_GET['editar']; ?>" method="post" enctype="multipart/form-data">
    <!-- Form Name -->
    <table width="100%" aling="center" border="0">
        <tr>
            <td>
                <center>
                    <!-- Text input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Nombre</label>
                        <div class="col-md-4">
                            <input id="usuario" name="nombre" type="text"  value="<?php echo  $rowEmp['nombre']; ?>" class="form-control input-md">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Usuario</label>
                        <div class="col-md-4">
                            <input id="email" name="email" type="text" value="<?php echo  $rowEmp['usuario']; ?>" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Password input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="pass">Nuevo Password</label>
                        <div class="col-md-4">
                            <input id="pass" name="pass" type="text" class="form-control input-md">
                        </div>
                    </div>
            
                    
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center>
                    <button type="submit" class="btn btn-success">Editar</button>
                </center>
            </td>
        </tr>
    </table>
</form>



<?php include "fotter.php"; ?>




