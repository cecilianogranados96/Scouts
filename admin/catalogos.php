
<?php 
include "header.php"; 
?>

<div class="row">
    <div class="col-md-12 centered">
        <h3><span>Catalogos</span></h3>
    </div>
</div>
<hr class="colorgraph">

<center>

    <?php if(!isset($_GET['cat'])){ 
    //FORMATO NOMBRE_BASE => array(NOMBRE A DEPLEGAR,COLOR DEL BOTON)
    $catalogos = array(
        "alergia" => array("Alergias",       "success"), 
        "vacuna" => array("Vacunas",       "success"), 
        "enfermedad" => array("Enfermedades",       "success"), 
        
        "tipo_bitacora" => array("Bitacoras",       "danger"), 
        "area_bitacora" =>  array("Áreas Bitacoras",       "danger"), 
        
        
        "tipo_brujula" => array("Brújulas",       "info"), 
        "area_brujula" => array("Área Brújulas",       "info"), 
        
        "educacion" => array("Educación",       "warning"), 
        
        "tipo_especialidad" => array("Especialidades",       "primary"), 
        "reto_especialidad" => array("Retos Especialidad",       "primary"), 
        
        
        
    );
    ?>
    <h1>Catalogos</h1>
    <br><br>
    <div class="row">
        <div class='col-md-3'>
        </div>
        <div class='col-md-6'>
            <div class="row">
        <?php
            foreach( $catalogos as $campo => $datos_campo ){
                echo "<div class='col-md-4'>
                    <a href='?cat=$campo' class='btn btn-sq-lg btn-$datos_campo[1]''> $datos_campo[0]</a> <br><br>
                    </div>";         
            }
        ?>
            </div>
        </div>
</div>
    
    
    
    
    
       
        <?php 
            } else { 
                include "catalogos/".$_GET['cat'].".php";
            }
         
        ?>

</center>

