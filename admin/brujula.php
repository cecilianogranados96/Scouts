<?php 
include "header.php"; 
?>

<head>
    <style>
        body {
            padding-top: 100px;

        }

    </style>
</head>
<center>
    <h1>Brujula</h1>
    <hr>
</center>
<div class="container">
    <?php 
if (!isset($_GET['id_area'])){
      echo "<table class='table' border='2'> <tr> ";
            $queEmp = "SELECT * FROM `tipo_brujula` order by nombre ASC";	
            $resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
            $totEmp = mysql_num_rows($resEmp);	
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                 $porcentaje = mysql_query("SELECT SUM(porcentaje) as porcentaje FROM `area_x_brujula` WHERE `id_brujula` = ".$rowEmp['id_tipo']." and `cedula` = ".$_GET['cedula']." ", $conexion) or die(mysql_error());
                 $porcentaje = mysql_fetch_assoc($porcentaje);
                 echo "<td><center><h2><b>".$rowEmp['nombre']." ".$porcentaje['porcentaje']."%</h2> </center>";
                
                $resEmp1 = mysql_query("SELECT * FROM `area_brujula` order by id_area ASC", $conexion) or die(mysql_error());
                while ($rowEmp1 = mysql_fetch_assoc($resEmp1)) {
                    
                    $resEmp2 = mysql_query("SELECT * FROM `area_x_brujula` WHERE `id_area` =  ".$rowEmp1['id_area']." and `id_brujula` = ".$rowEmp['id_tipo']." and `cedula` = ".$_GET['cedula']." ", $conexion) or die(mysql_error());
                    
                    $rowEmp2 = mysql_fetch_assoc($resEmp2);
                    
                        if ($rowEmp2['porcentaje'] == ''){
                            $porcentaje = 0;
                            $url = "brujula.php?cedula=".$_GET['cedula']."&id_area=".$rowEmp1['id_area']."&id_brujula=".$rowEmp['id_tipo']."";
                            $boton = "btn btn-warning";
                        }else{
                            $porcentaje = $rowEmp2['porcentaje'];
                            $url = "brujula.php?cedula=".$_GET['cedula']."&id_area=".$rowEmp1['id_area']."&id_brujula=".$rowEmp['id_tipo']."&editar=1";
                            $boton = "btn btn-success";
                        }
                    
                        echo "<table class='table'>
                                <tr>
                                    <td>
                                        <center>
                                        <b>$porcentaje%</b><br>
                                        <a class='$boton' href='$url'>".$rowEmp1['nombre']."</a>
                                        </center>
                                    </td>
                                    </tr> 
                                </table>";
                   
                 
                }
                
                echo "</td>";
                
            }
        echo "</tr> </table> <hr>";
}else{    
if (!isset($_GET['editar']) ){ 
    if (isset($_GET['registrar'])){
         $insertar_registro = "
        INSERT INTO `area_x_brujula`(`id_area`, `id_brujula`, `cedula`, `porcentaje`) VALUES (
        '".$_GET['id_area']."',
        '".$_GET['id_brujula']."',
        '".$_GET['cedula']."',
        '".$_POST['porcentaje']."'); ";
         mysql_query($insertar_registro, $conexion) or die(mysql_error());
        echo '<script>location.href = "brujula.php?cedula='.$_GET['cedula'].'";</script>';
    }
    ?>
    <center>
        <form class="form-horizontal" action="brujula.php?cedula=<?php echo $_GET['cedula'];?>&id_area=<?php echo $_GET['id_area'];?>&id_brujula=<?php echo $_GET['id_brujula'];?>&registrar=1" method="post">
            <div class="form-group">
                <label class="col-md-4 control-label"><h4>Brujula</h4></label>
                <div class="col-md-4">
                    <?php 
        $resEmp = mysql_query("SELECT * FROM `tipo_brujula` where id_tipo = '".$_GET['id_brujula']."' ", $conexion) or die(mysql_error());
        $rowEmp = mysql_fetch_assoc($resEmp);
        echo "<center><h2><b>".$rowEmp['nombre']."</h2></center>";
      ?>
                </div>
            </div>


            <div class="form-group">
                <label class="col-md-4 control-label"><h4>Area</h4></label>
                <div class="col-md-4">
                    <?php 
        $resEmp = mysql_query("SELECT * FROM `area_brujula` where id_area = '".$_GET['id_area']."' ", $conexion) or die(mysql_error());
        $rowEmp = mysql_fetch_assoc($resEmp);
        echo "<center><h2><b>".$rowEmp['nombre']."</h2></center>";
      ?>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-4 control-label"><h4>Porcentaje</h4></label>
                <div class="col-md-4">
                    <input id="textinput" name="porcentaje" type="number" placeholder="Porcentaje de actividad" class="form-control input-md">
                </div>
            </div>
            <center>
                <input type="submit" value="Registrar" class="btn btn-success">
            </center>

        </form>
        <?php } else{  
            if (isset($_GET['editar1']) ){
                $editar_registro = " UPDATE `area_x_brujula` SET `porcentaje` = '".$_POST['porcentaje']."' WHERE `id_area`='".$_GET['id_area']."' and `id_brujula`='".$_GET['id_brujula']."' and `cedula`='".$_GET['cedula']."'";
                mysql_query($editar_registro, $conexion) or die(mysql_error());
                echo '<script>location.href = "brujula.php?cedula='.$_GET['cedula'].'";</script>';
            }
           $resEmp2 = mysql_query("SELECT * FROM `area_x_brujula` WHERE `id_area` =  ".$_GET['id_area']." and `id_brujula` = ".$_GET['id_brujula']." and `cedula` = ".$_GET['cedula']." ", $conexion) or die(mysql_error());
            $rowEmp2 = mysql_fetch_assoc($resEmp2);
    ?>
        <center>
            <form class="form-horizontal" action="brujula.php?cedula=<?php echo $_GET['cedula'];?>&id_area=<?php echo $_GET['id_area'];?>&id_brujula=<?php echo $_GET['id_brujula'];?>&editar=1&editar1=1" method="post">
                
                   <center>
                    <h2>Editar Porcentaje</h2>
                </center>
                <div class="form-group">
                    <label class="col-md-4 control-label"><h4>Porcentaje</h4></label>
                    <div class="col-md-4">
                        <input id="textinput" name="porcentaje" type="number" value="<?php echo $rowEmp2['porcentaje']; ?>" placeholder="Porcentaje de actividad" class="form-control input-md">
                    </div>
                </div>
                <center>
                    <input type="submit" value="Editar" class="btn btn-danger">
                </center>

            </form>
            <?php } 
} ?>
<br>
        </center>
    </center>
</div>

<?php include "fotter.php"; ?>
