import React from "react";
import { Button, Typography, Row, Col } from "antd";

const { Title, Text } = Typography;

const HeroSection = () => {
    return (
      <div
        style={{
          backgroundImage: "url('https://mfgproductionimages.s3.us-west-1.amazonaws.com/wp-content/uploads/20231206165806/Header-1.png')",
          backgroundSize: "cover",
          backgroundPosition: "center",
          height:"60vh",
          padding: "80px 20px",
          textAlign: "center",
          color: "white",
        }}
      >
        <div style={{ maxWidth: "800px", margin: "16vh auto" }}>
          <Title level={2} style={{ fontWeight: "bold", color: "white" }}>
            Find And Work With Your Best-Fit Manufacturer
          </Title>
          <Text style={{ fontSize: "16px", color: "white" }}>
            Streamline your procurement processes with MFG. Submit a quote
            request, find a manufacturer, and manage your order, all in one place.
          </Text>
          <br />
          <div style={{ marginTop: "20px" }}>
            <Button type="primary" size="large" style={{ marginRight: "20px" }}>
              Find a Manufacturer
            </Button>
            <Button size="large">Find Manufacturing Customers</Button>
          </div>
        </div>
      </div>
    );
  };

  export default HeroSection;