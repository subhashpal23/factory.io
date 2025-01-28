import React, { useEffect, useState } from 'react';
import { Form, Input, Select, Button, message } from 'antd';
import { CountryCodes } from './../Registration/constants';
import { useDispatch, useSelector } from 'react-redux';
import moment from 'moment';
import { createRfq ,resetRfcCreateStatus } from '../../redux/actions/rfqAction';
import '@ant-design/v5-patch-for-react-19';
import { notification } from 'antd';
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
    add_date: moment().format('YYYY-MM-DD')
  });




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
        add_date: moment().format('YYYY-MM-DD')
      });
      
      dispatch(resetRfcCreateStatus())
      form.resetFields(); 
    }
  }, [rfqCreateStatus]);

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

  return (
    <>
      <h1 style={{ padding: "20px 250px" }}>Create RFQ</h1>
      <Form
        form={form}
        layout="vertical"
        onFinish={onFinish}
        onFinishFailed={onFinishFailed}
        style={{ padding: "50px 250px" }}
      >
        <Form.Item
          label="Name"
          name="name"
          rules={[{ required: true, message: 'Name is required!' }]}
          placeholder="Name"
        >
          <Input placeholder="Name" />
        </Form.Item>

        <Form.Item
          label="Email Address"
          name="email"
          rules={[{ required: true, message: 'Email is required!' }]}
        >
          <Input placeholder="Your email" />
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
              <Select style={{ width: '30%' }} placeholder="Code">
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
              <Input style={{ width: '70%' }} placeholder="contact" />
            </Form.Item>
          </Input.Group>
        </Form.Item>

        <Form.Item
          label="Company Name"
          name="company"
          rules={[{ required: true, message: 'Company name is required!' }]}
        >
          <Input placeholder="company" />
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
          <Select placeholder="--Please choose an option--">
            <Option value="yes">Yes</Option>
            <Option value="no">No</Option>
          </Select>
        </Form.Item>

        <Form.Item
          label="Comments"
          name="comments"
          rules={[{ required: true, message: 'Type your message here' }]}
        >
          <TextArea rows={4} placeholder="Type your message here" />
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
