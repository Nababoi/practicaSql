<?php

    class ConexionBd{
        private $conn;

        public function obtenerAlumnos(){
            require ("conexion.php");
            $query = "SELECT * FROM alumno";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $resultado = $stmt->get_result();
            return $resultado;
    }

    public function obtenerProfesores(){
        require ("conexion.php");
        $query = "SELECT * FROM profesor";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return $resultado;
}
    public function obtenerMaterias(){
        require ("conexion.php");
        $query = "SELECT * FROM materia";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return $resultado;
    }
    public function obtenerMateriasAlumno(){
        require ("conexion.php");
        $query = "select a.nombre,m.aula, m.duracion from alumno a
        join alumnomateria am on a.Nlegajo = am.idAlumno
        join materia m on am.idMateria = m.id";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return $resultado;
    }

    public function obtenerJoinAlumnoMateria(){
        require ("conexion.php");
        $query = "select am.id,a.nombre, m.nombreMateria from alumno a
        join alumnomateria am on a.Nlegajo = am.idAlumno 
        join materia m on m.id = am.idMateria;";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return $resultado;
    }
    public function obtenerJoinProfesorMateria(){
        require ("conexion.php");
        $query = "select am.id,p.nombre, m.nombreMateria from profesor p
        join profesormateria am on p.Nlegajo = am.idProfesor 
        join materia m on m.id = am.idMateria;";
        $stmt = $conn->prepare($query);
        $stmt->execute();
        $resultado = $stmt->get_result();
        return $resultado;
    }
}
    
?>