<?php
session_start();
    $host = "localhost";
    $contrasena ="";
    $usuario = "root";
    $base ="guia2";

   
    /*******************************************/

    $conexion = mysql_connect("$host","$usuario","$contrasena");
    mysql_select_db("$base",$conexion);	
    mysql_query ("SET NAMES 'utf8'");

    date_default_timezone_set('America/Costa_Rica');

    function numero($cantidad)
    {
       return "₡".number_format($cantidad,2);
    }

?>            