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
<div class="container">
<center>
    <h1>Reportes</h1>
</center>
    <table class="table table-striped ">
        <thead>

            <tr>
                <th>
                    <center>Cedula</center>
                </th>
             
                 <th>
                    <center>Nombre</center>
                </th>
                
                <th>
                    <center>Bitacora</center>
                </th>
                <th>
                    <center>Brujula</center>
                </th>
                <th>
                    <center>Especialidad</center>
                </th>
                
                
                <th>
                    <center>Editar/Borrar</center>
              
                    
                </th>
            </tr>
        </thead>
        
     <?php 
            $queEmp = "SELECT * FROM `persona` order by nombre ASC";	
			$resEmp = mysql_query($queEmp, $conexion) or die(mysql_error());
			$totEmp = mysql_num_rows($resEmp);	
            while ($rowEmp = mysql_fetch_assoc($resEmp)) {
                        echo "
                        <tr>
                            <td><center>".$rowEmp['cedula']."</center></td>
                            <td><center>".$rowEmp['nombre']."</center></td>  
                        ";
                        //BITACORA
                        echo "<td> <table class='table' border=2> ";
                        $resEmpb = mysql_query("SELECT * FROM `tipo_bitacora` order by id_tipo ASC", $conexion) or die(mysql_error());
                        while ($rowEmpb = mysql_fetch_assoc($resEmpb)) {
                            $porcentaje = mysql_query("SELECT (SUM(porcentaje)/6) as porcentaje FROM `bitacora` where cedula =  ".$rowEmp['cedula']."  and id_bitacora=".$rowEmpb['id_tipo']." ", $conexion) or die(mysql_error());	
                            $porcentaje = mysql_fetch_assoc($porcentaje);
                            $porcentaje = ($porcentaje['porcentaje'] != "" ) ? $porcentaje['porcentaje'] : 0;
                            $clase = ($porcentaje >= 100) ? "class='btn-success'" : "class=''";
                            echo " <tr><td $clase><center> ".$rowEmpb['nombre']."</center></td><td $clase>".round($porcentaje,2)."%</td></tr>";
                        }
                        echo "</table>";
            
                        //BRUJULA
                        echo "<td> <table class='table' border=2> ";
                        $resEmpbrujula = mysql_query("SELECT * FROM `tipo_brujula` order by nombre ASC", $conexion) or die(mysql_error());
                        while ($rowEmpbrujula = mysql_fetch_assoc($resEmpbrujula)) {
                             $porcentaje = mysql_query("SELECT (SUM(porcentaje)/12) as porcentaje FROM `area_x_brujula` WHERE `id_brujula` = ".$rowEmpbrujula['id_tipo']." and `cedula` = ".$rowEmp['cedula']." ", $conexion) or die(mysql_error());
                             $porcentaje = mysql_fetch_assoc($porcentaje);
                             $clase = ($porcentaje['porcentaje'] >= 100) ? "class='btn-success'" : "class=''";
                             echo "<tr><td $clase><center> ".$rowEmpbrujula['nombre']."</center></td><td $clase>".round($porcentaje['porcentaje'],2)."%</td></tr>";
                        }
                        echo "</tr></table>";
                        //ESPECIALIDAD
                        echo "<td> <table class='table' border=2>";
                        $resEmpes = mysql_query("SELECT * FROM `tipo_especialidad` order by id_tipo", $conexion) or die(mysql_error());	
                        while ($rowEmpes = mysql_fetch_assoc($resEmpes)) {
                            $resEmptipo = mysql_query("SELECT COUNT(id_reto) total_es FROM `reto_especialidad` where id_tipo=".$rowEmpes['id_tipo']." ", $conexion) or die(mysql_error());	
                            $rowEmptipo = mysql_fetch_assoc($resEmptipo);
                            $resEmp3 = mysql_query("SELECT COUNT(cedula) as total FROM `especialidad` where cedula =  ".$rowEmp['cedula']." and tipo=".$rowEmpes['id_tipo']." ", $conexion) or die(mysql_error());	
                                while ($rowEmp3 = mysql_fetch_assoc($resEmp3)) {
                                    $total = ($rowEmp3['total'] != "") ? $rowEmp3['total'] : 0;
                                    $clase = ($total >= $rowEmptipo['total_es']) ? "class='btn-success'" : "class=''";
                                    echo " <tr><td $clase ><center> ".$rowEmpes['nombre']."</center></td><td $clase><b>$total de ".$rowEmptipo['total_es']."</b></td></tr>";
                                }    
                        } 
                        echo "</tr></table>";
                
                
                        echo "<td>
                        <center>
                            <a class='btn btn-info' href='historial.php?ced=".$rowEmp['cedula']."' target='_blank'><span class='glyphicon glyphicon-edit'></span>Historial médico</a>
                        </center>
                        </td>
                        </tr>";
                }
?>        
        
        
      <br><br><br>  
    </table>
</div>
<br>


<?php 
include "fotter.php"; 
?>