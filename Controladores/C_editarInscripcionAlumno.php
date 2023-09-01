<?php

        require('../Modelos/M_editarInscripcionAlumno.php');
        $materiaModelo = new InscripcionModel();
        $materiaModelo->updateInscripcionAlumno($_POST['nombre'],$_POST['apellido'],$_POST['materia'],$_POST['nuevaMateria']);
        require('../Vista/V_FormEditarInscripcionAlumno.php');

?>
