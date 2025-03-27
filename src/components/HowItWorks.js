import React from "react";
import { Row, Col, Typography } from "antd";
import styled from "styled-components";

const { Title } = Typography;

const steps = [
  {
    number: "1",
    title: "Post Project",
    description: "Submit your manufacturing requirements with specifications and drawings.",
  },
  {
    number: "2",
    title: "Receive Quotes",
    description: "Get competitive quotes from verified manufacturing suppliers.",
  },
  {
    number: "3",
    title: "Select Supplier",
    description: "Choose the best supplier based on price, quality, and lead time.",
  },
  {
    number: "4",
    title: "Track Production",
    description: "Monitor progress and communicate directly with your supplier.",
  },
  {
    number: "5",
    title: "Receive Parts",
    description: "Get your quality-checked parts delivered to your location.",
  },
];

const Container = styled.div`
  padding: 50px 0%;
  text-align: center;
  background: white;
`;

const StepCard = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
`;

const NumberCircle = styled.div`
  width: 50px;
  height: 50px;
  background: #0056b3;
  color: white;
  font-size: 22px;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  margin-bottom: 15px;
`;

const StepTitle = styled.h3`
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 10px;
`;

const StepText = styled.p`
  font-size: 14px;
  color: #555;
  max-width: 250px;
`;

const HowItWorks = () => {
  return (
    <Container id="how-it-works">
      <Title level={2} style={{ fontWeight: "bold", color: "#0056b3" }}>
        How It Works
      </Title>
      <Row gutter={[24, 24]} justify="center" style={{ marginTop: "50px" }}>
        {steps.map((step, index) => (
          <Col xs={24} sm={12} md={8} lg={4} key={index}>
            <StepCard>
              <NumberCircle>{step.number}</NumberCircle>
              <StepTitle>{step.title}</StepTitle>
              <StepText>{step.description}</StepText>
            </StepCard>
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default HowItWorks;
