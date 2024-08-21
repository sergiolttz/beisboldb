<nav>
    <div class="contenedor">
        <a href="index.php">
            <div class="elemento-izquierda">
                <img src="img/home.jpg" width="40" height="40">
            </div>
        </a>
        <a href="ligas.php">
            <div class="elemento-izquierda elemento-izquierda-texto seleccionado">
                <img src="img/ligas.jpg" alt="Imagen 2" width="40" height="40">
                <span>Liga</span>
            </div>
        </a>
        <a href="equipos.php">
            <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/equipos.jpg" alt="Imagen 3" width="40" height="40">
                <span>Equipo</span>
            </div>
        </a>
        <a href="jugadores.php">
            <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/jugadores.jpg" alt="Imagen 4" width="40" height="40">
                <span>Jugador</span>
            </div>
        </a>
        <a href="logout.php" class="elemento-derecha">
            <div class="elemento-derecha-texto">
                <span>
                    <?php
                    include "cone.php";
                    $sql = "select * from t_ligas";
                    $resultado = mysqli_query($cone, $sql);
                    ?>
                </span>
                <img src="img/logout.jpg" width="40" height="40">
            </div>
        </a>

    </div>
</nav>