<?php 

include "header.php"; 



if (isset($_GET['borrar'])){
    mysql_query("DELETE FROM `usuario_lista` WHERE `id_usuario` =  ".$_GET['borrar']." ", $conexion) or die(mysql_error());
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
    <h1>Bitacora</h1><hr>
</center>
<div class="container">
    
 
        <?php 
if (!isset($_GET['id_area'])){
            $queEmp = "SELECT * FROM `tipo_bitacora` order by id_tipo ASC";	
            $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            $totEmp = mysql_num_rows($resEmp);	
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                
                
                $porcentaje = mysql_query("SELECT SUM(porcentaje) as porcentaje FROM `bitacora` where cedula =  ".$_GET['cedula']."  and id_bitacora=".$rowEmp['id_tipo']." ", $conexion) or die(mysql_error());	
                $porcentaje = mysql_fetch_assoc($porcentaje);
                $porcentaje = ($porcentaje['porcentaje'] != "" ) ? $porcentaje['porcentaje'] : 0;
                
                
                
                
                 echo " <center><h2><b> ".$rowEmp['nombre']." - $porcentaje%</h2> </center>";
                
                echo "<table class='table' border='2'><tr>";
                $resEmp1 = mysql_query("SELECT * FROM `area_bitacora` order by id_area ASC", $conexion) or die(mysql_error());
                while ($rowEmp1 = mysql_fetch_assoc($resEmp1)) {
                    
                    
                    
                    
                        $porcentaje = mysql_query("SELECT SUM(porcentaje) as porcentaje FROM `bitacora` where cedula =  ".$_GET['cedula']."  and id_bitacora=".$rowEmp['id_tipo']." and area_bitacora=".$rowEmp1['id_area']."  ", $conexion) or die(mysql_error());	
                        $porcentaje = mysql_fetch_assoc($porcentaje);
                        $porcentaje = ($porcentaje['porcentaje'] != "" ) ? $porcentaje['porcentaje'] : 0;


                            echo "<td>
                                    <center>
                                     ".$porcentaje." %<br>
                                        <a class='btn btn-warning' href='bitacora.php?cedula=".$_GET['cedula']."&tipo_bitacora=".$rowEmp['id_tipo']."&id_area=".$rowEmp1['id_area']."'><span class='glyphicon glyphicon-edit'></span> ".$rowEmp1['nombre']."</a>
                                    </center></td> ";
                }
                echo "</tr></table> <hr>";
                
                
             
            }
    
}else{
        if (isset($_GET['registrar'])){
        
        $insertar_registro = "
        
        INSERT INTO `bitacora`(
        
        `id_bitacora`, `cedula`, `area_bitacora`, `nombre_reto`, `fecha`, `porcentaje`) VALUES (
        
        '".$_GET['tipo_bitacora']."',
        '".$_GET['cedula']."',
        '".$_GET['id_area']."',
        '".$_POST['nombre_reto']."',
        '".$_POST['fecha']."',
        '".$_POST['porcentaje']."'
        
        
        );
        
        ";
       mysql_query($insertar_registro, $conexion) or die(mysql_error());
            echo "<script>alert('Insertado con éxito');</script>";
       echo '<script>location.href = "bitacora.php?cedula='.$_GET['cedula'].'";</script>';
    }
    ?>  
    
    <center>
    <form class="form-horizontal" action="bitacora.php?cedula=<?php echo $_GET['cedula']; ?>&tipo_bitacora=<?php echo $_GET['tipo_bitacora']; ?>&id_area=<?php echo $_GET['id_area']; ?>&registrar=1" method="post">
<fieldset>

<!-- Form Name -->
<legend>Registro de retos</legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="selectbasic">Reto</label>
  <div class="col-md-4">
    <input id="textinput" name="nombre_reto" type="text" class="form-control input-md" required>
  </div>
</div>

    <div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Fecha</label>  
  <div class="col-md-4">
    <input id="textinput" name="fecha" type="date" value="<?php echo date("Y-m-d");?>" class="form-control input-md">

  </div>
</div>
    
    
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="textinput">Porcentaje</label>  
  <div class="col-md-4">
  <input id="textinput" name="porcentaje" type="number" placeholder="Porcentaje de actividad" class="form-control input-md" required>

  </div>
</div>
</fieldset>    
            <center>
                <input type="submit" value="Registrar" class="btn btn-success">
            </center>
</form>    

        
        
        
        
    <table class='table'>
        <tr>
            <td>
                <center>
                    <h2><b>Reto</b></h2>
                </center>
            </td>
            <td>
                <center>
                    <h2><b>Fecha</b></h2>
                </center>
            </td>
            <td>
                <center>
                    <h2><b>Porcentaje</b></h2>
                </center>
            </td>
        </tr>
        <?php           
        $resEmp3 = mysql_query("SELECT * FROM `bitacora` where cedula =  ".$_GET['cedula']."  and id_bitacora=".$_GET['tipo_bitacora']." and area_bitacora=".$_GET['id_area']."  ", $conexion) or die(mysql_error());	
        while ($rowEmp3 = mysql_fetch_assoc($resEmp3)) {
        
                echo "<tr>
                    <td><h4><center>".$rowEmp3['nombre_reto']."</center></h4></td>
                    <td><h4><center>".$rowEmp3['fecha']."</center></h4></td>
                    <td><h4><center>".$rowEmp3['porcentaje']." %</center></h4></td>
                </tr>";
        }    
        ?>
    </table>
        
        
        
        
    
    
    
<?php } ?>
     
</div>
<br>
<?php include "fotter.php"; ?>
