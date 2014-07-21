<?php
class traitController{
    protected $pimple = null;
    protected $params = null;

    use model_Bla;
    use model_Blub{
        testBlub as private test;
    }

    public function __construct(Pimple $pimple){
        $this->pimple = $pimple;
        $this->params = Flight::get('params');
    }

    public function testTrait()
    {
        try{
            echo '<hr> Test Trait';
            $this->testBla();
            $this->test();
        }
        catch(Exception $e){
            throw $e;
        }

    }
}