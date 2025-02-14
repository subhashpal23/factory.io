import React from "react";
import { Menu, Dropdown, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
import { useDispatch, useSelector } from "react-redux";
import { userLogout } from "../redux/actions/authAction";

const MegaMenuWrapper = styled.div`
  background: #fff;
  padding: 0px 10px;
  width: 100vw;
  display: flex;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
  position: absolute;
  left: 0;
  top: 100%;
  marginTop: 10px;
`;

const MegaMenu = () => {
  const menu = (
    <MegaMenuWrapper>
      <div style={{ flex: 3, display: "flex", justifyContent: "space-between", width: "80%", height: "75vh", padding: "36px 30px", alignItems: "start" }}>
        {[
          {
            title: "Injection Molding Service",
            items: [
              "Plastic Injection Molding",
              "Liquid Silicone Rubber Molding",
              "Overmolding and Insert Molding",
              "Prototyping",
              "Production",
              "Quality",
              "Secondary Operations",
            ],
          },
          {
            title: "CNC Machining Service",
            items: [
              "CNC Milling",
              "CNC Turning",
              "Production Machining",
              "Precision Machining",
              "Threading Options",
              "Finishing Options",
            ],
          },
          {
            title: "3D Printing Service",
            items: [
              "Metal 3D Printing",
              "Stereolithography",
              "Multi Jet Fusion",
              "Selective Laser Sintering",
              "PolyJet",
              "Advanced Photopolymers",
              "Large Format",
              "Inspections",
              "Finishing Options",
            ],
          },
          {
            title: "Sheet Metal Fabrication",
            items: [
              "Laser Cutting",
              "Punching",
              "Forming and Bending",
              "Fabricated Assemblies",
              "Prototyping",
              "Production",
              "Design Guidelines",
              "Quality",
              "Finishing Options",
            ],
          },
        ].map((category, index) => (
          <div key={index}>
            <h2 style={{ color: '#0068AD', fontWeight: 'normal', borderBottom: '1px solid #C3C3C3', textAlign: "left"}}>{category.title}</h2>
            <Menu mode="vertical" style={{ boxShadow: "none",  marginTop: "16px", padding: "0px", textAlign: "start" }}>
              {category.items.map((item, i) => (
                <Menu.Item key={i}>{item}</Menu.Item>
              ))}
            </Menu>
          </div>
        ))}
      </div>

      <div style={{ flex: 1, padding: "40px 50px", width:"80%", borderLeft: "1px solid #ddd", alignItems: "start", backgroundColor:"#F7F7F8" }}>
        <img src="/images/production-order.jpg" alt="Production" style={{ width: "100%", borderRadius: "5px" }} />
        <h2 style={{marginTop:"25px"}}>Ready for Full-Service Production?</h2>
        <p style={{marginTop:"25px", fontSize: "15px" , fontWeight: "semibold"}}>We are your manufacturing partner to scale projects to production. Get complete program management with a team who can tailor our capabilities to optimize cost, quantity, and quality control of your production order.</p>
        <Button type="primary" block style={{marginTop:"40px", background:"#F7F7F8", padding:"24px", border:"1px solid #0068AD", color:"#0068AD"}}>Explore Production</Button>
      </div>
    </MegaMenuWrapper>
  );

  return (
    <Dropdown overlay={menu} trigger={["hover"]} overlayStyle={{
      width: '100%', // Make the menu take full width
      position: 'absolute', // Ensure the menu is placed correctly
      left: '0', // Align the menu to the left of the viewport
      right: '0', // Align the menu to the right of the viewport
      top: '9vh', // Adjust the top position if necessary
      zIndex: 9999, // Ensure the dropdown appears on top of other elements
    }}>
      <Button type="text">
        Services
      </Button>
    </Dropdown>
  );
};

const TopNavigation = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const accessToken = localStorage.getItem("access_token");
  const isUserLoggedIn = !!accessToken;

  const onLogoutClick = () => {
    localStorage.clear();
    dispatch(userLogout());
    navigate("/");
  };

  return (
    <div style={{ background: "#fff", padding: "10px 40px", display: "flex", alignItems: "center", boxShadow: "0 2px 4px rgba(0,0,0,0.1)" }}>
      <div style={{ flex: 1 }}>
        <HeaderText>DigiFactory.io</HeaderText>
      </div>

      <Menu mode="horizontal" style={{ borderBottom: "none", flex: 2 }}>
        <Menu.Item key="services"><MegaMenu /></Menu.Item>
        <Menu.Item key="industries">Industries</Menu.Item>
        <Menu.Item key="resources">Resources</Menu.Item>
        <Menu.Item key="company">Company</Menu.Item>
        <Menu.Item key="contact">Contact</Menu.Item>
      </Menu>

      <div style={{ flex: 1, display: "flex", justifyContent: "flex-end", gap: "15px" }}>
        {isUserLoggedIn ? (
          <ButtonWrapper>
            <StyledButton onClick={onLogoutClick}>Logout</StyledButton>
          </ButtonWrapper>
        ) : (
          <ButtonLoginWrapper>
            <ConsumerButton onClick={() => navigate("/consumer-login")}>Customer Login</ConsumerButton>
            <SupplierButton onClick={() => navigate("/supplier-login")}>Supplier Login</SupplierButton>
          </ButtonLoginWrapper>
        )}
      </div>
    </div>
  );
};

export default TopNavigation;

const HeaderText = styled.div`
  font-size: 1.6rem;
  font-weight: bolder;
`;

const ButtonWrapper = styled.div`
  display: flex;
  gap: 1rem;
`;

const StyledButton = styled.button`
  border: 1px solid white;
  padding: 0.5rem 1rem;
  border-radius: 0.5rem;
  background-color: transparent;
  color: white;
  cursor: pointer;
  transition: all 0.3s ease;

  &:hover {
    background-color: white;
    color: #1e3a8a;
  }
`;

const ButtonLoginWrapper = styled.div`
  display: flex;
  gap: 1rem;
`;

const ConsumerButton = styled(StyledButton)`
  border: 1px solid #2563eb;
  color: #2563eb;
  background-color: transparent;

  &:hover {
    background-color: #2563eb;
    color: white;
  }
`;

const SupplierButton = styled(StyledButton)`
  border: 1px solid #2563eb;
  background-color: #2563eb;
  color: white;

  &:hover {
    background-color: white;
    color: #2563eb;
  }
`;
