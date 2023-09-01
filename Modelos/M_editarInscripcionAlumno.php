<?php

class InscripcionModel {
    private $conn;

    public function updateInscripcionAlumno($nombre, $apellido, $materia, $materiaNueva) {
        require("conexion.php");
        $query = "CALL editarMateriaAlumno(?,?,?,?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("ssss",$materia, $nombre, $apellido, $materiaNueva);
        $stmt->execute();
        header("Location: ../index.php");
        return $stmt->affected_rows;
    }
}
?>