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

const PrivacyPolicy = () => {
  return (
    <>
      <TopNavigation />
      <Wrapper>
        <Title>Privacy Policy</Title>
        <Subtitle>How We Handle Your Data at DigiFactory.io</Subtitle>
        <TextWrapper>
          <Section>
            <strong>1. Information We Collect</strong>
            <p>
              We collect personal information such as your name, email, phone number, and company details during registration and usage of our platform.
            </p>
          </Section>

          <Section>
            <strong>2. How We Use Your Information</strong>
            <p>
              Your data is used to deliver and improve our services, manage user accounts, provide customer support, and send relevant communications.
            </p>
          </Section>

          <Section>
            <strong>3. Data Sharing</strong>
            <p>
              We do not sell your information. We may share data with trusted third parties for operational purposes (e.g., cloud services, analytics) under strict confidentiality agreements.
            </p>
          </Section>

          <Section>
            <strong>4. Security</strong>
            <p>
              We implement security measures such as encryption and access controls to protect your personal data.
            </p>
          </Section>

          <Section>
            <strong>5. Your Rights</strong>
            <p>
              You have the right to access, modify, or delete your personal information. To make a request, contact us at privacy@digifactory.io.
            </p>
          </Section>

          <Section>
            <strong>6. Cookies</strong>
            <p>
              We use cookies to enhance user experience and analyze website traffic. You can manage cookie preferences in your browser settings.
            </p>
          </Section>

          <Section>
            <strong>7. Changes to This Policy</strong>
            <p>
              We may update this Privacy Policy from time to time. Any changes will be posted on this page with an updated date.
            </p>
          </Section>

          <Section>
            <strong>8. Contact</strong>
            <p>
              For any privacy-related concerns, please contact us at: privacy@digifactory.io.
            </p>
          </Section>

          <HomeLink to="/">← Back to Home</HomeLink>
        </TextWrapper>
      </Wrapper>
      <Footer />
    </>
  );
};

export default PrivacyPolicy;
