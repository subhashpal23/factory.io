import React from "react";
import { Button, Typography, Row, Col } from "antd";
import styled from "styled-components";

const { Title, Text } = Typography;

const HeroContainer = styled.div`
  background-image: url('https://mfgproductionimages.s3.us-west-1.amazonaws.com/wp-content/uploads/20231206165806/Header-1.png');
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
    width: 50%;
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
  return (
    <HeroContainer>
      <HeroContent>
        <Title level={2} style={{ fontWeight: "bold", color: "white" }}>
          Find And Work With Your Best-Fit Manufacturer
        </Title>
        <Text style={{ fontSize: "16px", color: "white" }}>
          Streamline your procurement processes with MFG. Submit a quote request, 
          find a manufacturer, and manage your order, all in one place.
        </Text>
        <br />
        <Row gutter={[16, 16]} justify="center" style={{ marginTop: "20px" }}>
          <Col xs={12} sm={12} md={10}>
            <Button type="primary" size="large" block>
              Find a Manufacturer
            </Button>
          </Col>
          <Col xs={12} sm={12} md={10}>
            <Button size="large" block>
              Find Manufacturing Customers
            </Button>
          </Col>
        </Row>
      </HeroContent>
    </HeroContainer>
  );
};

export default HeroSection;
