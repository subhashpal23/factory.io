import React from "react";
import { Typography, Row, Col } from "antd";

const { Text } = Typography;

const TrustedBy = ({ logos }) => {
  return (
    <div style={{ background: "#000", padding: "20px 0", textAlign: "center" }}>
      <Row justify="space-between" align="middle" style={{ marginTop: "10px", padding: "20px 300px"}}  className="trusted-by-row">
      <Text style={{ color: "white", fontSize: "16px" }} className="trusted-by-title">Trusted by:</Text>
        {logos.map((logo, index) => (
          <Col
            key={index}
            span={24 / logos.length} // Dynamically calculate the span for each logo
            style={{ display: "flex", justifyContent: "center"}}
            className="trusted-by-col"
          >
            <img
              src={`/images/brand_logo/logo_${logo}.png`}
              alt={logo}
              style={{ height: "40px" }}
            />
          </Col>
        ))}
      </Row>
      <style jsx>{`
        /* For Mobile Devices (Vertical layout) */
        @media (max-width: 768px) {
          .trusted-by-row {
            flex-direction: column;  /* Stack logos vertically */
            align-items: center;     /* Center logos horizontally */
          }

          .trusted-by-col {
            margin-bottom: 20px; /* Add space between logos in vertical stack */
          }
        }
      `}</style>
    </div>
  );
};

export default TrustedBy;
