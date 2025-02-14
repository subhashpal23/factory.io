import React from "react";
import { Layout, Row, Col, Typography } from "antd";

const { Footer : AntFooter } = Layout;
const { Title, Text } = Typography;

const textFooterStyle = { display: "block", color: "#b0b0b0" , padding:"5px 0px", color: "white" };

const Footer = () => {
  return (
    <AntFooter style={{ background: "#0d0f11", color: "#fff", padding: "5% 0% 8% 16%", borderTop: "1px solid gray"}}>
      <Row justify="start">
        <Col span={6}>
          <Title level={3} style={{ color: "#fff" }}>
           DigiFactory.io
          </Title>
        </Col>
        <Col span={6}>
          <Title level={5} style={{ color: "#d4d4d4" }}>BUYERS</Title>
          <Text style={textFooterStyle}>Get Started</Text>
          <Text style={textFooterStyle}>Manufacturer Directory</Text>
        </Col>
        <Col span={6}>
          <Title level={5} style={{ color: "#d4d4d4" }}>MANUFACTURERS</Title>
          <Text style={textFooterStyle}>Get Started</Text>
          <Text style={textFooterStyle}>Marketplace Pulse</Text>
        </Col>
        <Col span={6}>
          <Title level={5} style={{ color: "#d4d4d4" }}>LOCATIONS</Title>
          <Text style={textFooterStyle}>California</Text>
          <Text style={textFooterStyle}>Texas</Text>
          <Text style={textFooterStyle}>Ohio</Text>
          <Text style={textFooterStyle}>Florida</Text>
          <Text style={textFooterStyle}>Illinois</Text>
          <Text style={textFooterStyle}>More Locations</Text>
        </Col>
      </Row>
    </AntFooter>
  );
};

export default Footer;
