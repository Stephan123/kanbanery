<?php
class toolLoggable {
    protected $logger;

    public function setLogger(Logger $logger)
    {
        $this->logger = $logger;
    }
    public function log($message, $level)
    {
        $this->logger->log($message, $level);
    }
} // end class
 