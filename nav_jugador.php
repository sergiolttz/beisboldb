<nav>
    <div class="contenedor">
        <a href="index.php">
            <div class="elemento-izquierda">
                <img src="img/home.jpg" width="40" height="40">
            </div>
        </a>
        <a href="ligas.php">
            <div class="elemento-izquierda elemento-izquierda-texto">
                <img src="img/ligas.jpg" width="40" height="40">
                <span>Liga</span>
            </div>
        </a>
        <a href="equipos.php">
            <div class="elemento-izquierda elemento-izquierda-texto ">
                <img src="img/equipos.jpg" width="40" height="40">
                <span>Equipo</span>
            </div>
        </a>
        <a href="jugadores.php">
            <div class="elemento-izquierda elemento-izquierda-texto seleccionado">
                <img src="img/jugadores.jpg" width="40" height="40">
                <span>Jugador</span>
            </div>
        </a>
        <a href="logout.php" class="elemento-derecha">
            <div class="elemento-derecha-texto">
                <span>
                    <?php
                    include "cone.php";
                    $sql = "select * from t_equipos";
                    $resultado = mysqli_query($cone, $sql);
                    ?>
                </span>
                <img src="img/logout.jpg" width="40" height="40">
            </div>
        </a>

    </div>
</nav>