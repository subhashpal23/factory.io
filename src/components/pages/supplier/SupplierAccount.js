import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from 'react-redux';
import { Form, Input, Select, Upload, Button, message, Row, Col, Typography, Modal, Image,Divider, Space, Tag } from "antd";
import { updateAccount, getUserInfo } from '../../../redux/actions/userActions';
import { UploadOutlined, EyeOutlined } from "@ant-design/icons";
import { CountryCodes, industriesType } from './../../../components/Registration/constants';
import FilePreview from "../../../components/FilePreview"; 

const { Option } = Select;

const { Title, Text } = Typography;

const SupplierAccount = () => {
  const dispatch = useDispatch();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const token = useSelector((state) => state.auth.logindata.token);
  const manufacturingProcess = useSelector((state) => state.auth.logindata.manufacturing_process);
  const accountUpdateStatus = useSelector((state) => state.user.accountUpdateStatus);
  const userDetail = useSelector((state) => state.user.userDetail);
  const [isModalVisible, setIsModalVisible] = useState(false);

   const fileRootPath = 'https://factory.demosite.name/api';
   const [formData, setFormData] = useState({
      employeeCount:  0,
      facilities: '',
      location: '',
      files: []
    });


    const onFinish = (values) => {
      console.log("values", values, formData);
      const getValidFile = (files) => 
        files?.find(file => file !== "/") ?? null;
      
       //setLoading(true);
        const dataToSend = {
          ...values,
          ...formData,
          employeeCount: values.employeeCount,
          facilities: values.facilities,
          location: values.location,
          iso_certification: values.iso_certification,
          freezone: values.freezone,
          manufacturing_process : values?.manufacturing_process?.join(","),
          services: values?.services?.join(","),
          // files: formData.importExportDocs?.[0] ?? null,
          // company_logo: formData.company_logo?.[0] ?? null,
          // company_portflio: formData.company_portflio?.[0] ?? null,
          // certificate: formData.certificate?.[0] ?? null,
          files: getValidFile(formData.importExportDocs),
          company_logo: getValidFile(formData.company_logo),
          company_portflio: getValidFile(formData.company_portflio),
          certificate: getValidFile(formData.certificate),
        };
        delete dataToSend.importExportDocs;
        setFormData(dataToSend);
        dispatch(updateAccount(dataToSend, token));
      };

   const handleFileUpload = async (file, fieldKey) => {
    const formData = new FormData();
    formData.append('upload[0]', file);
  
    try {
      const response = await fetch('https://factory.demosite.name/api/Api/multipleDocUpload', {
        method: 'POST',
        headers: {
          'Authorization': `Bearer ${token}`,
        },
        body: formData
      });
  
      const result = await response.json();
      if (response.ok) {
        message.success(`${file.name} file uploaded successfully`);
        setFormData(prevState => {
          return { ...prevState, [fieldKey]: [...prevState?.files, result[0]]};
        });
      } else {
        message.error(`${file.name} file upload failed.`);
      }
    } catch (error) {
      message.error(`${file.name} file upload failed.`);
    }
  };

  const props = (fieldKey) => ({
    name: 'file',
    customRequest: ({ file, onSuccess }) => {
      handleFileUpload(file, fieldKey);
      onSuccess("ok");
    }
  });

  useEffect(() => {
    // Set the form's initial values when formData changes
    form.setFieldsValue({
      employeeCount: formData?.employeeCount ? parseInt(formData.employeeCount, 10) : 0,
      facilities: formData.facilities,
      location: formData.location,
      iso_certification: formData.iso_certification,
      freezone: formData.freezone,
      manufacturing_process : formData?.manufacturing_process,
      files: formData.files[0],

      about_us: formData?.about_us || "",
      address: formData?.address || "",
      anual_turnover: formData?.anual_turnover || "",
      certificate: formData?.certificate || "",
      company: formData?.company || "",
      company_logo: formData?.company_logo || "",
      company_portflio: formData?.company_portflio || "",
      company_type: formData?.company_type || "",
      company_website: formData?.company_website || "",
      contact: formData?.contact || "",
      gst_no: formData?.gst_no || "",
      industry: formData?.industry || "",
      key_customers: formData?.key_customers || "",
      past_project: formData?.past_project || "",
      urn: formData?.urn || "",
      services: formData?.services || "",
      importExportDocs: formData?.importExportDocs || [],
      year_of_establishment: formData?.year_of_establishment || "",
      iec_code: formData?.iec_code || "",
    });
  }, [formData, form]);

  useEffect(() => {
    if (accountUpdateStatus) {
       dispatch(getUserInfo(token));
    }
  }, [accountUpdateStatus, dispatch, token]);
  
  useEffect(() => {
       dispatch(getUserInfo(token));
  }, [token]);

  useEffect(() => {
    if (userDetail) {
      setFormData({
        employeeCount: userDetail?.employeeCount ||  0,
        facilities: userDetail?.facilities  || '',
        location: userDetail?.location || '',
        iso_certification: userDetail?.iso_certification || "",
        freezone: userDetail.freezone,
        manufacturing_process : userDetail.manufacturing_process?.split(","),
        files: userDetail?.files || [],
        about_us: userDetail?.about_us || "",
        address: userDetail?.address || "",
        anual_turnover: userDetail?.anual_turnover || "",
        certificate: userDetail?.certificate || "",
        company: userDetail?.company || "",
        company_logo: userDetail?.company_logo !== '/' ? userDetail?.company_logo : [],
        company_portflio: userDetail?.company_portflio !== '/' ? userDetail?.company_portflio : [],
        certificate: userDetail?.certificate !== '/' ? userDetail?.certificate : [],
        company_type: userDetail?.company_type || "",
        company_website: userDetail?.company_website || "",
        contact: userDetail?.contact || "",
        gst_no: userDetail?.gst_no || "",
        industry: userDetail?.industry || "",
        key_customers: userDetail?.key_customers || "",
        past_project: userDetail?.past_project || "",
        urn: userDetail?.urn || "",
        services:userDetail.services?.split(","),
        importExportDocs: userDetail?.importExportDocs || [],
        year_of_establishment: userDetail?.year_of_establishment || "",
        iec_code: userDetail?.iec_code || "",
      });
    }
  }, [userDetail]);

 console.log("@@manufacturingProcess", manufacturingProcess);
  return (
    <>
    <div style={{ maxWidth: "1200px", background: "#fff", borderRadius: 8, padding: 24 }}>
          <h1 style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '20px' }}>
        Factory Profile
        <Button
          type="primary"
          icon={<EyeOutlined />}
          onClick={() => setIsModalVisible(true)}
        >
          Preview
        </Button>
      </h1>
      <Form layout="vertical" onFinish={onFinish} form={form} >
      <Row gutter={16}>
      <Col span={12}>
        <Form.Item name="company_logo" label="Company Logo" valuePropName="file">
            <Upload {...props("company_logo")} showUploadList={true}>
              <Button icon={<UploadOutlined />}>Upload Logo</Button>
            </Upload>
            {formData?.company_logo && <FilePreview filePath={formData?.company_logo} fileRootPath={fileRootPath} />}
        </Form.Item>
      </Col>
      <Col span={12}>
        <Form.Item name="company_portflio" label="Company Portfolio" valuePropName="file">
            <Upload {...props("company_portflio")} showUploadList={true}>
              <Button icon={<UploadOutlined />}>Upload Logo</Button>
            </Upload>
            {formData?.company_portflio && <FilePreview filePath={formData?.company_portflio} fileRootPath={fileRootPath} />}
        </Form.Item>
        </Col>
        <Col span={12}>
        <Form.Item name="certificate" label="Certificate" valuePropName="file"> 
          <Upload {...props("certificate")} showUploadList={true}>
            <Button icon={<UploadOutlined />}>Upload Certificate</Button>
            {formData?.certificate && <FilePreview filePath={formData?.certificate} fileRootPath={fileRootPath} />}
          </Upload>
        </Form.Item>
        </Col>
        <Col span={12}>

        {/* <Form.Item name="iec_code" label="Import Export Code (IEC)" rules={[{ required: true, message: "Please enter IEC code" }]}> 
        <Input placeholder="Enter IEC code" />
        </Form.Item> */}

        <Form.Item
        name="importExportDocs"
        label="Import/Export Documents"
        //rules={[{ required: true, message: "Please upload a document" }]}
        valuePropName="file"
        >
        <Upload {...props('importExportDocs')} multiple={true} showUploadList={true} >
        <Button icon={<UploadOutlined />}>Upload Document</Button>
        </Upload>
        {formData?.files && <FilePreview filePath={formData?.files} fileRootPath={fileRootPath} />}
        {/* {formData?.files} */}
        </Form.Item>
        </Col>
        <Col span={8}>

        {/* ISO Certification */}
        <Form.Item
          name="iso_certification"
          label="ISO Certification"
          rules={[{ required: true, message: "Please select an option" }]}
        >
          <Select placeholder="Select">
            <Option value="1">Yes</Option>
            <Option value="0">No</Option>
          </Select>
        </Form.Item>
        </Col>
      <Col span={8}>
        <Form.Item name="company" label="Company" rules={[{ required: true, message: "Please enter company name" }]}> 
            <Input placeholder="Enter company name" />
        </Form.Item>
      </Col>

      <Col span={8}>
        <Form.Item name="company_type" label="Company Type" rules={[{ required: true, message: "Please enter company type" }]}> 
            <Input placeholder="Enter company type" />
        </Form.Item>
      </Col>

      <Col span={8}>
        <Form.Item name="company_website" label="Company Website"> 
          <Input placeholder="Enter website URL" />
        </Form.Item>
      </Col>

      <Col span={8}>
        <Form.Item name="year_of_establishment" label="Year of Establishment" rules={[{ required: true, message: "Please enter year" }]}> 
          <Input type="number" placeholder="Enter year" />
        </Form.Item>
      </Col>

      <Col span={8}>
        {/* Number of Employees */}
        <Form.Item
          name="employeeCount"
          label="Number of Employees"
          rules={[{ required: true, message: "Please enter employee count" }]}
        >
          <Input type="number" placeholder="Enter the total number of employees"  />
        </Form.Item>
        </Col>

        <Col span={8}>
        <Form.Item name="anual_turnover" label="Annual Turnover" rules={[{ required: true, message: "Please enter annual turnover" }]}> 
          <Input placeholder="Enter turnover" />
        </Form.Item>
        </Col>
        
        <Col span={8}>

        <Form.Item name="address" label="Address" rules={[{ required: true, message: "Please enter address" }]}> 
          <Input placeholder="Enter address" />
        </Form.Item>
        </Col>
        <Col span={8}>
        <Form.Item name="contact" label="Contact" rules={[{ required: true, message: "Please enter contact" }]}> 
          <Input placeholder="Enter contact details" />
        </Form.Item>
        </Col>
        <Col span={8}>

        <Form.Item name="gst_no" label="GST No" rules={[{ required: true, message: "Please enter GST number" }]}> 
          <Input placeholder="Enter GST number" />
        </Form.Item>
        </Col>
       
        <Col span={8}>

        <Form.Item name="urn" label="Udhyam Registration No (URN)" rules={[{ required: true, message: "Please enter URN" }]}> 
          <Input placeholder="Enter URN" />
        </Form.Item>
        </Col>
        <Col span={8}>

        <Form.Item name="industry" label="Industry" rules={[{ required: true, message: "Please select an industry" }]}> 
          <Select placeholder="Select industry">
              <option value="">Select industry</option>
                {industriesType.map((type, index) => (
                  <option key={index} value={type}>{type}</option>
                ))}
          </Select>
        </Form.Item>
        </Col>
        <Col span={8}>

        <Form.Item name="key_customers" label="Key Customers"> 
          <Input.TextArea placeholder="Enter key customers" rows={3} />
        </Form.Item>
        </Col>
        <Col span={8}>

        <Form.Item name="past_project" label="Past Projects"> 
          <Input.TextArea placeholder="Describe past projects" rows={3} />
        </Form.Item>
        </Col>
        <Col span={8}>

        {/* Facilities Available */}
        {/* <Form.Item
          name="facilities"
          label="Facilities Available"
          rules={[{ required: true, message: "Please describe your facilities" }]}
        >
          <Input.TextArea placeholder="Describe the facilities your company offers" rows={3} />
        </Form.Item> */}

      <Col span={8}>
        <Form.Item name="about_us" label="About Us"> 
          <Input.TextArea placeholder="Tell us about yourself" rows={3} />
        </Form.Item>
      </Col>
        <Form.Item
          name="services"
          label="Services Available"
          //rules={[{ required: true, message: "Please describe your Services" }]}
        >
          <Select placeholder="Select Services" mode='multiple'>
              <Option value="Manufacturing Processes">Manufacturing Processes</Option>
              <Option value="Material Capabilities">Material Capabilities</Option>
              <Option value="Finishing Capabilities">Finishing Capabilities</Option>
              <Option value="Design Services">Design Services</Option>
          </Select>
        </Form.Item>        
        </Col>
        <Col span={8}>
        
                <Form.Item
                  label="Manufacturing Available"
                  name="manufacturing_process"
                  rules={[{ required: true, message: 'Manufacturing process is required!' }]}
                >
                  <Select placeholder="--Please choose an option--" mode= 'multiple'>
                    {manufacturingProcess.map((process) => (
                      <Option key={process.id} value={process.id}>{process.process_name}</Option>
                    ))}
                  </Select>
        </Form.Item>
        </Col>
        {/* Location */}
        {/* <Form.Item
          name="location"
          label="Company Location"
          rules={[{ required: true, message: "Please enter your company location" }]}
        >
          <Input placeholder="Enter your company location" />
        </Form.Item> */}
        <Col span={8}>
        <Form.Item
          name="freezone"
          label="Freezone"
          rules={[{ required: true, message: "Please select an option" }]}
        >
          <Select placeholder="Select">
            <Option value="1">Yes</Option>
            <Option value="0">No</Option>
          </Select>
        </Form.Item>
        </Col>
      

        {/* Submit Button */}
        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            Update Account
          </Button>
        </Form.Item>
        </Row>
      </Form>
    </div>
    
    <Modal
  title={<Title level={4} style={{ margin: 0 }}>Factory Profile</Title>}
  open={isModalVisible}
  onCancel={() => setIsModalVisible(false)}
  footer={null}
  width={1000}
  height={680}
  bodyStyle={{ padding: '5px' }}
  centered
