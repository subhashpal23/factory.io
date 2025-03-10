import React from "react";
import { Row, Col, Typography } from "antd";
import styled from "styled-components";

const { Title } = Typography;

const manufacturingSolutions = [
  { title: "CNC Machining", image: "/images/manufacturing/Solutions-CNC-@2x.jpg" },
  { title: "Sheet Metal Assembly", image: "/images/manufacturing/Solutions-Sheet-Metal-@2x.jpg" },
  { title: "Injection Molding", image: "/images/manufacturing/Solutions-Injection-Molding-@2x.jpg" },
  { title: "Engineering & Design Services", image: "/images/manufacturing/Solutions-Engineering-@2x.jpg" },
  { title: "3D Printing", image: "/images/manufacturing/Solutions-3DP-@2x-1.jpg" },
  { title: "Fabrication", image: "/images/manufacturing/Solutions-Fabrication-@2x.jpg" },
  { title: "Metal Stamping", image: "/images/manufacturing/Solutions-Metal-Stamping-@2x.jpg" },
  { title: "Milling & Turning", image: "/images/manufacturing/Solutions-Milling-@2x.jpg" },
];

const Container = styled.div`
  padding: 50px 5%;
  text-align: center;
  background: #f8f8f8;

  @media (max-width: 768px) {
    padding: 30px 18%;
    margin: 0 12%;
  }
`;

const SolutionCard = styled.div`
  position: relative;
  border-radius: 12px;
  overflow: hidden;
  cursor: pointer;
  transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;

  &:hover {
    box-shadow: 0px 8px 10px rgba(0, 102, 255, 0.5);
    border-top: 8px solid #0066ff;
  }
`;

const SolutionImage = styled.img`
  width: 100%;
  height: auto;
  max-height: 240px;
  object-fit: cover;
  border-radius: 12px;
  display: block;

  @media (max-width: 768px) {
    max-height: 180px;
  }
`;

const SolutionTitle = styled.div`
  position: absolute;
  top: 24px;
  left: 8px;
  color: #fff;
  font-size: 1.4rem;
  font-weight: bold;
  padding: 5px 20px;
  border-radius: 4px;
  text-align: left;
  //background: rgba(0, 0, 0, 0.6);

  @media (max-width: 768px) {
    font-size: 1.2rem;
    padding: 5px 10px;
  }
`;

const PopularSolutions = () => {
  return (
    <Container>
      <Title level={2} style={{ fontWeight: "bold" }}>Popular Manufacturing Solutions</Title>
      <Row gutter={[24, 24]} justify="center" style={{ marginTop: "50px" }}>
        {manufacturingSolutions.map((solution, index) => (
          <Col xs={24} sm={12} md={8} lg={6} key={index}>
            <SolutionCard>
              <SolutionImage src={solution.image} alt={solution.title} />
              <SolutionTitle>{solution.title}</SolutionTitle>
            </SolutionCard>
          </Col>
        ))}
      </Row>
    </Container>
  );
};

export default PopularSolutions;