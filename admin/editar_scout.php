<?php 
include "header.php"; 
if (isset($_GET['actualizar'])){
    mysql_query("
      UPDATE `usuario_lista` SET 
        `nombre`='".$_POST['nombre']."',
        `numero`='".$_POST['numero']."',
        `direccion`='".$_POST['direccion']."',
         `nombre_contacto`='".$_POST['nombre_contacto']."'  
        WHERE id_usuario = ".$_GET['actualizar']."
        ", $conexion) or die(mysql_error());
     echo "<script>alert('Actualizado con exito!'); location.href ='?editar=".$_GET['actualizar']."'; </script>";    
}else{
    $queEmp = "SELECT * FROM `usuario_lista` where id_usuario =  ".$_GET['editar']." ";	
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
    <h1>Editar clientes</h1>
    
            <table>
            <tr>
                <td>
                    <a onclick="window.history.back();" href="#" class="btn btn-info">Regresar</a>
                </td>
                <td>
                    <a href="orden.php" class="btn btn-danger">Orden Cliente</a>
                </td>
            </tr>
        </table>
    
    
</center>
<br>
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
                            <input id="usuario" name="nombre" type="text" value="<?php echo  $rowEmp['nombre']; ?>" class="form-control input-md">
                        </div>
                    </div>

          
            
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Nombre del contacto</label>
                        <div class="col-md-4">
                            <input name="nombre_contacto" type="tel" value="<?php echo  $rowEmp['nombre_contacto']; ?>" class="form-control input-md">
                        </div>
                    </div>                    
                    
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="usuario">Numero telefonico</label>
                        <div class="col-md-4">
                            <input id="usuario" name="numero" type="tel" value="<?php echo  $rowEmp['numero']; ?>" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Password input-->
                    <div class="form-group">
                        <label class="col-md-4 control-label" for="pass">Direccion </label>
                        <div class="col-md-4">
                            <input id="dereccion" name="direccion" type="text" value="<?php echo  $rowEmp['direccion']; ?>" class="form-control input-md">
                        </div>
                    </div>
                    <!-- Text input-->
                </center>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <center> <button type="submit" class="btn btn-success">Editar</button></center>
            </td>
        </tr>
    </table>
</form>


<br>
<?php include "fotter.php"; ?>
