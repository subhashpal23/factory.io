import React, { useEffect } from "react";
import styled from "styled-components";
// import DropdownMenu from "./DropdownMenu";
// import ContactSalesSection from "./ContactSalesSection";
// import { useNavigate } from 'react-router-dom';
// import AppHeader from "./AppHeader";
// import { notification } from "antd";
import '@ant-design/v5-patch-for-react-19';
import TopNavigation  from "./TopNavigation";
import HeroSection  from "./HeroSection";
import WhyChoose from "./WhyChoose";
import HowItWorks from "./HowItWorks";
import PlatformFeatures from "./PlatformFeatures";
import TrustedBy from "./TrustedBy"
import ManufacturerSearch from "./ManufacturerSearch"
import PopularSolutions from "./PopularSolutions";
import StepsToManufacture from "./StepsToManufacture";
import BottomHero from "./BottomHero";
import FAQ from "./Faq";
import Footer from "./Footer";
import Industry from "./Industry";



const Header = styled.div`
  background-color: #1e3a8a; 
  color: white; 
  display: flex; 
  align-items: center; 
  justify-content: space-between; 
  padding: 1.9rem 2rem; 
  flex-direction: column; 
  gap: 1rem; 
  margin-left: auto; 
  margin-right: auto; 

  /* Media query for md:flex-row */
  @media (min-width: 768px) {
    flex-direction: row; /* md:flex-row */
    gap: 0; /* gap-0 */
  }
`;


const HeaderText = styled.div`
  font-size: 1.6rem; 
  font-weight: bolder;
`;

const StyledDropdownContainer = styled.div`
  display: none; /* hidden */
  
  @media (min-width: 1024px) { /* lg breakpoint in Tailwind (1024px) */
    display: flex; /* flex */
  }
`;

const ButtonWrapper = styled.div`
  display: flex;
  gap: 1rem; /* space-x-4 in tailwind */
`;


const StyledButton = styled.button`
  border: 1px solid white;
  padding: 0.5rem 1rem; /* px-4 py-2 in tailwind */
  border-radius: 0.5rem; /* rounded-lg in tailwind */
  background-color: transparent;
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    background-color: white;
    color: #1e3a8a; /* blue-900 in tailwind */
  }
`;


const ButtonLoginWrapper = styled.div`
  display: flex;
  gap: 1rem; /* space-x-4 in tailwind */
`;

const StyledLoginButton = styled.button`
  padding: 0.5rem 1rem; /* px-4 py-2 in tailwind */
  border-radius: 0.5rem; /* rounded-lg in tailwind */
  cursor: pointer;
  transition: all 0.3s ease;
`;


const ConsumerButton = styled(StyledLoginButton)`
  border: 1px solid white;
  color: white;
  background-color: transparent;

  &:hover {
    background-color: white;
    color: #1e3a8a; /* blue-900 in tailwind */
  }
`;

// Supplier Login Button with specific styles
const SupplierButton = styled(StyledLoginButton)`
 border: 1px solid #2563eb; 
 background-color: #2563eb; /* bg-blue-600 in tailwind */
  color: white;

  &:hover {
    background-color: #1d4ed8; /* bg-blue-700 in tailwind */
  }
`;

const StyledSection = styled.section`
  display: flex;
  justify-content: center;
  text-align: center;
  width: 100%;
`;

// Styled component for the div
const StyledSectionDiv = styled.div`
  width: 1900px;
  max-width: 100%;
  background-image: url('/assets/hero-background.jpg');
  background-size: cover;
  padding-top: 5rem; /* py-20 in tailwind (20 * 0.25rem = 5rem) */
  padding-bottom: 5rem;
`;


const Welcome = () => {
    //const navigate = useNavigate();
    //const token = localStorage.getItem('access_token');
    //const isUserLoggedIn = !!token;

  

    return <>
        {/* <AppHeader /> */}
        <TopNavigation />
        {/* <section>
            <StyledSection>
                <StyledSectionDiv>
                    <ContactSalesSection />
                </StyledSectionDiv>
            </StyledSection>
        </section> */}
        <HeroSection />
        <WhyChoose />
        <HowItWorks />
        <PlatformFeatures />
        {/* <TrustedBy logos={["dod", "nissan", "gm", "honeywell", "us-army"]}/> */}
        {/* <ManufacturerSearch/> */}
        <PopularSolutions/>
        <Industry/>
        {/* <StepsToManufacture/> */}
        {/* <BottomHero/> */}
        {/* <FAQ/> */}
        <Footer/>
    </>
};

export default Welcome;