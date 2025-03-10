import React from "react";
import { Button, Row, Col, Typography } from "antd";
import styled from "styled-components";

const { Title, Paragraph } = Typography;

const Container = styled.div`
  background: #fff;
  padding: 50px 5%;

  @media (max-width: 768px) {
    padding: 30px 15%;
    margin: 0 15%;
  }
`;

const Image = styled.img`
  width: 90%;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);

  @media (max-width: 768px) {
    width: 100%;
  }
`;

const TextSection = styled.div`
  text-align: left;

  @media (max-width: 768px) {
    text-align: center;
  }
`;

const BottomHero = () => {
  return (
    <Container>
      <Row gutter={[32, 32]} align="middle">
        {/* Left: Image Section */}
        <Col xs={24} md={12}>
          <Image
            src="/images/factory-workers-768x513.jpg"
            alt="Manufacturing Process"
          />
        </Col>

        {/* Right: Text Section */}
        <Col xs={24} md={12}>
          <TextSection>
            <Title level={2}>
              How Trump’s Proposed Tariffs on Imports Could Reshape Supply Chains and Boost U.S. Manufacturing
            </Title>
            <Paragraph style={{ fontSize: "16px", color: "#595959" }}>
              Discover how the Trump Administration's proposed tariffs on imports
              are reshaping global supply chains and creating new opportunities
              for U.S. manufacturers. Learn what tariffs are, how they impact
              sourcing strategies, and actionable steps buyers and manufacturers
              can take to adapt and thrive in a competitive market.
            </Paragraph>
            <Paragraph style={{ fontSize: "16px", color: "#595959" }}>
              Explore the benefits of domestic manufacturing and prepare for the shift
              with insights from industry experts.
            </Paragraph>
            <Button type="primary" size="large" style={{ marginTop: "20px" }}>
              Read More
            </Button>
          </TextSection>
        </Col>
      </Row>
    </Container>
  );
};

export default BottomHero;
