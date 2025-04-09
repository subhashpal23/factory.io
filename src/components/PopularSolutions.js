import React from "react";
import { Row, Col, Typography } from "antd";
import styled from "styled-components";
import { useNavigate } from "react-router-dom";

const { Title } = Typography;

const manufacturingSolutions = [
  { title: "Conventional Machining", image: "/images/front/conventional-machining.jpg", href: "/manufacturing/conventional-machining" },
  { title: "CNC Machining", image: "/images/front/CNC-machining1.png", href: "/manufacturing/cnc-machining" },
  { title: "Casting", image: "/images/front/casting-2.jpg", href: "/manufacturing/casting" },
  { title: "Metal Fabrication", image: "/images/front/fabrication1.jpg", href: "/manufacturing/metal-fabrication" },
  { title: "Anodizing and Coating", image: "/images/front/anodizing.jpg", href: "/manufacturing/anodizing-coating" },
  { title: "Plasma Cutting", image: "/images/front/howard-r-wheeler-EueYQgD7cms-unsplash.jpg", href: "/manufacturing/plasma-cutting" },
  { title: "Laser Cutting", image: "/images/front/laser-cutting.jpg", href: "/manufacturing/laser-cutting" },
  { title: "Waterjet Cutting", image: "/images/front/waterjetmachining.jpg", href: "/manufacturing/waterjet-cutting" },
];

// ✅ New Wrapper for consistent page padding
const Wrapper = styled.div`
  padding: 50px 16px;
  background: #f8f8f8;
  display: flex;
  justify-content: center;
`;

const Container = styled.div`
  max-width: 1200px;
  width: 100%;
  text-align: center;
  @media (max-width: 768px) {
       width: 350px;
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
  min-height: 240px;
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

  @media (max-width: 768px) {
    font-size: 1.2rem;
    padding: 5px 10px;
  }
`;

const PopularSolutions = () => {
  const navigate = useNavigate();
  return (
    <Wrapper>
      <Container>
        <Title level={2} style={{ fontWeight: "bold", color: "#0056b3" }}>
          Manufacturing Processes
        </Title>
        <Row gutter={[24, 24]} justify="center" style={{ marginTop: "50px" }}>
          {manufacturingSolutions.map((solution, index) => (
            <Col
              xs={24}
              sm={12}
              md={8}
              lg={6}
              key={index}
              onClick={() => navigate(solution.href)}
            >
              <SolutionCard>
                <SolutionImage src={solution.image} alt={solution.title} />
                <SolutionTitle>{solution.title}</SolutionTitle>
              </SolutionCard>
            </Col>
          ))}
        </Row>
      </Container>
    </Wrapper>
  );
};

export default PopularSolutions;
