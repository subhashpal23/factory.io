import React, { useEffect, useState } from 'react';
import { API_URL } from '../../utils/Config';
import { Form, Input, Select, Button, message } from 'antd';
import { CountryCodes } from './../Registration/constants';
import { useDispatch, useSelector } from 'react-redux';
import moment from 'moment';
import { createRfq ,resetRfcCreateStatus, getProductList } from '../../redux/actions/rfqAction';
import { getUserInfo } from '../../redux/actions/userActions';
import '@ant-design/v5-patch-for-react-19';
import { MinusCircleOutlined, PlusOutlined, UploadOutlined  } from '@ant-design/icons';
import { notification, Space, Upload, UploadProps } from 'antd';
// import { getProductList } from '../../redux/actions/rfqAction';
const { Option } = Select;
const { TextArea } = Input;

const CreateRFQ = () => {
  const dispatch = useDispatch();
  const [form] = Form.useForm();
  const [fieldsTouched, setFieldsTouched] = useState({});
  const token = useSelector((state) => state.auth.logindata.token);
  const manufacturingProcess = useSelector((state) => state.auth.logindata.manufacturing_process);
  const loggedUserEmail = useSelector((state) => state.auth.logindata.data.email);
  const rfqCreateStatus = useSelector((state) => state.rfq.rfqCreateStatus);
  const { productList, error } = useSelector((state) => state.rfq); 
  const userDetail = useSelector((state) => state.user.userDetail);

  const [formData, setFormData] = useState({
    name: '',
    email: '',
    country_code: '',
    mobile: '',
    company_name: '',
    manufacturing_process_id: '',
    is_design_file: '',
    comments: '',
    add_by: loggedUserEmail,
    add_date: moment().format('YYYY-MM-DD'),
    files: []
  });

   useEffect(() => {
      if (token) {
        dispatch(getProductList(token));
        dispatch(getUserInfo(token));
      }
    }, [dispatch, token]);

  useEffect(() => {
    if (rfqCreateStatus) {
      setFormData({
        name: '',
        email: '',
        country_code: '',
        mobile: '',
        company_name: '',
        manufacturing_process_id: '',
        is_design_file: '',
        comments: '',
        add_by: loggedUserEmail,
        add_date: moment().format('YYYY-MM-DD'),
        files: []
      });
      
      dispatch(resetRfcCreateStatus())
      form.resetFields(); 
    }
  }, [rfqCreateStatus]);

  // useEffect(()=>{
  //    setFormData({...formData, email: userDetail?.email, name: userDetail?.name, countryCode: userDetail?.country_code, 
  //     phoneNumber: userDetail?.phone_number,
  //     company:  userDetail?.company
  //   })
  // }, [userDetail])

  const onFinish = (values) => {
    const dataToSend = {
      ...formData,
      name: values.name,
      email: values.email,
      country_code: values.countryCode,
      mobile: values.phoneNumber,
      company_name: values.company,
      manufacturing_process_id: values.manufacturingProcess,
      is_design_file: values.designFiles === 'yes' ? '1' : '0',
      comments: values.comments,
      files: values?.files?.map((file, index) => ({
        product: file.product,
        quantity: file.quantity,
        files: formData.files[index]?.files || []
      } || []))
    };
    setFormData(dataToSend);
    dispatch(createRfq(dataToSend, token));
  };

  const onFinishFailed = ({ errorFields }) => {
    const touchedFields = {};
    errorFields.forEach(field => {
      touchedFields[field.name[0]] = true;
    });
    setFieldsTouched(touchedFields);
    message.error('Please complete all required fields.');
  };

  const handleFileUpload = async (file, fieldKey) => {
    const formData = new FormData();
    formData.append('upload[0]', file);
  
    try {
     const response = await fetch(`${API_URL}/Api/multipleDocUpload`, {
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
          const updatedFiles = [...prevState.files];
          if (!updatedFiles[fieldKey]) {
            updatedFiles[fieldKey] = { files: [] };
          }
          updatedFiles[fieldKey].files.push(result[0]);
          return { ...prevState, files: updatedFiles };
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

  return (
    <>
      <h1 style={{ padding: "20px 10%" }}>Create RFQ</h1>
      <Form
        form={form}
        layout="vertical"
        onFinish={onFinish}
        onFinishFailed={onFinishFailed}
        style={{ padding: "20px 10%" }}
        initialValues={{
          name: userDetail?.name,
          email: userDetail?.email,
          countryCode: userDetail?.country_code, 
          phoneNumber: userDetail?.phone_number,
          company:  userDetail?.company
        }}
      >
        <Form.Item
          label="Name"
          name="name"
          rules={[{ required: true, message: 'Name is required!' }]}
        >
          <Input placeholder="Name" disabled />
        </Form.Item>

        <Form.Item
          label="Email Address"
          name="email"
          rules={[{ required: true, message: 'Email is required!' }]}
        >
          <Input placeholder="Your email" disabled />
        </Form.Item>

        <Form.Item
          label="Mobile Phone Number"
          required
        >
          <Input.Group compact>
            <Form.Item
              name="countryCode"
              noStyle
              rules={[{ required: true, message: 'Country code is required!' }]}
            >
              <Select style={{ width: '30%' }} placeholder="Code" defaultValue={formData?.country_code}>
                {CountryCodes.map((country, index) => (
                  <Option key={`${country.code}-${index}`} value={country.code}>  {country.name} ({country.code}) </Option>
                ))}
              </Select>
            </Form.Item>
            <Form.Item
              name="phoneNumber"
              noStyle
              rules={[{ required: true, message: 'Phone number is required!' }]}
            >
              <Input style={{ width: '70%' }} placeholder="contact" defaultValue={formData?.mobile} />
            </Form.Item>
          </Input.Group>
        </Form.Item>

        <Form.Item
          label="Company Name"
          name="company"
          rules={[{ required: true, message: 'Company name is required!' }]}
        >
          <Input placeholder="Company" disabled />
        </Form.Item>

        <Form.Item
          label="Which manufacturing process are you looking for?"
          name="manufacturingProcess"
          rules={[{ required: true, message: 'Manufacturing process is required!' }]}
        >
          <Select placeholder="--Please choose an option--">
            {manufacturingProcess.map((process) => (
              <Option key={process.id} value={process.id}>{process.process_name}</Option>
            ))}
          </Select>
        </Form.Item>

        <Form.Item
          label="Do you have the design files?"
          name="designFiles"
          rules={[{ required: true, message: 'Do you have any design files?' }]}
        >
          <Select placeholder="--Please choose an option--" onChange={(value)=> setFormData({...formData, is_design_file: value ==='yes' ? true : false})}>
            <Option value="yes">Yes</Option>
            <Option value="no">No</Option>
          </Select>
        </Form.Item>
        {formData?.is_design_file && (
        <Form.List name="files">
          {(fields, { add, remove }) => (
            <>
              {fields.map(({ key, name, ...restField }) => (
                <Space key={key} style={{ display: 'flex', marginBottom: 8, flexWrap: 'wrap' }} align="baseline">
                  <Form.Item
                    {...restField}
                    name={[name, 'product']}
                    rules={[{ required: true, message: 'Missing Product' }]}
                  >
                    <Input placeholder="Product" />
                  </Form.Item>
                  <Form.Item
                    {...restField}
                    name={[name, 'quantity']}
                    rules={[{ required: true, message: 'Missing Quantity' }]}
                  >
                    <Input placeholder="Quantity" />
                  </Form.Item>
                  <Form.Item>
                    <Upload {...props(key)} multiple={true} showUploadList={true}>
                      <Button icon={<UploadOutlined />}>Click to Upload</Button>
                    </Upload>
                  </Form.Item>
                  <MinusCircleOutlined onClick={() => remove(name)} />
                </Space>
              ))}
              <Form.Item>
                <Button type="dashed" onClick={() => add()} block icon={<PlusOutlined />} disabled={fields.length >= 10}>
                  Add Files
                </Button>
              </Form.Item>
            </>
          )}
        </Form.List>)}
        <Form.Item
          label="Comments"
          name="comments"
          rules={[{ required: true, message: 'Type your message here', }]}
        >
          <TextArea rows={4} placeholder="Type your message here" maxLength={1024} showCount />
        </Form.Item>

        <Form.Item>
          <Button type="primary" htmlType="submit" style={{ float: 'right' }}>
            Submit
          </Button>
        </Form.Item>
      </Form>
    </>
  );
};

export default CreateRFQ;
