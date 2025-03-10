import React from "react";
import { Row, Col, Typography, Button } from "antd";
import styled from "styled-components";

const { Title, Text } = Typography;

const steps = [
  {
    title: "Get Quotes",
    description: "Submit your design files and quickly receive quotes from manufacturers.",
    image: "/images/Screenshot-Get-Quote-@2x.png",
  },
  {
    title: "Choose a Manufacturer",
    description: "Compare quotes and choose a manufacturer you trust.",
    image: "/images/Screenshot-Choose-Manufacturer-@2x.png",
  },
  {
    title: "Pay & Manage Your Order",
    description: "Communicate with your supplier, get live status updates, and pay for your order, all through MFG.",
    image: "/images/Screenshot-Manage-Order-@2x.png",
  },
];

const Container = styled.div`
  padding: 60px 5%;
  text-align: center;
  background: #f9f9f9;

  @media (max-width: 768px) {
   padding: 30px 12%;
   margin: 0 15%;
  }
`;

const StepCard = styled.div`
  border-radius: 10px;
  padding: 20px;
  text-align: center;
  background: #fff;
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
  height: 400px;

  &:hover {
    box-shadow: 0px 8px 10px rgba(0, 102, 255, 0.5);
    transform: scale(1.02);
  }

   @media (max-width: 768px) {
     height: 340px;
  }
`;

const StepImage = styled.img`
  width: 100%;
  height: auto;
  border-radius: 10px;
  margin-bottom: 15px;

  @media (max-width: 768px) {
    max-height: 180px;
  }
`;

const StepsToManufacture = () => {
  return (
    <Container>
      <Title level={2}>3 Easy Steps to Getting Your Custom Part Manufactured</Title>
      <Row gutter={[32, 32]} justify="center">
        {steps.map((step, index) => (
          <Col xs={24} sm={12} md={8} key={index}>
            <StepCard>
              <StepImage src={step.image} alt={step.title} />
              <Title level={4}>0{index + 1}. {step.title}</Title>
              <Text>{step.description}</Text>
            </StepCard>
          </Col>
        ))}
      </Row>
      <Button type="primary" size="large" style={{ marginTop: "30px" }}>
        Get Quotes
      </Button>
    </Container>
  );
};

export default StepsToManufacture;