import React from "react";
import styled from "styled-components";
import { Row, Col, Typography } from "antd";

const { Title } = Typography;

const industries = [
  { name: "Automotive", icon: "🚏" },
  { name: "Electronics", icon: "⚡" },
  { name: "Medical", icon: "⚕️" },
 { name: "Stone Industry", icon: "💎" },
 { name: "Woodworking", icon: "🪵" },
 { name: "Heavy Machinery", icon: "🟰" },
  { name: "Renewable Energy", icon: "🔋" },
  { name: "Marine Industry", icon: "🪼" },
  { name: "Defense", icon: "🪖" },
  { name: "Consumer", icon: "🛍️" },
   { name: "Oil and Gas", icon: "🛢️" },
  { name: "Power Generation", icon: "🔌" },
  { name: "Aerospace", icon: "🚀" },
  { name: "Consumer Goods", icon: "🏪" },
   { name: "Robotics", icon: "🤖" },
];

const Section = styled.div`
  padding: 60px 5%;
  text-align: center;
  background: #fff;

  @media (max-width: 768px) {
    padding: 40px 10%;
  }
`;

const IndustryCard = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
`;

const IconWrapper = styled.div`
  width: 60px;
  height: 60px;
  background: #f0f5ff;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 10px;
`;

const IconImage = styled.img`
  width: 50px;
  height: 50px;
  object-fit: contain;
`;

const Industry = () => {
  return (
    <Section id="industries-we-serve">
      <Title level={2} style={{ fontWeight: "bold", color: "#0056b3" }}>
        Industries We Serve
      </Title>
      <Row gutter={[24, 24]} justify="center" style={{ marginTop: "40px" }}>
        {industries.map((industry, index) => (
          <Col xs={12} sm={8} md={6} lg={3} key={index}>
            <IndustryCard>
              <IconWrapper>
              {industry.icon}
              </IconWrapper>
              <p style={{ fontSize: "16px", fontWeight: "500", color: "#0056b3", fontWeight: "bold", fontSize:"20px " }}>{industry.name}</p>
            </IndustryCard>
          </Col>
        ))}
      </Row>
    </Section>
  );
};

export default Industry;
