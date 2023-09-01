<?php
    // session_start();
    // if (isset($_SESSION['nombre'])){
    // require("../Vista/V_NavBar.php");
    // require("Modelos/conexion.php");
    require ("Modelos/M_datos.php");
    $conexion = new ConexionBd();
    $datosAlumno = $conexion->obtenerAlumnos();
    $datosProfesor = $conexion->obtenerProfesores();
    $datosMaterias = $conexion->obtenerMaterias();
    $datosMateriasAlumno = $conexion->obtenerMateriasAlumno();
    $datosJoinMateriasAlumno = $conexion->obtenerJoinAlumnoMateria();
    $datosJoinMateriasProfesor = $conexion->obtenerJoinProfesorMateria();

    require("Vistas/V_datos.php");
    
// }
    
    

?>