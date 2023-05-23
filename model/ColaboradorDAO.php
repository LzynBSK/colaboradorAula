<?php
require_once 'DataBase.php';
require_once 'Colaborador.php';

class ColaboradorDAO
{
    private $pdo;
    private $erro;

    public function getErro(){
        return $this->erro;
    }

    public function __construct()
    {
        try {
            $this->pdo = (new DataBase())->connection();
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (\PDOException $e) {
            $this->erro = 'Erro ao conectar com o banco de dados: ' . $e->getMessage();
            die;
        }
    }

    public function insert(Colaborador $colaborador): Colaborador|bool
    {
        $stmt = $this->pdo->prepare("INSERT INTO colaborador (url, saque) VALUES (:url, :saque)");
        $dados = [
            'url'      => $colaborador->getUrl(),
            'saque' => $colaborador ->getSaque(),
        ];
        try {
            $stmt->execute($dados);
            return $this->selectById($this->pdo->lastInsertId());
        } catch (\PDOException $e) {
            $this->erro = 'Erro ao inserir colaborador: ' . $e->getMessage();
            return false;
        }
    }

    
    public function selectById($id): Colaborador|bool
    {
        $stmt = $this->pdo->prepare("SELECT * FROM colaborador WHERE colaborador.id = :id");
        try {
            if($stmt->execute(['id'=>$id])){
                $stmt->setFetchMode(PDO::FETCH_CLASS, 'Colaborador');
                return $stmt->fetch();
            }
            return false;

        } catch (\PDOException $e) {
            $this->erro = 'Erro ao selecionar colaborador: ' . $e->getMessage();
            return false;
        }
    }

    public function listarTodos(){
        $cmdSql = "SELECT * FROM colaborador";
        $cx = $this->pdo->prepare($cmdSql);
        $cx->execute();
        if($cx->rowCount() > 0){
            $cx->setFetchMode(PDO::FETCH_CLASS, 'Colaborador');
            return $cx->fetchAll();
        }
        return false;
    }
public function update(Colaborador $colaborador)
{
    $stmt = $this->pdo->prepare("UPDATE colaborador SET saque = ? WHERE id = ?");
    $saque = $colaborador->getSaque();
    $url = $colaborador->getUrl();
    $id = $colaborador->getId();
    try {
        $stmt->execute([$saque, $url, $id]);
        return $stmt->rowCount();
    } catch (PDOException $e) {
        throw new Exception('Erro ao atualizar colaborador: ' . $e->getMessage());
    }
}

public function deleteById($id)
{
    $stmt = $this->pdo->prepare("DELETE FROM colaborador WHERE id = ?");
    try {
        $stmt->execute([$id]);
        return $stmt->rowCount();
    } catch (PDOException $e) {
        throw new Exception('Erro ao excluir colaborador: ' . $e->getMessage());
    }
}

public function __destruct()
{
    $this->pdo = null;
}
}
