<?php

class MateriaModel {
    private $conn;

    public function updateMateria($horas, $duracion, $materiaId) {
        require("conexion.php");
        $query = "UPDATE materia SET horas = ?, duracion = ? WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("sss",$horas, $duracion, $materiaId);
        $stmt->execute();
        header("Location: ../index.php");
        return $stmt->affected_rows;
    }
}
?>