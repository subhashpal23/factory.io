import React from "react";
import { Box, Grid, Typography } from "@mui/material";
import { fontSize, styled } from "@mui/system";
import { useNavigate } from 'react-router-dom';

const FooterContainer = styled(Box)({
  background: "#0d0f11",
  color: "#fff",
  padding: "5% 0% 8% 16%",
  borderTop: "1px solid gray",
  '@media (max-width: 768px)': {
    padding: "50px", // Adjust padding for smaller screens
    textAlign: "center", // Center content on mobile
    height: '300px',
  }
});


const FooterTitle = styled(Typography)({
  color: "#d4d4d4",
  fontWeight: "bold",
  '@media (max-width: 768px)': {
    fontSize: "20px"
  }
});

const FooterText = styled(Typography)({
  display: "block",
  color: "white",
  padding: "5px 0px",
  '@media (max-width: 768px)': {
    fontSize: "16px"
  }
});

const Footer = () => {
    const navigate = useNavigate();
  return (
    <FooterContainer>
      <Grid container spacing={2}>
        <Grid item xs={12} sm={6} md={4}>
          <Typography variant="h4" style={{ color: "#fff", cursor: "pointer" }} onClick={() => navigate("/")}>
            DigiFactory.ae
          </Typography>
        </Grid>
        <Grid item xs={12} sm={6} md={4}>
          <FooterTitle variant="h6" style={{ color: "#fff", cursor: "pointer" }} onClick={() => navigate("/about-us")}>About Us</FooterTitle>
          {/* <FooterText>Get Started</FooterText>
          <FooterText>Manufacturer Directory</FooterText> */}
        </Grid>
        <Grid item xs={12} sm={6} md={4}>
        <FooterTitle variant="h6" style={{ color: "#fff", cursor: "pointer" }} onClick={() => navigate("/contact-us")}>Contact Us</FooterTitle>
          {/* <FooterTitle variant="h5">MANUFACTURERS</FooterTitle> */}
          {/* <FooterText>Get Started</FooterText>
          <FooterText>Marketplace Pulse</FooterText> */}
        </Grid>
        {/* <Grid item xs={12} sm={6} md={3}>
          // {/* <FooterTitle variant="h6" style={{ color: "#fff", cursor: "pointer" }} onClick={() => navigate("/blog")}>Blog</FooterTitle> */}
          {/* <FooterText>California</FooterText>
          <FooterText>Texas</FooterText>
          <FooterText>Ohio</FooterText>
          <FooterText>Florida</FooterText>
          <FooterText>Illinois</FooterText>
          <FooterText>More Locations</FooterText> */}
        {/* </Grid> */}
      </Grid>
    </FooterContainer>
  );
};

export default Footer;