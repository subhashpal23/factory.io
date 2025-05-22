import React, { useRef, useEffect } from "react";
import styled from "styled-components";
import { Typography } from "antd";

const { Title } = Typography;

const industries = [
  { name: "Façade Industry", icon: "🚏" },
  { name: "Electronics", icon: "⚡" },
  { name: "Medical", icon: "⚕️" },
  { name: "Stone Industry", icon: "💎" },
  { name: "Woodworking", icon: "🪵" },
  { name: "Aluminum Industry", icon: "🟰" },
  { name: "Glass & Stone industry", icon: "🔋" },
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
  overflow: hidden;
`;

const SliderContainer = styled.div`
  display: flex;
  overflow: hidden;
  scroll-behavior: smooth;
  gap: 20px;
  padding: 20px 0;
  white-space: nowrap;
  position: relative;
  width: 100%;
`;

const Slide = styled.div`
  flex: 0 0 auto;
  width: 150px;
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
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
  font-size: 30px;
`;

const Industry = () => {
  const sliderRef = useRef(null);

  useEffect(() => {
    if (sliderRef.current) {
      const clonedSlides = sliderRef.current.innerHTML;
      sliderRef.current.innerHTML += clonedSlides;
    }

    const scrollSmoothly = () => {
      if (sliderRef.current) {
        if (sliderRef.current.scrollLeft >= sliderRef.current.scrollWidth / 2) {
          sliderRef.current.scrollLeft = 0;
        }
        sliderRef.current.scrollLeft += 1;
      }
    };

    const interval = setInterval(scrollSmoothly, 15);
    return () => clearInterval(interval);
  }, []);

  return (
    <Section id="industries-we-serve">
      <Title level={2} style={{ fontWeight: "bold", color: "#0056b3" }}>
        Industries We Serve
      </Title>
      <SliderContainer ref={sliderRef}>
        {industries.concat(industries).map((industry, index) => (
          <Slide key={index}>
            <IconWrapper>{industry.icon}</IconWrapper>
            <p
              style={{
                fontSize: "16px",
                fontWeight: "bold",
                color: "#0056b3",
              }}
            >
              {industry.name}
            </p>
          </Slide>
        ))}
      </SliderContainer>
    </Section>
  );
};

export default Industry;