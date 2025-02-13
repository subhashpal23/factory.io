import React from "react";
import { Row, Col, Card, Typography, Button } from "antd";

const { Title, Text } = Typography;

const steps = [
  {
    title: "Get Quotes",
    description: "Submit your design files and quickly receive quotes from manufacturers.",
    image: "/images/Screenshot-Get-Quote-@2x.png", // Replace with actual image URL
  },
  {
    title: "Choose a Manufacturer",
    description: "Compare quotes and choose a manufacturer you trust.",
    image: "/images/Screenshot-Choose-Manufacturer-@2x.png", // Replace with actual image URL
  },
  {
    title: "Pay & Manage Your Order",
    description: "Communicate with your supplier, get live status updates, and pay for your order, all through MFG.",
    image: "/images/Screenshot-Manage-Order-@2x.png", // Replace with actual image URL
  },
];

const StepsToManufacture = () => {
  return (
    <div style={{ padding: "60px 20px", textAlign: "center", background: "#f9f9f9" }}>
    <Title level={2}>3 Easy Steps to Getting Your Custom Part Manufactured</Title>
    <Row gutter={[32, 32]} justify="center">
      {steps.map((step, index) => (
        <Col xs={24} sm={12} md={8} key={index}>
          <Card
            hoverable
            style={{
              borderRadius: "10px",
              padding: "20px",
              textAlign: "center",
            }}
          >
            <img
              src={step.image}
              alt={step.title}
              style={{ width: "100%", borderRadius: "10px", marginBottom: "15px" }}
            />
            <Title level={4}>
              0{index + 1}. {step.title}
            </Title>
            <Text>{step.description}</Text>
          </Card>
        </Col>
      ))}
    </Row>
    <Button type="primary" size="large" style={{ marginTop: "30px" }}>
      Get Quotes
    </Button>
  </div>
  );
};

export default StepsToManufacture;
