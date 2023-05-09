<?php
require_once './model/UsuarioDAO.php';
require_once './model/Usuario.php';


$userDAO = new UsuarioDAO();

$result = $userDAO->select('na');
var_dump($result);