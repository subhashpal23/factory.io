import React from "react";
import { Menu, Dropdown, Button } from "antd";
import { DownOutlined } from "@ant-design/icons";
import { useNavigate } from "react-router-dom";
import styled from "styled-components";
//import DropdownMenu from "./DropdownMenu";
import { useDispatch, useSelector } from "react-redux";
// import { userLogout } from "./../redux/actions/authAction";
import { userLogout } from "../redux/actions/authAction";

const MegaMenu = () => {
  const menu = (
    <div
      style={{
        background: "#fff",
        padding: "20px",
        width: "1000px",
        display: "flex",
        boxShadow: "0 2px 8px rgba(0,0,0,0.15)",
      }}
    >
      {/* Left Side Categories */}
      <div style={{ flex: 3, display: "flex", justifyContent: "space-between" }}>
        <div>
          <h3>Injection Molding Service</h3>
          <Menu mode="vertical" style={{boxShadow: "none"}}>
            <Menu.Item>Plastic Injection Molding</Menu.Item>
            <Menu.Item>Liquid Silicone Rubber Molding</Menu.Item>
            <Menu.Item>Overmolding and Insert Molding</Menu.Item>
            <Menu.Item>Prototyping</Menu.Item>
            <Menu.Item>Production</Menu.Item>
            <Menu.Item>Quality</Menu.Item>
            <Menu.Item>Secondary Operations</Menu.Item>
          </Menu>
        </div>

        <div>
          <h3>CNC Machining Service</h3>
          <Menu mode="vertical" style={{boxShadow: "none"}}>
            <Menu.Item>CNC Milling</Menu.Item>
            <Menu.Item>CNC Turning</Menu.Item>
            <Menu.Item>Production Machining</Menu.Item>
            <Menu.Item>Precision Machining</Menu.Item>
            <Menu.Item>Threading Options</Menu.Item>
            <Menu.Item>Finishing Options</Menu.Item>
          </Menu>
        </div>

        <div>
          <h3>3D Printing Service</h3>
          <Menu mode="vertical" style={{boxShadow: "none"}}>
            <Menu.Item>Metal 3D Printing</Menu.Item>
            <Menu.Item>Stereolithography</Menu.Item>
            <Menu.Item>Multi Jet Fusion</Menu.Item>
            <Menu.Item>Selective Laser Sintering</Menu.Item>
            <Menu.Item>PolyJet</Menu.Item>
            <Menu.Item>Advanced Photopolymers</Menu.Item>
            <Menu.Item>Large Format</Menu.Item>
            <Menu.Item>Inspections</Menu.Item>
            <Menu.Item>Finishing Options</Menu.Item>
          </Menu>
        </div>

        <div>
          <h3>Sheet Metal Fabrication</h3>
          <Menu mode="vertical" style={{boxShadow: "none"}}>
            <Menu.Item>Laser Cutting</Menu.Item>
            <Menu.Item>Punching</Menu.Item>
            <Menu.Item>Forming and Bending</Menu.Item>
            <Menu.Item>Fabricated Assemblies</Menu.Item>
            <Menu.Item>Prototyping</Menu.Item>
            <Menu.Item>Production</Menu.Item>
            <Menu.Item>Design Guidelines</Menu.Item>
            <Menu.Item>Quality</Menu.Item>
            <Menu.Item>Finishing Options</Menu.Item>
          </Menu>
        </div>
      </div>

      {/* Right Side CTA */}
      <div style={{ flex: 1, paddingLeft: "20px", borderLeft: "1px solid #ddd" }}>
        <img
          src="/images/production_order_cnc_machining-1-1.jpg" // Replace with actual image
          alt="Production"
          style={{ width: "100%", borderRadius: "5px" }}
        />
        <h3>Ready for Full-Service Production?</h3>
        <p>
          We help scale your projects with expert management and top-quality control.
        </p>
        <Button type="primary" block>
          Explore Production
        </Button>
      </div>
    </div>
  );

  return (
    <Dropdown overlay={menu} trigger={["hover"]}>
      <Button type="text">
        Capabilities <DownOutlined />
      </Button>
    </Dropdown>
  );
};

const TopNavigation = () => {
    const navigate = useNavigate();
    const dispatch = useDispatch();
    const accessToken = localStorage.getItem('access_token');
    const userType = localStorage.getItem('user_type');
    const isUserLoggedIn = !!accessToken; // Boolean check for token presence

    const onLogoutClick = () => {
        localStorage.clear();
        dispatch(userLogout());
        navigate('/')
    }

  return (
    <div style={{ background: "#fff", padding: "10px 40px", display: "flex", alignItems: "center", boxShadow: "0 2px 4px rgba(0,0,0,0.1)" }}>
      {/* Logo */}
      <div style={{ flex: 1 }}>
        <HeaderText>DigiFactory.io</HeaderText>
      </div>

      {/* Menu Items */}
      <Menu mode="horizontal" style={{ borderBottom: "none", flex: 2 }}>
        <Menu.Item key="services">
          <MegaMenu />
        </Menu.Item>
        <Menu.Item key="industries">Industries</Menu.Item>
        <Menu.Item key="resources">Resources</Menu.Item>
        <Menu.Item key="company">Company</Menu.Item>
        <Menu.Item key="company">Contact</Menu.Item>
      </Menu>

      {/* Right Side Actions */}
      <div style={{ flex: 1, display: "flex", justifyContent: "flex-end", gap: "15px" }}>
        {/* <Button type="text">Sign In</Button>
        <Button type="primary">Get Instant Quote</Button> */}
        { !isUserLoggedIn ? <StyledDropdownContainer> 
                </StyledDropdownContainer>: <></> }
                { isUserLoggedIn ? 
                     <ButtonWrapper>
                        <StyledButton onClick={onLogoutClick}>Logout</StyledButton>
                   </ButtonWrapper>
                : <ButtonLoginWrapper>
                     <ConsumerButton onClick={() => navigate('/consumer-login')}>
                        Customer Login
                    </ConsumerButton>
                    <SupplierButton onClick={() => navigate('/supplier-login')}>
                        Supplier Login
                    </SupplierButton>
                  </ButtonLoginWrapper>}
      </div>
    </div>
  );
};

export default TopNavigation;


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
  border: 1px solid #2563eb;
  color: #2563eb;
  background-color: transparent;

  &:hover {
    background-color: #2563eb;
    color: white; /* blue-900 in tailwind */
  }
`;

// Supplier Login Button with specific styles
const SupplierButton = styled(StyledLoginButton)`
 border: 1px solid #2563eb; 
 background-color: #2563eb; /* bg-blue-600 in tailwind */
  color: white;

  &:hover {
    background-color: white; /* bg-blue-700 in tailwind */
    color: #2563eb;
  }
`;
