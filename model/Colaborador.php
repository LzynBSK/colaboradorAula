<?php 

class Colaborador {
    public $id;
    public $fk_Usuario_id;
    public $fk_Rifa_id;
    public $url;
    public $saque;
    public $creation_time;
    public $modification_time;



    public function __construct($c=false, $id = 0,$fk_Usuario_id = 0,$fk_Rifa_id = 0,$url = "",$saque = 0,$creation_time = "",$modification_time = "") {
        if($c){
            $this->id = $id;
            $this->fk_Usuario_id = $fk_Usuario_id;
            $this->fk_Rifa_id = $fk_Rifa_id;
            $this->url = $url;
            $this->saque = $saque;
            $this->creation_time = $creation_time;
            $this->modification_time = $modification_time;
        }
    }
    
    public function getId() {
        return $this->id;
    }

    public function getUrl() {
        return $this->url;
    }

    public function setUrl($url) {
        $this->url = $url;
    }

    public function getSaque() {
        return $this->saque;
    }

    public function setSaque($saque) {
        $this->saque = $saque;
    }

    public function getCreationTime() {
        return $this->creation_time;
    }

    public function setCreationTime($creation_time) {
        $this->creation_time = $creation_time;
    }

    public function getModificationTime() {
        return $this->modification_time;
    }

    public function setModificationTime($modification_time) {
        $this->modification_time = $modification_time;
    }
}
