<?php

class Calculadora{
    private $result;

    public function getResult(){
        return $this->result;
    }

    public function setValorInicial($valor_inicio){
        if($this->result == null){
            $this->result = $valor_inicio;
        }        
    }

    public function somar($valor){
        $this->result += $valor;
        return $this->result;
    }

    public function sub($valor){
        $this->result -= $valor;
        return $this->result;
    }

    public function div($valor){
        $this->result /= $valor;
        return $this->result;
    }

    public function mult($valor){
        $this->result *= $valor;
        return $this->result;
    }
}


$calc = new Calculadora();
echo 'Valor: ínicial: 10';
$calc->setValorInicial(10);

echo '<br>'.$calc->getResult().' + 10 = '. $calc->somar(10);
echo '<br>'.$calc->getResult().' - 10 = '. $calc->sub(10);
echo '<br>'.$calc->getResult().' + 5  = '. $calc->somar(5);
echo '<br>'.$calc->getResult().' * 2  = '. $calc->mult(2);
echo '<br>'.$calc->getResult().' / 3  = '. $calc->div(3);


