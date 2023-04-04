<?php

require_once "back-end/model/Usuario.php";

$usuario = new Usuario(1,"camargo@gmail.com");
$usuario->setTel('55(14)8889-7765');

 var_dump($usuario->getTel());