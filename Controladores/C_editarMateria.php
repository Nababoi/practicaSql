<?php

        require('../Modelos/M_modificarDatos.php');
        $materiaModelo = new MateriaModel();
        $materiaModelo->updateMateria($_POST['horas'],$_POST['duracion'],$_POST['id']);
        require('../Vista/V_FormEditarMateria.php');


?>
