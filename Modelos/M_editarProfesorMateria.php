<?php

class InscripcionProfesorModel {
    private $conn;

    public function updateInscripcionProfesor($nombre,$materia, $apellido, $materiaNueva) {
        require("conexion.php");
        $query = "CALL EditarMateriaProfesor(?,?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("ssss",$nombre,$materia, $apellido, $materiaNueva);
        $stmt->execute();
        header("Location: ../index.php");
        return $stmt->affected_rows;
    }
}
?>