import React from "react";
import { Row, Col, Typography } from "antd";
import styled from "styled-components";

const { Title } = Typography;

const platformFeatures = [
  {
    title: "RFQ Management",
    description: "Submit detailed RFQs with ease, including CAD designs and BOMs, and get matched with verified Suppliers",
    icon: "🔄"
  },
  {
    title: "Trusted Supplier Network",
    description: "Gain access to a marketplace of vetted and reliable manufacturers ready to provide solutions.",
    icon: "🛡️"
  },
  {
    title: "Real-Time Collaboration",
    description: "Get competitive quotes from Suppliers to your requirements and finalize deals.",
    icon: "✈️"
  },
  {
    title: "Timeline Visualization",
    description: "Stay on top of your projects with our intuitive timeline tracking system, ensuring your manufacturing stays on schedule.",
    icon: "⌚"
  }
];

const Container = styled.div`
  padding: 50px 5%;
  text-align: center;
  background: #f8f9fc;
`;

const FeatureCard = styled.div`
  height: 280px;
  background: white;
  border-radius: 15px;
  padding: 50px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  text-align: center;
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
  
  &:hover {
    transform: translateY(-5px);
    box-shadow: 0px 8px 15px rgba(0, 86, 179, 0.3);
  }
`;

const IconContainer = styled.div`
  width: 50px;
  height: 50px;
  background: #eef2ff;
  border-radius: 50%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 auto 15px;
`;

const Icon = styled.img`
  width: 40px;
  height: 40px;
`;

const FeatureTitle = styled.h2`
  color: #0056b3;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 20px;
`;

const FeatureText = styled.p`
  font-size: 16px;
  color: #555;
`;

const WhyChoose = () => {
  return (
    <Container>
      <Title level={2} style={{ fontWeight: "bold", color: "#0056b3" }}>Why Choose DigiFactory.io?</Title>
      <Row gutter={[24, 24]} justify="center" style={{ marginTop: "30px" }}>
        {platformFeatures.map((feature, index) => (
          <Col xs={24} sm={12} md={8} lg={6} key={index}>
            <FeatureCard>
              <IconContainer>
              {feature.icon}
              </IconContainer>
              <FeatureTitle>{feature.title}</FeatureTitle>
              <FeatureText>{feature.description}</FeatureText>
            </FeatureCard>
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default WhyChoose;
