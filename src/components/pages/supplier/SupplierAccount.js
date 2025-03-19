import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from 'react-redux';
import { Form, Input, Select, Upload, Button, message } from "antd";
import { updateAccount, getUserInfo } from '../../../redux/actions/userActions';
import { UploadOutlined } from "@ant-design/icons";

const { Option } = Select;

const SupplierAccount = () => {
  const dispatch = useDispatch();
  const [form] = Form.useForm();
  const [loading, setLoading] = useState(false);
  const token = useSelector((state) => state.auth.logindata.token);
  const accountUpdateStatus = useSelector((state) => state.user.accountUpdateStatus);
  const userDetail = useSelector((state) => state.user.userDetail);


   const [formData, setFormData] = useState({
      employeeCount:  0,
      facilities: '',
      location: '',
      files: []
    });


    const onFinish = (values) => {
      console.log("values", values, formData);
       //setLoading(true);
        const dataToSend = {
          ...formData,
          employeeCount: values.employeeCount,
          facilities: values.facilities,
          location: values.location,
          iso_certification: values.iso_certification,
          files: formData.files[0],
        };
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
          return { ...prevState, files: [...prevState?.files, result[0]]};
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
      files: formData.files[0],
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
        files: userDetail?.files || []
      });
    }
  }, [userDetail]);

  return (
    <div style={{ maxWidth: "600px", background: "#fff", borderRadius: 8 }}>
      <h1 style={{marginBottom:"20px"}}> Factory Profile</h1>
      <Form layout="vertical" onFinish={onFinish} form={form} >
        {/* Number of Employees */}
        <Form.Item
          name="employeeCount"
          label="Number of Employees"
          rules={[{ required: true, message: "Please enter employee count" }]}
        >
          <Input type="number" placeholder="Enter the total number of employees"  />
        </Form.Item>

        {/* Facilities Available */}
        <Form.Item
          name="facilities"
          label="Facilities Available"
          rules={[{ required: true, message: "Please describe your facilities" }]}
        >
          <Input.TextArea placeholder="Describe the facilities your company offers" rows={3} />
        </Form.Item>

        {/* Location */}
        <Form.Item
          name="location"
          label="Company Location"
          rules={[{ required: true, message: "Please enter your company location" }]}
        >
          <Input placeholder="Enter your company location" />
        </Form.Item>

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

        {/* Import/Export Documents */}
        <Form.Item
          name="importExportDocs"
          label="Import/Export Documents"
          //rules={[{ required: true, message: "Please upload a document" }]}
          valuePropName="file"
        >
           <Upload {...props('importExportDocs')} multiple={true} showUploadList={true} >
              <Button icon={<UploadOutlined />}>Upload Document</Button>
            </Upload>
            {/* {formData?.files} */}
        </Form.Item>

        {/* Submit Button */}
        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            Update Account
          </Button>
        </Form.Item>
      </Form>
    </div>
  );
};

export default SupplierAccount;
