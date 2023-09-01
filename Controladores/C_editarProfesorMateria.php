<?php

        require('../Modelos/M_editarProfesorMateria.php');
        $materiaModelo = new InscripcionProfesorModel();
        $materiaModelo->updateInscripcionProfesor($_POST['nombre'],$_POST['materia'],$_POST['apellido'],$_POST['nuevaMateria']);
        require('../Vista/V_FormEditarInscripcionAlumno.php');

?>
