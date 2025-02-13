import React from "react";
import { Card, Row, Col, Typography } from "antd";

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
    <div style={{ padding: "50px 200px", textAlign: "center" }}>
      <Title level={1}>Popular Manufacturing Solutions</Title>
      <Row gutter={[16, 16]} justify="center" style={{ marginTop: "50px" }}>
        {manufacturingSolutions.map((solution, index) => (
          <Col xs={24} sm={12} md={8} lg={6} key={index}>
            <Card
              //hoverable={true}
              cover={
                <div
                  style={{
                    backgroundImage: `url(${solution.image})`,
                    backgroundSize: "cover",
                    backgroundPosition: "center",
                    height: "200px", // Adjusted for full height
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    color: "#fff",
                    fontSize: "22px",
                    fontWeight: "bold",
                    textShadow: "1px 1px 5px rgba(0,0,0,0.7)",
                    position: "relative", // Ensures title is placed on top of the image
                  }}
                >
                  <div
                    style={{
                      position: "absolute", // Absolute positioning for the title
                      top: "50%",
                      left: "50%",
                      transform: "translate(-50%, -50%)", // Centers the title both vertically and horizontally
                      padding: "0 10px",
                      //backgroundColor: "rgba(0, 0, 0, 0.5)", // Optional: adds background for better readability
                    }}
                  >
                    {solution.title}
                  </div>
                </div>
              }
              style={{
                borderRadius: "8px",
                overflow: "hidden",
                boxShadow: "0 2px 8px rgba(0,0,0,0.1)", 
              }}
            />
          </Col>
        ))}
      </Row>
    </div>
  );
};

export default PopularSolutions;
