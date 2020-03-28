<?php

namespace App;

class QueryLogger
{
    private static $instance;
    private $logs;

    public function log($query)
    {
        $this->logs[] = $query;
    }

    public function getLogsAll()
    {
        return $this->logs;
    }

    private function __construct()
    {
        
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            self::$instance = new self();
            self::$instance->logs = [];
        }

        return self::$instance;
    }
}