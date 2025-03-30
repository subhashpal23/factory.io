<?php
ob_start();
defined('BASEPATH') OR exit('No direct script access allowed');
/*
@package Front/Front
*/
class Api extends Common_Controller 
{
	public function __construct()
	{
		//@call to parent CI_Controller constructor
		parent::__construct();
		$this->load->library('session');
		$this->load->helper('layout_helper');
		//$this->load->helper("feeder_stage_nom_helper");
		$this->load->helper("registration_helper");
		//$this->load->helper("commission_helper");
		$this->load->model('front_model');
		//$this->load->model('user/account_model');
		//$this->load->model('user/package_model');
		//$this->load->model('user/ewallet_model');
		$this->load->model("auth_model","auth");
		header("Access-Control-Allow-Origin: *");
		header("Access-Control-Allow-Origin: http://localhost:3000");
		header("Access-Control-Allow-Origin: http://localhost:3456");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
        header("Access-Control-Allow-Headers: Content-Type, Authorization");
        
	}
	
	public function app_log($url)
	{
	    $this->db->insert('app_log',array('url'=>$url,'request'=>$request,'response'=>$response));
	    $log_id=$this->db->insert_id();
	    $this->db->update('app_log',array('response'=>$response),array('id'=>$id));
	}
	public function send_mail($email_data) {
        $this->load->library('Phpmailer_lib'); // Load PHPMailer

        $mail = $this->phpmailer_lib->load();
        $mail->SMTPOptions = array(
            'ssl' => array(
                'verify_peer' => false,
                'verify_peer_name' => false,
                'allow_self_signed' => true
            )
        );
        try {
            // Server settings
            $mail->isSMTP();
            $mail->Host       = 'mail.demosite.name'; // SMTP server
            $mail->SMTPAuth   = true;
            $mail->Username   = 'noreply@demosite.name'; // Your email
            $mail->Password   = 'vzx@n)U5eU?t'; // Your email password
            $mail->SMTPSecure = 'tls';
            $mail->Port       = 587;

            // Recipients
            $mail->setFrom('noreply@demosite.name', 'Factory');
            $mail->addAddress($email_data['to'], $email_data['toname']);

            // Content
            $mail->isHTML(true);
            $mail->Subject = $email_data['subject'];
            $data['message']    =   $email_data;
            $msg                =   $this->load->view('email-template/'.$email_data['email-template'],  $data, true);
            //echo $msg; exit;
            //$mail->message($msg);
            $mail->Body    = $msg;
            
            // Send email
            if ($mail->send()) {
                //echo "Email sent successfully!";
            } else {
                //echo "Email failed: " . $mail->ErrorInfo;
            }
        } catch (Exception $e) {
            echo "Mailer Error: " . $mail->ErrorInfo;
        }
    }
	public function index()
	{
	    
	}
	public function updateUserId()
	{
	    
	    // Get the raw POST data
        $raw_data = file_get_contents("php://input");
        $this->db->insert('app_log',array('url'=>'updateUserId','request'=>$raw_data));
	    $log_id=$this->db->insert_id();
	    
        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }   
        $name = isset($json_data['name']) ? $json_data['name'] : null;
        $email = isset($json_data['email']) ? $json_data['email'] : null;
        $password = isset($json_data['password']) ? $json_data['password'] : null;
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
        }
        // Process the data (example: save to database)
        if($userId) 
        {
            $where=array('id'=>$userId);
            $this->db->update('consumer_user',$json_data,$where);
            
                $response = [
                    'status' => true,
                    'message' => 'Data received successfully',
                    'data' => $json_data
                ];
            
        } else {
            $response = [
                'status' => false,
                'message' => 'Missing required fields'
            ];
        }

        // Return the response in JSON format
        $response=json_encode($response);
        $this->db->update('app_log',array('response'=>$response),array('id'=>$log_id));
        echo $response;
	}
	public function saveToken($userId, $token, $expiry)
    {
        $data = [
            'user_id' => $userId,
            'token' => $token,
            'expires_at' => $expiry
        ];
        $this->db->insert('tokens', $data);
    }

    public function getToken($token)
    {
        return $this->db->get_where('tokens', ['token' => $token])->row_array();
    }
    public function validateToken()
    {
        // Get token from the request header
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);

        // Validate the token
        $tokenData = $this->getToken($token);

        if ($tokenData) {
            if (strtotime($tokenData['expires_at']) > time()) {
                echo json_encode(['status' => 'success', 'message' => 'Token is valid']);
            } else {
                echo json_encode(['status' => 'error', 'message' => 'Token has expired']);
            }
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Invalid token']);
        }
    }
    public function getUserData()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            $user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
    
            echo json_encode(['status' => 'success', 'data' => $user]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    }
    public function getUserDetails($user_id)
    {
     $user = $this->db->get_where('consumer_user', ['id' => $user_id])->row();   
     return $user;
    }
	public function registration()
	{
	    // Get the raw POST data
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }

        // Access individual JSON values
        $name = isset($json_data['name']) ? $json_data['name'] : null;
        $email = isset($json_data['email']) ? $json_data['email'] : null;

        // Process the data (example: save to database)
        if ($name && $email) {
            // check email is exists or not
            $count=$this->db->select('id')->from('consumer_user')->where(array('email'=>$json_data['email']))->get()->num_rows();
            if($count)
            {
                $response = [
                'status' => false,
                'message' => 'Email already exist'
                ];
            }
            else
            {
                // insert data in consumer_user
                $member_id=generateUserId();
                $json_data['member_id']=$member_id;
                $this->db->insert('consumer_user',$json_data);
                $user_id=$this->db->insert_id();
                $json_data['user_id']=$user_id;
                $response = [
                    'status' => true,
                    'message' => 'Data received successfully',
                    'data' => $json_data
                ];
                $email_data['from']='noreply@demosite.name';
                $email_data['to']=$json_data['email'];
                $email_data['subject']=$email;
                $email_data['email-template']='verifymail';
                $email_data['user_id']=$user_id;
                $email_data['name']=$name;
                $email_data['linkusrl']=base_url().'Web/verifyUser/'.ID_encode($user_id);
			    $email_data['subject']='Registration successful on Factory';
			    $email_data['email-template']='verifymail';
			    $this->send_mail($email_data);
                // _sendEmail($email_data);
            }
        } else {
            $response = [
                'status' => false,
                'message' => 'Missing required fields'
            ];
        }

        // Return the response in JSON format
        echo json_encode($response);
    }
    
    public function sendmailtest($email)
    {
        
        $info=$this->db->select('*')->from('consumer_user')->where(array('email'=>$email))->get()->row();
        $email_data['from']='info@demosite.name';
                $email_data['to']=$email;
                $email_data['subject']='Registration Successful';
                $email_data['email-template']='verifymail';
                $email_data['user_id']=$info->id;
                $email_data['name']=$info->name;
                $email_data['linkusrl']=base_url().'Web/verifyUser/'.ID_encode($info->id);
                _sendEmail($email_data);
    }
    public function login()
	{
	    // Get the raw POST data
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }

        // Access individual JSON values
        $password = isset($json_data['password']) ? $json_data['password'] : null;
        $email = isset($json_data['email']) ? $json_data['email'] : null;
        $role_type = isset($json_data['role_type']) ? $json_data['role_type'] : null;

        // Process the data (example: save to database)
        if ($password && $email) {
            // check email is exists or not
            $count=$this->db->select('id')->from('consumer_user')->where(array('email'=>$json_data['email'],'password'=>$json_data['password'],'role_type'=>$role_type,'email_verify'=>1))->get()->num_rows();
            if($count)
            {
                $count1=$this->db->select('id')->from('consumer_user')->where(array('email'=>$json_data['email'],'password'=>$json_data['password'],'role_type'=>$role_type))->get()->num_rows();
                if($count1)
                {
                    $token = bin2hex(random_bytes(32));
                    $expiry = date('Y-m-d H:i:s', strtotime('+1 hour')); 
                    
                    $info=$this->db->select('*')->from('consumer_user')->where(array('email'=>$json_data['email'],'password'=>$json_data['password'],'role_type'=>$role_type))->get()->row();
                    $this->saveToken($info->id, $token, $expiry);
                    $manufacturing_process=$this->getManufacteringProcess();
                    //pr($manufacturing_process);
                    $response = [
                        'status' => true,
                        'message' => 'Login successfully',
                        'token' => $token,
                        'expires_at' => $expiry,
                        'data' => $info,
                        'manufacturing_process'=>$manufacturing_process
                    ];
                }
                else
                {
                    // insert data in consumer_user
                    $response = [
                    'status' => false,
                    'message' => 'Wrong email or password'
                    ];
                }
            }
            else
            {
                // insert data in consumer_user
                $response = [
                'status' => false,
                'message' => 'Please check your inbox and verify email'
                ];
            }
        } else {
            $response = [
                'status' => false,
                'message' => 'Missing required fields'
            ];
        }

        // Return the response in JSON format
        echo json_encode($response);
    }
    
    public function getManufacteringProcess()
    {
        $res=$this->db->select('*')->from('manufacturing_process')->order_by('name','asc')->get()->result();
        foreach($res as $key=>$val)
        {
            $result['id']=$val->id;
            $result['process_name']=$val->name;
            $result1[]=$result;
        }
        return $result1;
    }
    
    public function getMySuppliers()
    {
        $headers = $this->input->get_request_header('Authorization');
        $filename = "example.txt";

        // Define the content to write to the file
        $content = $headers."\n"; 
        
        // Open the file in append mode or create it if it doesn't exist
        $file = fopen($filename, "w");
        
        // Check if the file is successfully opened
        if ($file) {
            // Write the content to the file
            fwrite($file, $content);
            // Close the file after writing
            fclose($file);
            //echo "Text successfully added to the file: $filename";
        } else {
            //echo "Error: Unable to open or create the file.";
        }


        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            $sql="select id,member_id,grade,name,company,company_type,email,phone_number,country_code,is_validated,marketing_consent,industry from consumer_user where id in (select supplier_id from consumer_supplier_map where consumer_id='".$userId."' and assign_type='rfq')";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => true,'message'=>'Show Suppliers', 'data' => $res]);
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function getMyCustomers()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            $sql="select * from consumer_user where id in (select consumer_id from consumer_supplier_map where supplier_id='".$userId."' and assign_type='rfq')";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function createRFQ()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            

        // Access individual JSON values
        $name = isset($json_data['name']) ? $json_data['name'] : null;
        $email = isset($json_data['email']) ? $json_data['email'] : null;
        $country_code = isset($json_data['country_code']) ? $json_data['country_code'] : null;
        $mobile = isset($json_data['mobile']) ? $json_data['mobile'] : null;
        $company_name = isset($json_data['company_name']) ? $json_data['company_name'] : null;
        $manufacturing_process_id = isset($json_data['manufacturing_process_id']) ? $json_data['manufacturing_process_id'] : null;
        $is_design_file = isset($json_data['is_design_file']) ? $json_data['is_design_file'] : null;
        $comments = isset($json_data['comments']) ? $json_data['comments'] : null;
        $files = isset($json_data['files']) ? $json_data['files'] : null;
        
        $add_by = $userId;
        $add_date = date('Y-m-d');
        $status = 0;
        $rfq_code=$this->generateRFQCode();
        $insert_data=array(
            'rfq_code'=>$rfq_code,
            'name'=>$name,
            'email'=>$email,
            'country_code'=>$country_code,
            'mobile'=>$mobile,
            'company_name'=>$company_name,
            'manufacturing_process_id'=>$manufacturing_process_id,
            'is_design_file'=>$is_design_file,
            'comments'=>$comments,
            'add_by'=>$add_by,
            'add_date'=>$add_date
            );
            //pr($insert_data);
        $this->db->insert('rfq',$insert_data);
        $rfq_id=$this->db->insert_id();

        $file = 'filess.txt'; // File name
        
        // Create and open the file for writing
        $handle = fopen($file, 'w');
        
        // Check if file is opened successfully
        if ($handle) {
            $content = json_encode($files);
            fwrite($handle, $content); // Write to the file
            fclose($handle); // Close the file
           
        }


        foreach($files as $key=>$val)
        {
            //pr($val);
            $product=$val['product'];
            // 
            $count=$this->db->select('id')->from('eshop_products')->where('title',$product)->get()->num_rows();
            if($count)
            {
                $pinfo=$this->db->select('id')->from('eshop_products')->where('title',$product)->get()->row();
                $product_id=$pinfo->id;
            }
            else
            {
                $this->db->insert('eshop_products',array('title'=>$product));
                $product_id=$this->db->insert_id();
            }
            $qty=$val['quantity'];
            $files=json_encode($val['files']);
            $insert_data=array(
            'rfq_id'=>$rfq_id,
            'product_id'=>$product_id,
            'qty'=>$qty,
            'files'=>$files
            );
            //pr($insert_data);
        $this->db->insert('rfq_products',$insert_data);
        }
        $sql="select * from rfq where id='".$rfq_id."'";
            $res=$this->db->query($sql)->row();
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function generateRFQCode()
    {
        $rfq_code='RFQ'.rand(1000000,9999999);
        $count=$this->db->select('*')->from('rfq')->where(array('rfq_code'=>$rfq_code))->get()->num_rows();
        if($count)
        {
            $this->generateRFQCode();
        }
        else
        {
            return $rfq_code;
        }
    }
    public function generatePOCode()
    {
        $rfq_code='PO'.rand(1000000,9999999);
        $count=$this->db->select('*')->from('purchase_order')->where(array('po_code'=>$rfq_code))->get()->num_rows();
        if($count)
        {
            $this->generatePOCode();
        }
        else
        {
            return $rfq_code;
        }
    }
    public function generateQuoteCode()
    {
        $rfq_code='Q'.rand(1000000,9999999);
        $count=$this->db->select('*')->from('supplier_quotes')->where(array('quote_code'=>$rfq_code))->get()->num_rows();
        if($count)
        {
            $this->generateQuoteCode();
        }
        else
        {
            return $rfq_code;
        }
    }
    public function getCustomerRFQList()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$users=getUserDetails($userId);
            //$users->member_id;
            $sql="select rfq.*,consumer_user.member_id from rfq inner join consumer_user on rfq.add_by=consumer_user.id where rfq.add_by='".$userId."' order by rfq.id desc";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function AllRFQList()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            $sql="select rfq.*,consumer_user.member_id,consumer_user.grade from rfq inner join consumer_user on rfq.add_by=consumer_user.id order by id desc";
            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from rfq_products where rfq_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    
        return $result1;
    }
    
    public function AllSuppliers()
    {
        $headers = $this->input->get_request_header('Authorization');
        $filename = "example.txt";

        // Define the content to write to the file
        $content = $headers."\n";
        
        // Open the file in append mode or create it if it doesn't exist
        $file = fopen($filename, "w");
        
        // Check if the file is successfully opened
        if ($file) {
            // Write the content to the file
            fwrite($file, $content);
            // Close the file after writing
            fclose($file);
            //echo "Text successfully added to the file: $filename";
        } else {
            //echo "Error: Unable to open or create the file.";
        }


        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            $sql="select id,member_id,grade,name,company,company_type,email,phone_number,country_code,is_validated,marketing_consent,industry,manufacturing_process,freezone,country from consumer_user where role_type='supplier'";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => true,'message'=>'Show Suppliers', 'data' => $res]);
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function AllCustomers()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            $sql="select * from consumer_user where role_type='consumer'";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    /************************ assign rfq to supplier by admin *******************/
    
    public function assignRFQ()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            

        // Access individual JSON values
        $rfq_id = isset($json_data['rfq_id']) ? $json_data['rfq_id'] : null;
        $rfq_code = isset($json_data['rfq_code']) ? $json_data['rfq_code'] : null;
        $supplier_id = isset($json_data['supplier_id']) ? $json_data['supplier_id'] : null;
        $admin_id = isset($json_data['admin_id']) ? $json_data['admin_id'] : null;
        
        $add_by = $userId;
        $add_date = date('Y-m-d');
        $status = 1;
        foreach($supplier_id as $key=>$val)
        {
             $insert_data=array(
            'rfq_id'=>$rfq_id,
            'rfq_code'=>$rfq_code,
            'supplier_id'=>$val,
            'add_by'=>'admin',
            'add_by_id'=>$add_by,
            'assign_to'=>'supplier',
            'assign_date'=>$add_date,
            'assign_type'=>'rfq',
            
            'status'=>$status
            );
            //pr($insert_data);
            $this->db->insert('consumer_supplier_map',$insert_data);
            
        }
       
        $update_data=array(
            'assign_to'=>'supplier',
            'assign_by'=>'admin',
            'assign_by_id'=>$add_by,
            'assign_date'=>$add_date,
            'status'=>$status
            );
            $this->db->update('rfq',$update_data,array('id'=>$rfq_id));
            $sql="select * from rfq where id='".$rfq_id."'";
            $res=$this->db->query($sql)->row();
            echo json_encode(['status' => true,'message' => 'RQF '.$rfq_code.' assigned successfully', 'data' => $res]);
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function changeRFQStatus()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            

        // Access individual JSON values
        $rfq_id = isset($json_data['rfq_id']) ? $json_data['rfq_id'] : null;
        $rfq_code = isset($json_data['rfq_code']) ? $json_data['rfq_code'] : null;
        $supplier_id = isset($userId) ? $userId : null;
        $dstatus = isset($json_data['status']) ? $json_data['status'] : null;
        
        if($dstatus=='accept')
        {
            $status=1;
            $s='Accepted';
        }
        else if($dstatus=='reject')
        {
            $status=2;
            $s='Rejected';
        }
        
        $add_by = $userId;
        $add_date = date('Y-m-d');
       
        
       
        $update_data=array(
            'supplier_status'=>$status,
            'status_date'=>$add_date
            );
            $this->db->update('consumer_supplier_map',$update_data,array('rfq_id'=>$rfq_id,'supplier_id'=>$supplier_id));
            
            echo json_encode(['status' => true,'message' => ''.$rfq_code.' '.$s.' successfully', 'data' => $json_data]);
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    /**************************/
    public function getSupplierRFQList($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";
            if($supplier_status!='')
            {
                
                $sql="select r.*,c.member_id,c.grade from consumer_supplier_map as m inner join rfq as r on m.rfq_id=r.id inner join consumer_user as c on r.add_by=c.id where m.supplier_id='".$userId."' and supplier_status='".$supplier_status."' order by r.id desc";
            }
            else
            {
                $sql="select r.*,c.member_id,c.grade from consumer_supplier_map as m inner join rfq as r on m.rfq_id=r.id inner join consumer_user as c on r.add_by=c.id where m.supplier_id='".$userId."' and supplier_status is NULL order by r.id desc";
            }
            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from rfq_products where rfq_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function getSupplierAcceptedRFQList()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";
            $sql="select r.*,c.member_id,c.grade from consumer_supplier_map as m inner join rfq as r on m.rfq_id=r.id inner join consumer_user as c on r.add_by=c.id where m.supplier_id='".$userId."' and supplier_status=1";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function getSupplierRejectedRFQList()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";
            $sql="select r.* from consumer_supplier_map as m inner join rfq as r on m.rfq_id=r.id where m.supplier_id='".$userId."' and supplier_status=2";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
	
	public function generateQuote()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            

        // Access individual JSON values
        $rfq_id = isset($json_data['rfq_id']) ? $json_data['rfq_id'] : null;
        $rfq_code = isset($json_data['rfq_code']) ? $json_data['rfq_code'] : null;
        $supplier_id = isset($userId) ? $userId : null;
        //$total_cost = isset($json_data['total_cost']) ? $json_data['total_cost'] : null;
        $valid_till = isset($json_data['valid_till']) ? $json_data['valid_till'] : null;
        $timeline_val = isset($json_data['timeline_val']) ? $json_data['timeline_val'] : null;
        $timeline_unit = isset($json_data['timeline_unit']) ? $json_data['timeline_unit'] : null;
        $addcomument = isset($json_data['addcomument']) ? $json_data['addcomument'] : null;
        $payment_term = isset($json_data['payment_term']) ? $json_data['payment_term'] : null;
        $term_and_cond = isset($json_data['term_and_cond']) ? $json_data['term_and_cond'] : null;
        $tax_category = isset($json_data['tax_category']) ? $json_data['tax_category'] : null;
        $files = isset($json_data['files']) ? $json_data['files'] : null;
       
       
        $add_by = $userId;
        $add_date = date('Y-m-d');
        $status = 2;
        $quote_code=$this->generateQuoteCode();
             $insert_data=array(
            'rfq_id'=>$rfq_id,
            'rfq_code'=>$rfq_code,
            'quote_code'=>$quote_code,
            'supplier_id'=>$userId,
            'add_by'=>$userId,
            'add_date'=>$add_date,
            'total_cost'=>$total_cost,
            'valid_till'=>$valid_till,
            'timeline_val'=>$timeline_val,
            'timeline_unit'=>$timeline_unit,
            'payment_term'=>$payment_term,
            'addcomument'=>$addcomument,
            'term_and_cond'=>$term_and_cond,
            'commission_per'=>0,
            'tax_category'=>$tax_category
            );
            //pr($insert_data);
            $this->db->insert('supplier_quotes',$insert_data);
            $quote_id=$this->db->insert_id();
       
       
        $update_data=array(
            'assign_to'=>'admin',
            'assign_type'=>'quote',
            'assign_date'=>$add_date,
            'status'=>$status,
            'quote_id'=>$quote_id
            );
            $this->db->update('consumer_supplier_map',$update_data,array('rfq_id'=>$rfq_id,'supplier_id'=>$userId));
            $date=date('Y-m-d');
            
            foreach($files as $key=>$val)
            {
                //pr($val);
                $product=$val['product_id'];
                $qty=$val['quantity'];
                $rate=$val['rate'];
                $total_cost=$val['total_cost'];
                
                $insert_data=array(
                'rfq_id'=>$rfq_id,
                'rfq_code'=>$rfq_code,
                'product_id'=>$product,
                'quantity'=>$qty,
                'quote_id'=>$quote_id,
                'rate'=>$rate,
                'total_cost'=>$total_cost,
                'create_date'=>$date
                );
                //pr($insert_data);
                $this->db->insert('quotation_products',$insert_data);
            }
            
            $sql="select * from supplier_quotes where id='".$quote_id."'";
            $res=$this->db->query($sql)->row();
            echo json_encode(['status' => true,'message' => 'Quote created successfully', 'data' => $res]);
            
            
            
            
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function updateQuoteCommission()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            

        // Access individual JSON values
        $quote_id = isset($json_data['quote_id']) ? $json_data['quote_id'] : null;
        $quote_code = isset($json_data['quote_code']) ? $json_data['quote_code'] : null;
        $commission_per = isset($json_data['commission_per']) ? $json_data['commission_per'] : null;
        $admin_id = isset($userId) ? $userId : null;
        //$total_cost = isset($json_data['total_cost']) ? $json_data['total_cost'] : null;
       
       
       
        $add_by = $userId;
        $add_date = date('Y-m-d');
        $status = 2;
            $where=array('id'=>$quote_id);
             $update_data=array(
            'commission_per'=>$commission_per
            );
            //pr($insert_data);
            $this->db->update('supplier_quotes',$update_data,$where);
            
            
            $sql="select * from supplier_quotes where id='".$quote_id."'";
            $res=$this->db->query($sql)->row();
            echo json_encode(['status' => true,'message' => 'Commission updated successfully', 'data' => $res]);
            
            
            
            
        } else {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function getSupplierQuoteList()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";
            $sql="select * from supplier_quotes where supplier_id='".$userId."'";
            $res=$this->db->query($sql)->result();
            /*foreach($res as $key=>$val)
            {
                $result['id']=$val->id;
                $result['process_name']=$val->name;
                $result1[]=$result;
            }*/
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function getProducts()
    {
        $sql="select id,title as product_name from eshop_products ";
        $res=$this->db->query($sql)->result();
        echo json_encode(['status' => true,'message'=>'Show Products', 'data' => $res]);
        return $result1;
    }
    
    public function multiplefileupload()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            header("Access-Control-Allow-Origin: *");
            header("Access-Control-Allow-Methods: POST, OPTIONS");
            header("Access-Control-Allow-Headers: Content-Type, Authorization");
            exit(0);
        }
        //pr($_FILES); exit;
        $total = count($_FILES['upload']['name']);
        //echo $total; exit;
        // Loop through each file
        for( $i=0 ; $i < $total ; $i++ ) {
        
          //Get the temp file path
          //$image = $_FILES['upload']['name'][$i];
          $tmpFilePath = $_FILES['upload']['tmp_name'][$i];
        
          //Make sure we have a file path
          if ($tmpFilePath != ""){
            //Setup our new file path
            //$newFilePath = "./uploadFiles/" . $_FILES['upload']['name'][$i];
        
            //Upload the file into the temp dir
            $image_upload_path='/rfq_files/';
    	    //$profile_pic=adImageUpload($_FILES['upload'],$i, $image_upload_path);
            $image_name=adImageUploadMultiple($_FILES['upload'], $i, $image_upload_path);
            //echo "Image:-".$image_name; echo "<br>";
            $arr[]=$image_upload_path.$image_name;
          }
        }
        
        echo json_encode($arr);
    }
    
    public function multipleDocUpload()
    {
        if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
            header("Access-Control-Allow-Origin: *");
            header("Access-Control-Allow-Methods: POST, OPTIONS");
            header("Access-Control-Allow-Headers: Content-Type, Authorization");
            exit(0);
        }
        $total = count($_FILES['upload']['name']);

        // Loop through each file
        for( $i=0 ; $i < $total ; $i++ ) {
        
          //Get the temp file path
          $tmpFilePath = $_FILES['upload']['tmp_name'][$i];
        
          //Make sure we have a file path
          if ($tmpFilePath != ""){
            //Setup our new file path
            //$newFilePath = "./uploadFiles/" . $_FILES['upload']['name'][$i];
        
            //Upload the file into the temp dir
            $image_upload_path='/company_doc/';
    	    //$profile_pic=adImageUpload($_FILES['upload'],$i, $image_upload_path);
            $image_name=adFileUploadMultiple($_FILES['upload'],$i, $image_upload_path);
            $arr[]=$image_upload_path.$image_name;
          }
        }
        
        echo json_encode($arr);
    }
    public function allQuotationListForSupplier($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

                
            $sql="select * from supplier_quotes where supplier_id='".$userId."'  order by id desc";
            

            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from quotation_products where quote_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                //$result1['products'][$val->id]=$resp;
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $total_amount=$this->gettaxamount($val->tax_category,$total_amount);
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function allQuotationListForConsumer($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

                
            //$sql="select sq.* from quotation_products as qp inner join supplier_quotes as sq on m.rfq_id=r.id inner join consumer_user as c on qp.quote_id=sq.id where customer_id='".$userId."'";
            $sql="select supplier_quotes.*,consumer_user.member_id as supplier_uuid,consumer_user.grade as supplier_grade from supplier_quotes inner join consumer_user on supplier_quotes.supplier_id=consumer_user.id where customer_id='".$userId."' and supplier_quotes.customer_status is NULL  order by id desc";

            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="SELECT id,quote_id,rfq_id,rfq_code,product_id,quantity,rate as r,(rate+rate * ".$val->commission_per."/100) as rate,total_cost as totalcost,(total_cost+total_cost * ".$val->commission_per."/100) as total_cost,create_date,added_date,files FROM `quotation_products` where quote_id='".$val->id."'";
                
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $total_amount=$this->gettaxamount($val->tax_category,$total_amount);
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function AcceptedQuotationListForConsumer($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

                
            //$sql="select sq.* from quotation_products as qp inner join supplier_quotes as sq on m.rfq_id=r.id inner join consumer_user as c on qp.quote_id=sq.id where customer_id='".$userId."'";
            $sql="select supplier_quotes.*,consumer_user.member_id as supplier_uuid,consumer_user.grade as supplier_grade from supplier_quotes inner join consumer_user on supplier_quotes.supplier_id=consumer_user.id where customer_id='".$userId."' and supplier_quotes.customer_status=1  order by id desc";

            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="SELECT id,quote_id,rfq_id,rfq_code,product_id,quantity,rate as r,(rate+rate * ".$val->commission_per."/100) as rate,total_cost as totalcost,(total_cost+total_cost * ".$val->commission_per."/100) as total_cost,create_date,added_date,files FROM `quotation_products` where quote_id='".$val->id."'";
                
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function RejectedQuotationListForConsumer($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

                
            //$sql="select sq.* from quotation_products as qp inner join supplier_quotes as sq on m.rfq_id=r.id inner join consumer_user as c on qp.quote_id=sq.id where customer_id='".$userId."'";
            $sql="select supplier_quotes.*,consumer_user.member_id as supplier_uuid,consumer_user.grade as supplier_grade from supplier_quotes inner join consumer_user on supplier_quotes.supplier_id=consumer_user.id where customer_id='".$userId."' and supplier_quotes.customer_status=0 order by id desc";

            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="SELECT id,quote_id,rfq_id,rfq_code,product_id,quantity,rate as r,(rate+rate * ".$val->commission_per."/100) as rate,total_cost as totalcost,(total_cost+total_cost * ".$val->commission_per."/100) as total_cost,create_date,added_date,files FROM `quotation_products` where quote_id='".$val->id."'";
                
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function allQuotationList($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

                
            $sql="select * from supplier_quotes order by id desc";
            $sql="SELECT q.*,s.id as supplier_pid,s.member_id as supplier_member_id,s.grade as supplier_grade,s.name as supplier_name,s.email as supplier_email,c.id as customer_pid,c.member_id as customer_member_id,c.grade as customer_grade,c.name as customer_name,c.email as customer_email FROM `supplier_quotes` as q inner join consumer_user as s on q.supplier_id=s.id left join consumer_user as c on q.customer_id=c.id order by q.id desc";
            //echo $sql; echo "<br>";
            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                
                
                $sql1="SELECT * FROM `quotation_products` where quote_id='".$val->id."'";
                //echo $sql1; echo "<br>";
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $val->tax_category;
                $total_amount=$this->gettaxamount($val->tax_category,$total_amount);
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                /*foreach($resp as $k=>$v)
                {
                    $v->rate=$v->rate+($v->rate*$val->commission_per)/100;
                    $v->quantity;
                    $resps[]=$v;
                }*/
                $val->files=$resp;
                
                
                $sql2="SELECT id,quote_id,rfq_id,rfq_code,product_id,quantity,rate as r,(rate+rate * ".$val->commission_per."/100) as rate,total_cost as totalcost,(total_cost+total_cost * ".$val->commission_per."/100) as total_cost,create_date,added_date,files FROM `quotation_products` where quote_id='".$val->id."'";
                
                $resp=$this->db->query($sql2)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->quantity*$v->rate);
                }
                $total_amount=$this->gettaxamount($val->tax_category,$total_amount);
                $val->total_amount_review=$total_amount;
                
                $val->total_tax_review=$total_tax;
                //$result1['products'][$val->id]=$resp;
                /*foreach($resp as $k=>$v)
                {
                    $v->rate=$v->rate+($v->rate*$val->commission_per)/100;
                    $v->quantity;
                    $resps[]=$v;
                }*/
                $val->files_review=$resp;
                $result1[]=$val;
            }
            echo json_encode(['status' => 'success', 'data' => $result1]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function gettaxamount($tax_id,$amount)
    {
        $taxinfo=$this->db->select('*')->from('tax_category')->where('id',$tax_id)->get()->row();
        $tax_amount=($amount*$taxinfo->import_duety)/100;
        $taxcal=$tax_amount+$amount;
        $vat_amount=($taxcal*$taxinfo->vat_per)/100;
        $final_cal=$taxcal+$vat_amount;
        return $final_cal;
    }
    public function acceptRejectQuotation()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);

        $tokenData = $this->getToken($token);
    
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            
            $quote_id = isset($json_data['quote_id']) ? $json_data['quote_id'] : null;
            $status = isset($json_data['status']) ? $json_data['status'] : null;
    
            $sql="select * from supplier_quotes where id = '".$quote_id."'";
            $res=$this->db->query($sql)->row();
            $rfq_id = $res->rfq_id;
            
            $sql="select * from rfq where id = '".$rfq_id."'";
            $res=$this->db->query($sql)->row();
            $customer_id = $res->add_by;
            $date=date('Y-m-d');
            if($status == 0){
                $update_data=array(
                    'status'=>$status,
                    'accept_date'=>$date
                );
            }
            else
            {
                $update_data=array(
                    'status'=>$status,
                    'customer_id' =>$customer_id,
                    'accept_date'=>$date
                );
            }
            $this->db->update('supplier_quotes',$update_data,array('id'=>$quote_id));
            
            echo json_encode(['status' => true,'sql'=>$this->db->last_query(),'message' => 'Status changed successfully']);
        }
        else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    }
    public function acceptRejectCustomerQuotation()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);

        $tokenData = $this->getToken($token);
    
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            
            $quote_id = isset($json_data['quote_id']) ? $json_data['quote_id'] : null;
            $status = isset($json_data['status']) ? $json_data['status'] : null;
    
            $sql="select * from supplier_quotes where id = '".$quote_id."'";
            $res=$this->db->query($sql)->row();
            $rfq_id = $res->rfq_id;
            
            $sql="select * from rfq where id = '".$rfq_id."'";
            $res=$this->db->query($sql)->row();
            $customer_id = $res->add_by;
            $date=date('Y-m-d');
            $update_data=array(
                    'customer_status'=>$status,
                    'customer_accept_date'=>$date,
                    'customer_accept_by'=>$customer_id
                );
            $this->db->update('supplier_quotes',$update_data,array('id'=>$quote_id));
            
            echo json_encode(['status' => true,'message' => 'Status changed successfully']);
        }
        else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    }
    public function createPurchaseOrder()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
        //pr($tokenData); exit;
        
        $raw_data = file_get_contents("php://input");
        //pr($raw_data); exit;
        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) 
        {
           // Token is valid, return user data
           $userId = $tokenData['user_id'];
           $po_code=$this->generatePOCode();
           // Access individual JSON values
           $rfq_id = isset($json_data['rfq_id']) ? $json_data['rfq_id'] : null;
           //$supplier_id = isset($userId) ? $userId : null;
           //$total_cost = isset($json_data['total_cost']) ? $json_data['total_cost'] : null;
           $customer_id = $userId;
           $quote_id = isset($json_data['quote_id']) ? $json_data['quote_id'] : null;
           $po_valid_date = isset($json_data['po_valid_date']) ? $json_data['po_valid_date'] : null;
           $tax_category = isset($json_data['tax_category']) ? $json_data['tax_category'] : null;
           $payment_term = isset($json_data['payment_term']) ? $json_data['payment_term'] : null;
           $term_and_condition = isset($json_data['term_and_cond']) ? $json_data['term_and_cond'] : null;
           $documents = isset($json_data['documents']) ? $json_data['documents'] : null;
           $files = isset($json_data['files']) ? $json_data['files'] : null;
           $add_by_id = $userId;
           
           //$add_by = $userId;
           $create_date = date('Y-m-d');
           //$status = 2;
        
            $insert_data=array(
            'rfq_id'=>$rfq_id,
            'quote_id'=>$quote_id,
            'po_code'=>$po_code,
            'add_by_id'=>$userId,
            'create_date'=>$create_date,
            'customer_id'=>$userId,
            'po_date'=>$create_date,
            'po_valid_date'=>$po_valid_date,
            'tax_category'=>$tax_category,
            'payment_term'=>$payment_term,
            'term_and_condition'=>$term_and_condition,
            'documents'=>$documents
            );
            
            //pr($insert_data);
            $this->db->insert('purchase_order',$insert_data);
            $purchase_id=$this->db->insert_id();
            foreach($files as $key=>$val)
            {
                //pr($val);
                $product=$val['product_id'];
                $qty=$val['quantity'];
                $rate=$val['rate'];
                $files=json_encode($val['files']);
                $insert_data=array(
                'po_id'=>$purchase_id,
                'product_id'=>$product,
                'qty'=>$qty,
                'rate'=>$rate
                );
                //pr($insert_data);
            $this->db->insert('po_products',$insert_data);
            }
            $sql="select * from purchase_order where id='".$purchase_id."'";
            $res=$this->db->query($sql)->row();
            echo json_encode(['status' => true,'message' => 'Purchase Order created successfully', 'data' => $res]);
            //echo json_encode(['status' => true,'message' => 'Purchase Order created successfully', 'data' => $purchase_id]);

        } 
        else
        {
            echo json_encode(['status' => false, 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function acceptRejectPurchaseOrder()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);

        $tokenData = $this->getToken($token);
    
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            $userId = $tokenData['user_id'];
            $po_id = isset($json_data['po_id']) ? $json_data['po_id'] : null;
            $status = isset($json_data['status']) ? $json_data['status'] : null;
    
            $sql="select * from purchase_order where id = '".$po_id."'";
            $res=$this->db->query($sql)->row();
            $quote_id = $res->quote_id;
            
            $sql="select * from supplier_quotes where id = '".$quote_id."'";
            $res=$this->db->query($sql)->row();
            $supplier_id = $res->supplier_id;
            $date=date('Y-m-d');
            if($status == 0){
                $update_data=array(
                    'status'=>$status,
                    'accept_date'=>$date,
                    'accept_by'=>$userId
                );
            }
            else
            {
                $update_data=array(
                    'status'=>$status,
                    'supplier_id' =>$supplier_id,
                    'accept_date'=>$date
                );
            }
            $this->db->update('purchase_order',$update_data,array('id'=>$po_id));
            
            echo json_encode(['status' => true,'sql'=>$this->db->last_query(),'message' => 'Status changed successfully']);
        }
        else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    }
    public function acceptRejectPOBySupplier()
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);

        $tokenData = $this->getToken($token);
    
        $raw_data = file_get_contents("php://input");

        // Decode the JSON data
        $json_data = json_decode($raw_data, true); // Pass `true` to get an associative array
        //pr($json_data); exit;
        if ($json_data === null) {
            // Handle JSON decoding errors
            $response = [
                'status' => false,
                'message' => 'Invalid JSON payload'
            ];
            echo json_encode($response);
            return;
        }
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            $userId = $tokenData['user_id'];
            $po_id = isset($json_data['po_id']) ? $json_data['po_id'] : null;
            $status = isset($json_data['status']) ? $json_data['status'] : null;
    
            $sql="select * from purchase_order where id = '".$po_id."'";
            $res=$this->db->query($sql)->row();
            $quote_id = $res->quote_id;
            
            $sql="select * from supplier_quotes where id = '".$quote_id."'";
            $res=$this->db->query($sql)->row();
            $supplier_id = $res->supplier_id;
            $date=date('Y-m-d');
            
                $update_data=array(
                    'supplier_status'=>$status,
                    'supplier_accept_date	'=>$date,
                    'supplier_accept_by'=>$userId
                );
            
            $this->db->update('purchase_order',$update_data,array('id'=>$po_id));
            
            echo json_encode(['status' => true,'message' => 'Status changed successfully']);
        }
        else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
    }
	
    public function allPurchaseOrder($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

            $sql="select * from purchase_order order by id desc";

            $res=$this->db->query($sql)->result();

            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from po_products where po_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->qty*$v->rate);
                }
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            //$result1[]=$res;
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function SupplierPurchaseOrder($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

            $sql="select * from purchase_order where supplier_id='".$userId."' order by id desc";

            $res=$this->db->query($sql)->result();

            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from po_products where po_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->qty*$v->rate);
                }
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            //$result1[]=$res;
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    public function ConsumerPurchaseOrder($supplier_status=null)
    {
        $headers = $this->input->get_request_header('Authorization');
        $token = str_replace('Bearer ', '', $headers);
    
        $tokenData = $this->getToken($token);
    
        if ($tokenData && strtotime($tokenData['expires_at']) > time()) {
            // Token is valid, return user data
            $userId = $tokenData['user_id'];
            //$user = $this->db->get_where('consumer_user', ['id' => $userId])->row_array();
            //$sql="select r.* from consumer_supplier_map as m inner join rfq as r where m.supplier_id='".$userId."'";

            $sql="select * from purchase_order where customer_id='".$userId."' order by id desc";

            $res=$this->db->query($sql)->result();
            foreach($res as $key=>$val)
            {
                //$result[]=$val;
                $sql1="select * from po_products where po_id='".$val->id."'";
                $resp=$this->db->query($sql1)->result();
                $total_amount=0;
                $total_tax=0;
                foreach($resp as $k=>$v)
                {
                    $total_amount=$total_amount+($v->qty*$v->rate);
                }
                $val->total_amount=$total_amount;
                $val->total_tax=$total_tax;
                //$result1['products'][$val->id]=$resp;
                $val->files=$resp;
                $result1[]=$val;
            }
            //$result1[]=$res;
            echo json_encode(['status' => 'success', 'data' => $res]);
        } else {
            echo json_encode(['status' => 'error', 'message' => 'Unauthorized']);
        }
        
        return $result1;
    }
    
    public function taxCategory()
    {

            $sql="select * from tax_category order by id desc";
            $res=$this->db->query($sql)->result();
            
            echo json_encode(['status' => 'success', 'data' => $res]);
    }
}//end class
