<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Materia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h2>Editar Materia</h2>
        <form action="../Controladores/C_editarMateria.php" method="POST">
            <div class="mb-3">
                <label for="horas" class="form-label">Cantidad de Horas</label>
                <input type="number" class="form-control" id="horas" name="horas" required>
            </div>
            <div class="mb-3">
                <label for="duracion" class="form-label">Duración</label>
                <select class="form-select" id="duracion" name="duracion" required>
                    <option value="Anual">Anual</option>
                    <option value="Cuatrimestral">Cuatrimestral</option>
                </select>
            </div>
            <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
            <button type="submit" class="btn btn-primary">Actualizar Materia</button>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