>
  <Form layout="vertical">
    <Space direction="vertical" size="middle" style={{ width: '100%' }}>
      <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Documents & Media</Divider>
      <Row gutter={[16, 16]}>
        <Col span={6}><Text strong>Company Logo:</Text><br />{userDetail?.company_logo && <FilePreview filePath={userDetail?.company_logo} fileRootPath={fileRootPath} />}</Col>
        <Col span={6}><Text strong>Company Portfolio:</Text><br />{userDetail?.company_portflio && <FilePreview filePath={userDetail?.company_portflio} fileRootPath={fileRootPath} />}</Col>
        <Col span={6}><Text strong>Certificate:</Text><br />{userDetail?.certificate && <FilePreview filePath={userDetail?.certificate} fileRootPath={fileRootPath} />}</Col>
        <Col span={6}><Text strong>Import/Export Documents:</Text><br />{userDetail?.files && <FilePreview filePath={userDetail?.files} fileRootPath={fileRootPath} />}</Col>
      </Row>
      <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Basic Details</Divider>
      <Row gutter={[16, 16]}>
        <Col span={8}><Text strong>Company:</Text><br />{userDetail?.company}</Col>
        <Col span={8}><Text strong>Address:</Text><br />{userDetail?.address}</Col>
        <Col span={8}><Text strong>Contact:</Text><br />{userDetail?.contact}</Col>
        <Col span={8}><Text strong>GST No:</Text><br />{userDetail?.gst_no}</Col>
        <Col span={8}><Text strong>Industry:</Text><br />{userDetail?.industry}</Col>
        <Col span={8}><Text strong>Employee Count:</Text><br />{userDetail?.employeeCount}</Col>
        <Col span={8}><Text strong>Facilities:</Text><br />{userDetail?.facilities}</Col>
        <Col span={8}><Text strong>Location:</Text><br />{userDetail?.location}</Col>
        <Col span={8}><Text strong>ISO Certification:</Text><br />{userDetail?.iso_certification}</Col>
        <Col span={8}><Text strong>Freezone:</Text><br />{userDetail?.freezone ? 'Yes' : 'No'}</Col>
      </Row>
      <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Additional Info</Divider>
      <Row gutter={[16, 16]}>
        <Col span={8}><Text strong>URN:</Text><br />{userDetail?.urn}</Col>
        <Col span={8}><Text strong>Company Website:</Text><br /><a href={userDetail?.company_website} target="_blank">{userDetail?.company_website}</a></Col>
        <Col span={8}><Text strong>Company Type:</Text><br />{userDetail?.company_type}</Col>
        <Col span={8}><Text strong>About Us:</Text><br />{userDetail?.about_us}</Col>
        <Col span={8}><Text strong>Key Customers:</Text><br />{userDetail?.key_customers}</Col>
        <Col span={8}><Text strong>Past Project:</Text><br />{userDetail?.past_project}</Col>
        <Col span={8}><Text strong>Annual Turnover:</Text><br />{userDetail?.anual_turnover}</Col>
        <Col span={8}><Text strong>Year of Establishment:</Text><br />{userDetail?.year_of_establishment}</Col>
        <Col span={8}><Text strong>IEC Code:</Text><br />{userDetail?.iec_code}</Col>
      </Row>

      <Divider orientation="left" style={{ margin: '2px 0', fontSize: '16px' }}>Operations</Divider>
      <Row gutter={[16, 16]}>
        <Col span={8}><Text strong>Manufacturing Process:</Text><br />{(userDetail?.manufacturing_process || '')
            .split(',')
            .map(id => manufacturingProcess.find(p => p.id === id)?.process_name)
            .filter(Boolean)
            .map(name => <Tag key={name}>{name}</Tag>)
          }</Col> 
        <Col span={8}>
        <Text strong>Services:</Text><br />
        {(userDetail?.services || '')
          .split(',')
          .map(service => service.trim())
          .filter(Boolean)
          .map(service => <Tag key={service}>{service}</Tag>)
        }
      </Col>
      </Row>
    </Space>
  </Form>
</Modal>
  </>
  );
};

export default SupplierAccount;
