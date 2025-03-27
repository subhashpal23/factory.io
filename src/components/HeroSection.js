import React from "react";
import { Button, Typography, Row, Col } from "antd";
import styled from "styled-components";
import { useNavigate } from 'react-router-dom';

const { Title, Text } = Typography;

const HeroContainer = styled.div`
  background-image: url('/images/front/main-image.jpg');
  background-size: cover;
  background-position: center;
  height: 60vh;
  padding: 60px 20px;
  text-align: center;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;

  @media (max-width: 768px) {
    height: auto;
    padding: 40px 20px;
  }

  /* For mobile devices */
@media (max-width: 768px) {
  .ant-row {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .ant-col {
    width: 100% !important;
    margin-bottom: 4px; /* space between buttons */
  }

  .ant-btn {
    max-width: 100%; /* ensures buttons take full width of their container */
  }

  /* General styles */
.ant-typography {
  color: white;
  text-align: center; /* Ensures the text is centered horizontally */
}

.ant-typography h2 {
  font-weight: bold;
  font-size: 2rem; /* Default font size for larger screens */
  line-height: 1.5;
  word-break: break-word; /* Ensure long words break onto the next line */
}

.ant-typography p {
  font-size: 16px;
  line-height: 1.5;
  word-break: break-word; /* Ensure long words break onto the next line */
}

/* For mobile devices */
@media (max-width: 768px) {
  .ant-typography h2 {
    font-size: 1.5rem; /* Adjust font size for smaller screens */
    word-break: break-word; /* Break long words on mobile */
  }

  .ant-typography p {
    font-size: 14px; /* Adjust font size for smaller screens */
    word-break: break-word; /* Break long words on mobile */
    padding-left: 10px;
    padding-right: 10px;
  }

  /* Ensure the text aligns like buttons in Y-axis (vertical) */
  .ant-typography {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100%; /* Ensure it takes full height */
    width: 100%;
    margin: auto;
  }
}

}
`;

const HeroContent = styled.div`
  max-width: 800px;
  text-align: center;

  @media (max-width: 768px) {
    padding: 10px;
  }
`;


const HeroSection = () => {
  const navigate = useNavigate();

  return (
    <HeroContainer>
      <HeroContent>
        <Title level={2} style={{ fontSize: "3rem" ,fontWeight: "bold", color: "#0056b3",background: "rgba(211, 211, 211, 0.5)", }}>
        Welcome to DigiFactory.io
        </Title>
        <Text style={{  fontSize: "1.5rem", color: "#0056b3",fontWeight: "bold", background: "rgba(211, 211, 211, 0.59)", }}>
        Your Digital Marketplace for Seamless Manufacturing Solutions.
        </Text>
        <br />
        <Row gutter={[16, 16]} justify="center" style={{ marginTop: "20px" }}>
          <Col xs={12} sm={12} md={10}>
            <Button type="primary" size="large" block onClick={() => navigate("/consumer-registration")}>
             I Need Manufacturing
            </Button>
          </Col>
          <Col xs={12} sm={12} md={10}>
            <Button size="large" block onClick={() => navigate("/supplier-registration")}>
            I Provide Manufacturing Services
            </Button>
          </Col>
        </Row>
      </HeroContent>
    </HeroContainer>
  );
};

export default HeroSection;
