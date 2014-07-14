<?php

/**
 * Validierung der Parameter
 *
 * @author User
 * @date 14.07.14
 * @file ToolValidate.php
 * @package tools
 */
class toolValidate
{
    protected $data = array();
    protected $filter = array();

    /**
     * @param array $data
     * @return ToolValidate
     */
    public function setDataArray(array $data = array())
    {
        $this->data = $data;

        if(count($this->data) == 0)
            return;

        $this->validateArray();

        return $this;
    }

    /**
     * @return array
     */
    public function getDataArray(){
        return $this->data;
    }

    /**
     * @param array $filter
     * @return ToolValidate
     */
    public function setFilter(array $filter){
        $this->filter = $filter;

        return $this;
    }

    /**
     * Überprüfung der Parameter
     */
    protected function validateArray(){

        foreach($this->data as $key => $value){

            if(!$filter = $this->filter[$key]['filter'])
                throw new Exception('Filter für: '.$key.' nicht vorhanden');

            if(array_key_exists('options', $this->filter[$key])){
                $options = $this->filter[$key]['options'];
                $result = filter_var($value, $filter, $options);
            }
            else
                $result = filter_var($value, $filter);

            if($result === false)
                throw new Exception("Filter Parameter: ".$key." falsch");
        }

        return;
    }

    /**
     * @param $property
     * @param $value
     * @return ToolValidate
     * @throws Exception
     */
    public function __set($key, $value)
    {
        $data = array(
            $key => $value
        );

        $this->data[$key] = $value;
        $this->validateArray($data);

        return $this;
    }

    /**
     * @param $property
     * @return mixed
     * @throws Exception
     */
    public function __get($property)
    {
        if (!array_key_exists($property, $this->data)) {
            throw new Exception('');
        }

        return $this->data[$property];
    }

    /**
     * @param $property
     * @return bool
     */
    public function __isset($property)
    {
        return isset($this->data[ $property ]);
    }

    /**
     * @param $property
     * @return ToolValidate
     */
    public function __unset($property)
    {
        if (isset($this->data[ $property ])) {
            unset($this->data[ $property ]);
        }

        return $this;
    }
}
 