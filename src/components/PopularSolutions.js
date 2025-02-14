import React from "react";
import { Row, Col, Typography } from "antd";

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

const PopularSolutions = () => {
  return (
    <div style={{ padding: "50px 160px", textAlign: "center", background: "#f8f8f8" }}>
      <Title level={2} style={{ fontWeight: "bold", }}>Popular Manufacturing Solutions</Title>
      <Row gutter={[24, 24]} justify="center" style={{ marginTop: "50px" }}>
        {manufacturingSolutions.map((solution, index) => (
          <Col xs={24} sm={12} md={8} lg={6} key={index}>
            <div
              style={{
                position: "relative",
                borderRadius: "12px",
                overflow: "hidden",
                cursor: "pointer",
                transition: "transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out",
              }}
              onMouseEnter={(e) => {
                e.currentTarget.style.boxShadow = "0px 8px 10px rgba(0, 102, 255, 0.5)";
                e.currentTarget.style.borderTop = "8px solid #0066FF";
              }}
              onMouseLeave={(e) => {
                e.currentTarget.style.boxShadow = "none";
                e.currentTarget.style.borderTop = "none";
              }}
            >
              <img
                src={solution.image}
                alt={solution.title}
                style={{
                  width: "100%",
                  height: "240px",
                  objectFit: "cover",
                  borderRadius: "12px",
                  display: "block",
                }}
              />
              <div
                style={{
                  position: "absolute",
                  top: "24px",
                  left: "8px",
                  //background: "rgba(0, 0, 0, 0.6)", // Dark background for text readability
                  color: "#fff",
                  fontSize: "24px",
                  fontWeight: "bold",
                  padding: "5px 20px",
                  borderRadius: "4px",
                  textAlign: "left"
                }}
              >
                {solution.title}
              </div>
            </div>
          </Col>
        ))}
      </Row>
    </div>
  );
};

export default PopularSolutions;
