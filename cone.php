<?php

$cone = mysqli_connect("localhost", "root", "", "bd_beisbol");

if (isset($cone)) {
    echo "Conexion satisfactoria";
}
