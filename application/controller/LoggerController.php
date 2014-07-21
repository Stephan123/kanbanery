<?php

class LoggerController
{
    // use Stephan123\model\Logging;
    use model_logging;

    public function test()
    {
        echo '<hr>Logger - Test';
        $this->log();
    }
}
 