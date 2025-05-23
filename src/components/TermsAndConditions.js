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
  margin-bottom: 40px;
`;

const TextWrapper = styled.div`
  max-width: 800px;
  font-size: 1.1rem;
  color: #4b5563;
  line-height: 1.8;
  text-align: left;
`;

const Section = styled.div`
  margin-bottom: 24px;
`;

const HomeLink = styled(Link)`
  background: #0369a1;
  color: white;
  padding: 12px 24px;
  text-decoration: none;
  border-radius: 8px;
  font-weight: 500;
  font-size: 1rem;
  margin-top: 40px;
  transition: background 0.3s ease;

  &:hover {
    background: #024e7c;
  }
`;

const TermsAndConditions = () => {
  return (
    <>
      <TopNavigation />
      <Wrapper>
        <Title>Terms and Conditions</Title>
        <Subtitle>Empowering Buyers and Suppliers with a Smarter RFQ Platform</Subtitle>
        <TextWrapper>
          <Section>
            <strong>1. Introduction</strong>
            <p>
              By accessing and using DigiFactory.io, you agree to be bound by these terms. If you do not agree, please do not use our services.
            </p>
          </Section>

          <Section>
            <strong>2. Account Responsibility</strong>
            <p>
              You are responsible for maintaining the confidentiality of your account and password, and for restricting access to your account.
            </p>
          </Section>

          <Section>
            <strong>3. Platform Usage</strong>
            <p>
              Our platform connects Buyers and Suppliers. Misuse of the platform, including fraud or spam, will result in account suspension or termination.
            </p>
          </Section>

          <Section>
            <strong>4. Intellectual Property</strong>
            <p>
              All content on DigiFactory.io is owned by us or our partners. Unauthorized use is strictly prohibited.
            </p>
          </Section>

          <Section>
            <strong>5. Modifications</strong>
            <p>
              We may modify these terms at any time. Continued use of the site signifies acceptance of any changes.
            </p>
          </Section>

          <Section>
            <strong>6. Contact</strong>
            <p>
              For any questions regarding these terms, please contact us at support@digifactory.io.
            </p>
          </Section>

          <HomeLink to="/">← Back to Home</HomeLink>
        </TextWrapper>
      </Wrapper>
      <Footer />
    </>
  );
};

export default TermsAndConditions;
