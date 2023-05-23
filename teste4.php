<?php
require_once './model/ColaboradorDAO.php';
require_once './model/Colaborador.php';


$colaboradorDAO = new ColaboradorDAO();
$colaborador = new Colaborador();

$colaborador  = $colaboradorDAO->selectById(1);

var_dump(json_encode($colaborador));

// $result['result'] = false;
// $result['quant'] = 0;
// $result['dados'] = [];

// if($consulta){
//     $result['result'] = true;
//     $result['quant'] = sizeof($consulta);
//     $result['dados'] = $consulta;
// }

// echo json_encode($result);

// var_dump(new Colaborador(true));