<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Béisbol Venezolano</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <header>
        <div class="container">
            <img src="img/logo.png" class="logo">
            <h1> Base de datos del beisbol venezolano</h1>
        </div>
    </header>

    <?php
    include "nav_jugador.php";
    session_start();
    $permiso = $_SESSION['nivel_permiso'];
    ?>
    <?php
    $sql = "SELECT j.*, e.nombre_equipo, e.ruta_img_equipo
                FROM t_jugadores j
                INNER JOIN t_equipos e ON j.id_equipo = e.id_equipo";

    $sql_total = "SELECT COUNT(*) AS total FROM t_jugadores";
    $resultado_total = mysqli_query($cone, $sql_total);
    $row_total = mysqli_fetch_assoc($resultado_total);
    $total_registros = $row_total['total'];
    $registros_por_pagina = 15;
    $total_paginas = ceil($total_registros / $registros_por_pagina);
    $pagina_actual = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
    $inicio = ($pagina_actual - 1) * $registros_por_pagina;
    $sql .= " LIMIT $inicio, $registros_por_pagina";
    $resultado = mysqli_query($cone, $sql);
    ?>
    <main>
        <div class="container">
            <h2>Todos los jugadores</h2>
            <section class="tabla-container">
                <table>
                    <thead>
                        <tr>
                            <th></th>
                            <th>Nombre</th>
                            <th>Equipo</th>
                            <th>Fecha de nacimiento</th>
                            <th>Nacionalidad</th>
                            <th>Posición</th>
                            <?php
                            if ($permiso >= 2) {
                                echo '<th>Acciones</th>';
                            }
                            ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = mysqli_fetch_assoc($resultado)) { ?>
                            <tr>
                                <td>
                                    <a href="jugador.php?id=<?php echo $row["id_jugador"]; ?>">
                                        <b><?php echo $row["numero"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <a href="jugador.php?id=<?php echo $row["id_jugador"]; ?>">
                                        <b><?php echo $row["nombre_jugador"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <a href="equipo.php?id=<?php echo $row["id_equipo"]; ?>">
                                        <img src="<?php echo $row["ruta_img_equipo"]; ?>" width="20" height="20">
                                        <b><?php echo $row["nombre_equipo"]; ?></b>
                                    </a>
                                </td>
                                <td>
                                    <?php echo $row["fecha_nacimiento_jugador"]; ?>
                                </td>
                                <td>
                                    <img src="img/banderas/<?php echo strtolower($row['nacionalidad_jugador']) . '.png'; ?>" height="20" alt="<?php echo $row_jugadores['nacionalidad_jugador']; ?>">
                                </td>
                                <td>
                                    <?php echo $row["posicion"]; ?>
                                </td>
                                <?php
                                if ($permiso == 2) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_jugador.php?id=' . $row["id_jugador"] . '">
                                            <img src="img/editar_jugador.jpg">
                                            </a>
                                            </td>';
                                }
                                if ($permiso == 3) {
                                    echo '<td class="botones-tarjeta">
                                            <a href="editar_jugador.php?id=' . $row["id_jugador"] . '">
                                            <img src="img/editar_jugador.jpg">
                                            </a>
                                            <a href="eliminar_jugador.php?id=' . $row["id_jugador"] . '">
                                            <img src="img/eliminar_jugador.jpg">
                                            </a>
                                            </td>';
                                }
                                ?>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
                <div class='paginacion'>
                    <?php
                    for ($i = 1; $i <= $total_paginas; $i++) {
                        echo "<a href='?pagina=$i'";
                        if ($i == $pagina_actual) {
                            echo " class='activo'";
                        }
                        echo ">$i  </a>";
                    }
                    ?>
                </div>
            </section>
        </div>
        <div class="contenedor">
            <?php
            if ($permiso >= 2) {
                echo '<a href="insertar_jugador.php">
                    <div class="button-container button-container-texto">
                    <img src="img/insertar_jugador.jpg" width="40" height="40">
                    <span>Insertar jugador</span>
                    </div>
                    </a>';
            }
            ?>
        </div>

    </main>
    <footer>
        <div class="container">
            <p>&copy; 2024 Beisbol DB</p>
        </div>
    </footer>
</body>

</html>