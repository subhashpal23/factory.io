import React from "react";
import { Typography, Row, Col } from "antd";

const { Text } = Typography;

const TrustedBy = ({ logos }) => {
  return (
    <div style={{ background: "#000", padding: "20px 0", textAlign: "center" }}>
      <Row justify="space-between" align="middle" style={{ marginTop: "10px", padding: "20px 300px"}}>
      <Text style={{ color: "white", fontSize: "16px" }}>Trusted by:</Text>
        {logos.map((logo, index) => (
          <Col
            key={index}
            span={24 / logos.length} // Dynamically calculate the span for each logo
            style={{ display: "flex", justifyContent: "center" }}
          >
            <img
              src={`/images/brand_logo/logo_${logo}.png`}
              alt={logo}
              style={{ height: "40px" }}
            />
          </Col>
        ))}
      </Row>
    </div>
  );
};

export default TrustedBy;
