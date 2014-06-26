<?PHP
class toolException extends Exception{
    private $params;
    private $method;
    private $url;
    private $session;

    public function __construct($message, $code, $previous = null){
        $request = Flight::request();
        $this->method = $request->query['method'];
        $this->url = $request->query['url'];

        $session = array();
        foreach($_SESSION as $namespace => $variables){
            $session[$namespace] = $variables;
        }

        $this->session = json_encode($session);

        $this->params = json_encode(Flight::get('params'));

        parent::__construct($message, $code, $previous);
    }

    public function getMethod(){
        return $this->method;
    }

    public function getParams(){
        return $this->params;
    }

    public function getUrl(){
        return $this->url;
    }

    public function getSession(){
        return $this->session;
    }
}
?>