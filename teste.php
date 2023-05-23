<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form method="post">
  <label for="saque">Saque:</label>
  <input type="text" id="saque" name="saque" required>
  <br>
  <label for="url">Url:</label>
  <input type="url" id="url" name="url" required>
  <br>

  <input type="submit" value="Cadastrar">
</form>
    <?php
    require_once 'model/ColaboradorDAO.php';
    require_once 'model/Colaborador.php';
    
    // verifica se os dados foram enviados pelo formulário
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
      // obtém os dados do formulário
      $saque = $_POST['saque'];
      $url = $_POST['url'];
    
      // cria um novo objeto Usuario com os dados do formulário
      $colaborador = new Colaborador(true, 0, $saque, $url, "", "");
    
      var_dump($colaborador);

      // cria um novo objeto UsuarioDAO e insere o novo usuário no banco de dados
      $colaboradorDAO = new ColaboradorDAO();
      $colaborador = $colaboradorDAO->insert($colaborador);
    }

    // $usuarioDAO = new UsuarioDAO();
    // var_dump($usuarioDAO->selectByNome());
    ?>
</body>
</html>

