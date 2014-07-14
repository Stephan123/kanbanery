<?php
/**
 * Validierung der ankommenden Parameter in einer Action
 *
     $data = array(
        'product_id'    => 'libgd<script>',
        'component'     => '10', // Fehler
        'versions'      => '2.0.33',
        'testscalar'    => array('2', '23', '10', '12'),
        'testarray'     => '2'
    );

    $filter = array(
        'title' => array(
            'filter' => FILTER_VALIDATE_REGEXP,
            'required' => true,
            'options' => array(
                "regexp" => "#^([a-z]+)$#i"
            )
        ),
        'firstname' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES
        ),
        'lastname' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES,
            'required' => true
        ),
        'company' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES
        ),
        'offlinekunde' => array(
            'filter' => FILTER_SANITIZE_NUMBER_INT,
            'required' => true
        ),
        'country' => array(
            'filter' => FILTER_SANITIZE_NUMBER_INT,
            'required' => true
        ),
        'street' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES,
            'required' => true
        ),
        'zip' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES,
            'required' => true
        ),
        'city' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES,
            'required' => true
        ),
        'email' => array(
            'filter' => FILTER_SANITIZE_EMAIL,
            'required' => true
        ),
        'password' => array(
            'filter' => FILTER_SANITIZE_MAGIC_QUOTES,
            'required' => true
        ),
        'phonenumber' => array(
            'filter' => FILTER_SANITIZE_NUMBER_INT,
            'required' => true
        ),
        'schriftwechsel' => array(
            'filter' => FILTER_SANITIZE_NUMBER_INT,
            'required' => true
        )
    );
 *
 *
 * @author Stephan Krauss
 * @date 14.07.14
 * @file ToolValidate.php
 * @package tools
 */
class nook_ToolValidate
{
    protected $data = array();
    protected $filter = array();
    protected $validData = array();

    /**
     * @param array $data
     * @return nook_ToolValidate
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
        return $this->validData;
    }

    /**
     * @param array $filter
     * @return nook_ToolValidate
     */
    public function setFilter(array $filter){
        $this->filter = $filter;

        return $this;
    }

    /**
     * Überprüfung der Parameter
     */
    protected function validateArray()
    {
        foreach($this->data as $key => $value){

            $value = trim($value);

            if(!$filter = $this->filter[$key]['filter'])
                throw new Exception('Filter für: '.$key.' nicht vorhanden');

            if(array_key_exists('options', $this->filter[$key])){

                $bedingungen = array();
                foreach($this->filter[$key]['options'] as $optionKey => $optionValue ){
                    $bedingungen['options'][$optionKey] = $optionValue;
                }

                $result = filter_var($value, $filter, $bedingungen);
                $this->validData[$key] = $result;
            }
            else{
                $result = filter_var($value, $filter);
                $this->validData[$key] = $result;
            }

            // filtern fehlgeschlagen
            if($result === false)
                throw new nook_Exception("Filter, Parameter '".$key."' falsch");
        }

        // Kontrolle auf Pflicht - Parameter
        $this->kontrollePflichtParams();

        return;
    }

    /**
     * Kontrollier ob Pflichtparameter vorhanden sind
     *
     * @throws nook_Exception
     */
    protected function kontrollePflichtParams(){
        foreach($this->filter as $paramName => $optionen){
            if(array_key_exists('required', $optionen)){
                if($optionen['required'] === true){
                    if(!array_key_exists($paramName, $this->validData))
                        throw new nook_Exception("Parameter '".$paramName."' nicht vorhanden");
                }
            }
        }

        return;
    }

    /**
     * @param $property
     * @param $value
     * @return nook_ToolValidate
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
