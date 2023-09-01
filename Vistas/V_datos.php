<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <title>Document</title>
</head>
<body>
<?php
?>
  <div class="container mt-4">
    <h2>Tabla de Alumnos</h2>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Nlegajo</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellido</th>
          <th scope="col">DNI</th>
        </tr>
      </thead>
      <tbody>
      <?php
          while ($fila = mysqli_fetch_assoc($datosAlumno)){?>
        <tr>
          <th scope="row"><?php echo $fila["Nlegajo"];?></th>
          <td><?php echo $fila["nombre"];?></td>
          <td><?php echo $fila["apellido"];?></td>
          <td><?php echo $fila["DNI"];?></td>
        </tr>
        <?php } ?>


            <table class="table">
            
        <h2>Tabla de Profesores</h2>

      <thead>
        <tr>
          <th scope="col">Nlegajo</th>
          <th scope="col">Nombre</th>
          <th scope="col">Apellido</th>
          <th scope="col">DNI</th>
        </tr>
      </thead>
        <?php
          while ($fila = mysqli_fetch_assoc($datosProfesor)){?>
        <tr>
          <th scope="row"><?php echo $fila["Nlegajo"];?></th>
          <td><?php echo $fila["nombre"];?></td>
          <td><?php echo $fila["apellido"];?></td>
          <td><?php echo $fila["dni"];?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>

    <table class="table">
            
            <h2>Tabla de Materias</h2>
    
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Materia</th>
              <th scope="col">Horas</th>
              <th scope="col">Aula</th>
              <th scope="col">Duracion</th>

            </tr>
          </thead>
            <?php
              while ($fila = mysqli_fetch_assoc($datosMaterias)){?>
            <tr>
              <th scope="row"><?php echo $fila["id"];?></th>
              <td><?php echo $fila["nombreMateria"];?></td>
              <td><?php echo $fila["horas"];?></td>
              <td><?php echo $fila["aula"];?></td>
              <td><?php echo $fila["duracion"];?></td>
              <td>
                <a href="Vistas/V_FormEditarMateria.php?id=<?php echo $fila['id'];?>" class ="Link" target="_blank" rel="noopener noreferrer">MODIFICAR</a>
                </td>
            </tr>
            <?php } ?>
          </tbody>
        </table>


        <table class="table">
            
            <h2>Tabla de Inscripciones

            </h2>
    
          <thead>
            <tr>
              <th scope="col">Nombre</th>
              <th scope="col">Aula</th>
              <th scope="col">Duracion</th>
            </tr>
          </thead>
            <?php
              while ($fila = mysqli_fetch_assoc($datosMateriasAlumno)){?>
            <tr>
              <th scope="row"><?php echo $fila["nombre"];?></th>
              <td><?php echo $fila["aula"];?></td>
              <td><?php echo $fila["duracion"];?></td>

            </tr>
            <?php } ?>
          </tbody>
        </table>

        <table class="table">
            
            <h2>Tabla de Inscripciones Alumnos
              
            </h2>
    
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Nombre</th>
              <th scope="col">Materia</th>
              <th scope="col"></th>

            </tr>
          </thead>
            <?php
              while ($fila = mysqli_fetch_assoc($datosJoinMateriasAlumno)){?>
            <tr>
              <th scope="row"><?php echo $fila["id"];?></th>
              <td><?php echo $fila["nombre"];?></td>
              <td><?php echo $fila["nombreMateria"];?></td>
              <td><a href="Vistas/V_FormEditarInscripcionAlumno.php?nombreMateria=<?php echo $fila['nombreMateria'];?>" class="btn btn-secondary">Modificar</a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>

        <table class="table">
            
            <h2>Tabla de Profesores Materias
              
            </h2>
    
          <thead>
            <tr>
              <th scope="col">Id</th>
              <th scope="col">Nombre</th>
              <th scope="col">Materia</th>
            </tr>
          </thead>
            <?php
              while ($fila = mysqli_fetch_assoc($datosJoinMateriasProfesor)){?>
            <tr>
              <th scope="row"><?php echo $fila["id"];?></th>
              <td><?php echo $fila["nombre"];?></td>
              <td><?php echo $fila["nombreMateria"];?></td>
              <td><a href="Vistas/V_FormEditarProfesorMateria.php?nombreMateria=<?php echo $fila['nombreMateria'];?>" class="btn btn-secondary">Modificar</a></td>

            </tr>
            <?php } ?>
          </tbody>
        </table>
  </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>

</body>
</html>