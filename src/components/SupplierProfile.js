import React, { useState } from "react";
import { Form, Input, Select, Upload, Button, message } from "antd";
import { UploadOutlined } from "@ant-design/icons";
import axios from "axios";

const { Option } = Select;

const SupplierProfile = () => {
  const [loading, setLoading] = useState(false);

  const onFinish = async (values) => {
    setLoading(true);
    try {
      // Extract file information
      const file = values.importExportDocs?.file?.originFileObj || null;
      const formData = new FormData();
      
      formData.append("employeeCount", values.employeeCount);
      formData.append("facilities", values.facilities);
      formData.append("location", values.location);
      formData.append("isoCertification", values.isoCertification);
      if (file) {
        formData.append("importExportDocs", file);
      }

      // API Call
      const response = await axios.post("/api/supplier/profile", formData, {
        headers: { "Content-Type": "multipart/form-data" },
      });

      if (response.status === 200) {
        message.success("Profile saved successfully!");
      } else {
        message.error("Failed to save profile.");
      }
    } catch (error) {
      message.error("Error saving profile. Please try again.");
    }
    setLoading(false);
  };

  return (
    <div style={{ maxWidth: 600, margin: "auto", padding: 20, background: "#fff", borderRadius: 8 }}>
      <h2>Company Profile</h2>
      <Form layout="vertical" onFinish={onFinish}>
        {/* Number of Employees */}
        <Form.Item
          name="employeeCount"
          label="Number of Employees"
          rules={[{ required: true, message: "Please enter employee count" }]}
        >
          <Input type="number" placeholder="Enter the total number of employees" />
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
          name="isoCertification"
          label="ISO Certification"
          rules={[{ required: true, message: "Please select an option" }]}
        >
          <Select placeholder="Select">
            <Option value="Yes">Yes</Option>
            <Option value="No">No</Option>
          </Select>
        </Form.Item>

        {/* Import/Export Documents */}
        <Form.Item
          name="importExportDocs"
          label="Import/Export Documents"
          rules={[{ required: true, message: "Please upload a document" }]}
          valuePropName="file"
        >
          <Upload beforeUpload={() => false} maxCount={1}>
            <Button icon={<UploadOutlined />}>Upload Document</Button>
          </Upload>
        </Form.Item>

        {/* Submit Button */}
        <Form.Item>
          <Button type="primary" htmlType="submit" loading={loading}>
            Save Changes
          </Button>
        </Form.Item>
      </Form>
    </div>
  );
};

export default SupplierProfile;
