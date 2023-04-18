<?php
require_once 'DataBase.php';
require_once 'Usuario.php';
class UsuarioDAO
{
    private $pdo;

    public function __construct()
    {
        try {
            $this->pdo = (new DataBase())->connection();
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            throw new Exception('Erro ao conectar com o banco de dados: ' . $e->getMessage());
        }
    }

    public function insert(Usuario $usuario)
    {
        $stmt = $this->pdo->prepare("INSERT INTO Usuario (email, senha, nome, foto, tel, endereco, cpf) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $email = $usuario->getEmail();
        $senha = $usuario->getSenha();
        $nome = $usuario->getNome();
        $foto = $usuario->getFoto();
        $tel = $usuario->getTel();
        $endereco = $usuario->getEndereco();
        $cpf = $usuario->getCpf();
        try {
            $stmt->execute([
                
            ]);
            return $this->pdo->lastInsertId();
        } catch (PDOException $e) {
            throw new Exception('Erro ao inserir usuário: ' . $e->getMessage());
        }
    }

    public function selectById($id)
    {
        $stmt = $this->pdo->prepare("SELECT * FROM Usuario WHERE id = ?");
        try {
            $stmt->execute([$id]);
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($row) {
                return new Usuario($row['id'], $row['email'], $row['senha'], $row['nome'], $row['foto'], $row['tel'], $row['endereco'], $row['cpf'], $row['creation_time'], $row['modification_time']);
            }
            return null;
        } catch (PDOException $e) {
            throw new Exception('Erro ao selecionar usuário: ' . $e->getMessage());
        }
    }

    public function selectByNome($nome)
    {
        $stmt = $this->pdo->prepare("SELECT * FROM Usuario WHERE nome LIKE ?");
        $nome = '%' . $nome . '%';
        try {
            $stmt->execute([$nome]);
            return $stmt->fetchAll(PDO::FETCH_CLASS, "Usuario");
            // $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
            // $usuarios = [];
            // foreach ($rows as $row) {
            //     $usuarios[] = new Usuario($row['id'], $row['email'], $row['senha'], $row['nome'], $row['foto'], $row['tel'], $row['endereco'], $row['cpf'], $row['creation_time'], $row['modification_time']);
            // }
            // return $usuarios;
        } catch (PDOException $e) {
            throw new Exception('Erro ao selecionar usuários por nome: ' . $e->getMessage());
        }
    }
      

    public function update(Usuario $usuario)
    {
        $stmt = $this->pdo->prepare("UPDATE Usuario SET email = ?, senha = ?, nome = ?, foto = ?, tel = ?, endereco = ?, cpf = ? WHERE id = ?");
        $email = $usuario->getEmail();
        $senha = $usuario->getSenha();
        $nome = $usuario->getNome();
        $foto = $usuario->getFoto();
        $tel = $usuario->getTel();
        $endereco = $usuario->getEndereco();
        $cpf = $usuario->getCpf();
        $id = $usuario->getId();
        try {
            $stmt->execute([$email, $senha, $nome, $foto, $tel, $endereco, $cpf, $id]);
            return $stmt->rowCount();
        } catch (PDOException $e) {
            throw new Exception('Erro ao atualizar usuário: ' . $e->getMessage());
        }
    }

    public function deleteById($id)
    {
        $stmt = $this->pdo->prepare("DELETE FROM Usuario WHERE id = ?");
        try {
            $stmt->execute([$id]);
            return $stmt->rowCount();
        } catch (PDOException $e) {
            throw new Exception('Erro ao excluir usuário: ' . $e->getMessage());
        }
    }

    public function __destruct()
    {
        $this->pdo = null;
    }
}
