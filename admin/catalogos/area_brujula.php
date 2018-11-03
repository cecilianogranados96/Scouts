<?php

// Synapp Costa Rica
// Escrito Por: Jose Ceciliano

$catalogo = "area_brujula";
$llave = "id_area";
$columna_orden = "nombre";
// 
// FORMATO 
/* nombre_campo_de_base => array(
    "NOMBRE EN EL FORMULARIO", 
    "TIPO INPUT O TEXT",
    "1 SI ES DESPLEGABLE EN EL SELECT, 0 SI NO",
    "1 SI ES UN CAMPO OBLIGATORIO, 0 SI NO"
    );
*/
$campos = array(
    "nombre" =>                 array("Nombre",                     "Input",    1,1),
    "sintomas_medicamentos" =>  array("Sintomas de Medicamentos",   "Text",     0,1),
    "sintomas_picaduras" =>     array("Sintomas de Picaduras",      "Text",     0,1),
    "detalle_inyeccion" =>      array("Detalle de Inyecion",        "Text",     0,1)
);

//--------------------------------------NO TOCAR SIN PERMISO---------------------------------------------------------------//

if (isset($_GET["nuevo1"])) {
   $consulta = "INSERT INTO $catalogo (";
    foreach( $campos as $campo => $datos_campo ){
        $consulta .= "`$campo`,";         
    }
    $consulta = substr($consulta,0,-1);
    $consulta .= ") VALUES (";
    foreach( $campos as $campo => $datos_campo ){
        $consulta .= "'".$_POST[$campo]."',";         
    }
    $consulta = substr($consulta,0,-1);
    $consulta .= ");";    
    mysql_query($consulta,$conexion) or die('Consulta fallida: ' . mysql_error());
    echo "<script>alert('Insertado con éxito');</script>";
    echo '<script>location.href = "catalogos.php?cat='.$catalogo.'"</script>';
}

if (isset($_GET["eliminar"])) {
    $consulta = "DELETE FROM $catalogo WHERE $llave = ".$_GET["eliminar"]." ;";
    mysql_query($consulta,$conexion) or die('Consulta fallida: ' . mysql_error());
    echo "<script>alert('Eliminado con éxito');</script>";
    echo '<script>location.href = "catalogos.php?cat='.$catalogo.'"</script>';
}

if (isset($_GET["editar1"])) {
    $update_set = "";
    foreach( $campos as $campo => $datos_campo ){
        $update_set .= "`$campo`='".$_POST[$campo]."',";         
    }
    $update_set = substr($update_set,0,-1);
    $consulta = "UPDATE $catalogo SET $update_set WHERE $llave = ".$_GET["editar"]."";
    mysql_query($consulta,$conexion) or die('Consulta fallida: ' . mysql_error());
    echo "<script>alert('Actualizado con éxito');</script>";
    echo '<script>location.href = "catalogos.php?cat='.$catalogo.'"</script>';
}
?>

<div class="container">
    <center>
        <h1>
            Catalogo: <?php echo $catalogo; ?>
        </h1><br><br>
    </center>
<?php if ( !isset($_GET["nuevo"]) and !isset($_GET["editar"])  ) { ?>
<center>
    <h2>
        <a class="btn btn-success" href="?cat=<?php echo $catalogo; ?>&nuevo=1">Nuevo Registro</a>
    </h2>
<table class="table">
    <tr>
        <?php 
            foreach( $campos as $campo => $datos_campo ){
                if($datos_campo[2] == 1){
                   echo "<td>
                        <center>
                            $datos_campo[0]
                        </center>
                    </td>"; 
                }
            }
        ?>
        <td>
            <center>
                Editar
            </center>
        </td>
        <td>
            <center>
                Eliminar
            </center>
        </td>
    </tr>
    <?php         
    $resEmp = mysql_query("SELECT * FROM $catalogo order by $columna_orden", $conexion) or die(mysql_error());
    while ($row = mysql_fetch_assoc($resEmp)) {
        echo "<tr>";
        foreach( $campos as $campo => $datos_campo ){
                if($datos_campo[2] == 1){
                   echo "
                     <td>
                        <center>
                        ".($row[$campo])."
                        </center>
                    </td>"; 
                }
        }
        echo "
            <td>
                <center>
                    <a href='?cat=".$catalogo."&editar=".($row[$llave])."' class='btn btn-warning'>Editar</a>
                </center>
            </td>
            <td>
                <center>
                    <a href='?cat=".$catalogo."&eliminar=".($row[$llave])."' onclick='return confirmar()' class='btn btn-danger'>Eliminar</a>
                </center>
            </td>
        </tr>";
    }
?>
</table>
</center>
</div>
<?php } ?>
<?php if (isset($_GET["editar"])) { 
$datos = mysql_query("SELECT * FROM $catalogo where $llave = '".$_GET["editar"]."'",$conexion) or die('Consulta fallida: ' . mysql_error());
$datos = mysql_fetch_assoc($datos);
?>  
<div class="container">
    <center>
        <h2>Editar</h2> <br><br>
    <form class="form-horizontal" action="catalogos.php?cat=<?php echo $catalogo; ?>&editar=<?php echo $_GET["editar"]; ?>&editar1=1" method="post" >
        <?php      
            foreach( $campos as $campo => $datos_campo ){   
               if ($datos_campo[1] == 'Input'){
                   $input = "<input name='$campo' type='text' value='".$datos[$campo]."' class='form-control input-md'>";
               }else{
                    $input = "<textarea name='$campo' class='form-control input-md'>".$datos[$campo]."</textarea>";
               }
            echo "<div class='form-group'>
            <label class='col-md-4 control-label'>".$datos_campo[0]."</label>
            <div class='col-md-4'> $input </div>
        </div>";       
        }
        ?>
        <div class="form-group">
         <center>
                <button id="singlebutton" name="singlebutton" class="btn btn-success">Actualizar</button>
            </center>
        </div>
    </form>
    </center>
</div>
<?php }  ?>
<?php if (isset($_GET["nuevo"])) { ?>
<div class="container"> 
    <center>
         <h2>Nuevo</h2> <br><br>
    <form class="form-horizontal" action="catalogos.php?cat=<?php echo $catalogo; ?>&nuevo=<?php echo $_GET["nuevo"]; ?>&nuevo1=1" method="post" >
        <!-- Text input-->
        <?php      
            $requerido = "";
            foreach( $campos as $campo => $datos_campo ){
                if ($datos_campo[3] == 1){
                    $requerido = "required";
                }
               if ($datos_campo[1] == 'Input'){
                   $input = "<input name='$campo' type='text' class='form-control input-md' $requerido>";
               }else{
                  $input = "<textarea name='$campo' class='form-control input-md' $requerido></textarea>";
               }
            echo "
                <div class='form-group'>
            <label class='col-md-4 control-label'>".$datos_campo[0]."</label>
            <div class='col-md-4'>$input</div>
        </div>";       
        }
        ?>
        <div class="form-group">
         <center>
                <button id="singlebutton" name="singlebutton" class="btn btn-primary">Enviar</button>
            </center>
        </div>
    </form>
    </center>
</div>
<?php } ?>
<script>
function confirmar()
    {
        if(confirm('¿Estas seguro de eliminar este registro?'))
            return true;
        else
            return false;
    }
</script>