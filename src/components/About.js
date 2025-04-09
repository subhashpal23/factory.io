import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import TopNavigation from "./TopNavigation";
import Footer from "./Footer";

const Wrapper = styled.div`
  min-height: 70vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 60px 20px;
  background-color: #f9fafb;
  text-align: center;
`;

const Title = styled.h1`
  font-size: 2.5rem;
  color: #111827;
  margin-bottom: 20px;
`;

const Subtitle = styled.h2`
  font-size: 1.5rem;
  color: #0369a1;
  margin-bottom: 20px;
`;

const Text = styled.p`
  max-width: 800px;
  font-size: 1.1rem;
  color: #4b5563;
  line-height: 1.6;
  margin-bottom: 40px;
`;

const HomeLink = styled(Link)`
  background: #0369a1;
  color: white;
  padding: 12px 24px;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 500;
  font-size: 1rem;
  transition: background 0.3s ease;

  &:hover {
    background: #024e7c;
  }
`;

const About = () => {
  return (
    <>
      <TopNavigation />
    <Wrapper>
      <Title>About Us</Title>
      <Subtitle>Empowering Buyers and Suppliers with a Smarter RFQ Platform</Subtitle>
      <Text>
        DigiFactory.io revolutionizes the manufacturing process by connecting Buyers with trusted Suppliers in a streamlined environment. Whether you're a Buyer seeking competitive quotes or a Supplier looking for opportunities to showcase your expertise, DigiFactory.io is here to simplify your journey.
      </Text>
      {/* <HomeLink to="/">← Back to Home</HomeLink> */}
    </Wrapper>
    <Footer />
    </>
  );
};

export default About;
